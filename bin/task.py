from subprocess import call
import os
import re


class Task:

    def __init__(self, network, tech, num_gpu, num_cu, block_size, 
            cpu_bus, protocol):
        self.tech = tech
        self.network = network
        self.num_gpu = num_gpu
        self.num_cu = num_cu
        self.block_size = block_size
        self.cpu_bus = cpu_bus
        self.protocol = protocol

        self.config_name = self.tech + '_' + self.network + '_' + \
                str(self.num_gpu) + 'gpu_' + \
                str(self.num_cu) + 'cu_' + \
                str(self.block_size) + 'B_' + \
                self.cpu_bus + '_' + \
                self.protocol

        self.sub_tasks = []
        self.cycles = []
        self.memcopy_read = []
        self.memcopy_write = []
        self.cycles = []
        self.traffic = []

    def generate_config_file(self):
        print("Generating config file for " + self.config_name)

        call('rm -rf ../config/' + self.config_name, shell=True)
        call('mkdir ../config/' + self.config_name, shell=True)

        original_working_directory = os.getcwd();
        os.chdir('../config/' + self.config_name)

        cpu_bus_bandwidth = 12
        if self.cpu_bus == 'ddr4':
            cpu_bus_bandwidth = 25

        call('config_gen.py '
                '--num-cpu-mem-controller ' + str(2) + ' '
                '--num-gpu ' + str(self.num_gpu) + ' '
                '--num-cu-per-gpu ' + str(self.num_cu) + ' '
                '--network ' + self.network + ' '
                '--gm-block-size ' + str(self.block_size) + ' '
                '--technology ' + self.tech + ' '
                '--cpu-bus-bandwidth ' + str(cpu_bus_bandwidth) + ' '
                '--coherency ' + self.protocol,
                shell=True)         

        os.chdir(original_working_directory)

    def launch(self):
        print("launching " + self.config_name)
        call('./launch_one.sh ' + self.config_name, shell=True)

    def import_result(self):
        print("Retrieving " + self.config_name)

        try:
            self.fetch_raw_result()
            self.get_sub_tasks()
        except:
            print("Task " + self.config_name + " not found \n")
            return

        for i in range(len(self.sub_tasks)):
            sub_task = self.sub_tasks[i]
            if not self.is_crashed(sub_task):
                cycles = self.get_cycles(sub_task)
                self.cycles.append(cycles)

                bytes_read = self.get_memcopy_read(sub_task)
                self.memcopy_read.append(bytes_read)

                bytes_write = self.get_memcopy_write(sub_task)
                self.memcopy_write.append(bytes_write)
            else:
                self.cycles.append(0)
                self.memcopy_read.append(0)
                self.memcopy_write.append(0)

        print self.cycles
        print self.memcopy_read
        print self.memcopy_write
        

    def fetch_raw_result(self):
        call('rm -rf ../result/' + self.config_name, shell=True)
        call('scp -r yifan@nyan.ece.neu.edu:~/m2s-server-kit/run/hetero_' +
                self.config_name + ' ../result > scp.out', 
                shell = True)

    def get_sub_tasks(self):
        self.sub_tasks = os.listdir('../result/hetero_' + self.config_name)
        self.sub_tasks = sorted(self.sub_tasks)
        self.sub_tasks.remove('m2s')
        print(self.sub_tasks)

    def get_cycles(self, sub_task):
        file_name = '../result/hetero_' + self.config_name + '/' \
            + sub_task + '/sim.err'
        try:
            lines = tuple(open(file_name, 'r'))
        except:
            print(file_name + ' not found')
            return

        cycles = 0
        rule = re.compile(r"Cycles = ([0-9]+)")
        inSiSection = False;
        for line in lines:
            if line == "[ SouthernIslands ]\n":
                inSiSection = True;
            if inSiSection:
                match = rule.match(line)
                if not match == None:
                    cycles = int(match.group(1))

        return cycles

    def get_memcopy_write(self, sub_task):
        file_name = '../result/hetero_' + self.config_name + '/' \
            + sub_task + '/ocl.ref'
        try:
            ocl_file = open(file_name, 'r')
            ocl_data = ocl_file.read()
        except:
            print(file_name + ' not found')
            return

        rule = re.compile("OpenCL ABI call 'si_mem_write' \(code 4\)\n\tdevice_ptr = 0[xX][0-9a-fA-F]+, host_ptr = 0[xX][0-9a-fA-F]+, size = ([0-9]+) bytes")
    
        results = rule.findall(ocl_data)
        
        num_bytes = 0
        for result in results:
            num_bytes += int(result)

        return num_bytes
    
    def get_memcopy_read(self, sub_task):
        file_name = '../result/hetero_' + self.config_name + '/' \
            + sub_task + '/ocl.ref'
        try:
            ocl_file = open(file_name, 'r')
            ocl_data = ocl_file.read()
        except:
            print(file_name + ' not found')
            return

        rule = re.compile("OpenCL ABI call 'si_mem_read' \(code 3\)\n\thost_ptr = 0[xX][0-9a-fA-F]+, device_ptr = 0[xX][0-9a-fA-F]+, size = ([0-9]+) bytes")
    
        results = rule.findall(ocl_data)
        
        num_bytes = 0
        for result in results:
            num_bytes += int(result)

        return num_bytes
    



    def is_crashed(self, sub_task):
        file_name = '../result/hetero_' + self.config_name + '/' \
            + sub_task + '/sim.err'
        try:
            lines = tuple(open(file_name, 'r'))
        except:
            print(file_name + ' not found')
            return

        for line in lines:
            if "fatal" in line:
                print("In " + file_name + ": " + line)
                return True

            if "stall" in line:
                print("In " + file_name + ": " + line)
                return True

        return False






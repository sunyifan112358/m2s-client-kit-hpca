#!/usr/bin/python

from task import Task
import sys

tasks = [];

def main():
    if len(sys.argv) != 2:
        help()

    create_tasks()

    if sys.argv[1] == 'import':
        import_results()
    elif sys.argv[1] == 'launch':
        launch_benchmarks()
    else:
        help()

def help():
    print("launch_all.py import|launch")
    sys.exit(0)

def create_tasks():
    '''
    tasks.append(Task('umh', 'p2p', '4', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'p2p', '4', '16', 128, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'p2p', '4', '16', 256, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'p2p', '4', '16', 512, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'p2p', '4', '16', 1024, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'p2p', '4', '16', 2048, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'p2p', '4', '16', 4096, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'p2p', '4', '16', 8192, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'p2p', '4', '16', 16384, 'ddr4', 'NMOESI'))
    '''


    '''
    tasks.append(Task('nc', 'pcie', '1', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('nc', 'pcie', '2', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('nc', 'pcie', '4', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('nc', 'pcie', '8', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('nc', 'pcie', '16', '16', 64, 'ddr4', 'NMOESI'))

    tasks.append(Task('nc', 'p2p', '1', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('nc', 'p2p', '2', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('nc', 'p2p', '4', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('nc', 'p2p', '8', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('nc', 'p2p', '16', '16', 64, 'ddr4', 'NMOESI'))


    tasks.append(Task('zc', 'pcie', '1', '16', 64, 'ddr4', 'NMOESI'))
    '''
    tasks.append(Task('zc', 'pcie', '2', '16', 64, 'ddr4', 'NMOESI'))
    '''
    tasks.append(Task('zc', 'pcie', '4', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('zc', 'pcie', '8', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('zc', 'pcie', '16', '16', 64, 'ddr4', 'NMOESI'))

    tasks.append(Task('zc', 'p2p', '1', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('zc', 'p2p', '2', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('zc', 'p2p', '4', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('zc', 'p2p', '8', '16', 64, 'ddr4', 'NMOESI'))
    tasks.append(Task('zc', 'p2p', '16', '16', 64, 'ddr4', 'NMOESI'))


    tasks.append(Task('umh', 'pcie', '1', '16', 4096, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'pcie', '2', '16', 4096, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'pcie', '4', '16', 4096, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'pcie', '8', '16', 4096, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'pcie', '16', '16', 4096, 'ddr4', 'NMOESI'))

    tasks.append(Task('umh', 'p2p', '1', '16', 4096, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'p2p', '2', '16', 4096, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'p2p', '4', '16', 4096, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'p2p', '8', '16', 4096, 'ddr4', 'NMOESI'))
    tasks.append(Task('umh', 'p2p', '16', '16', 4096, 'ddr4', 'NMOESI'))
    '''




def import_results():
    print("Importing:")
    for task in tasks:
        task.import_result()

def launch_benchmarks():
    for task in tasks:
        task.generate_config_file()
        task.launch()

if __name__ == "__main__":
    main()

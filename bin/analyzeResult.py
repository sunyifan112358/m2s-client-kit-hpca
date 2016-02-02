#!/usr/bin/python

import sys
import re

def get_pcie_traffic(folder, filename):
  try:
    lines = tuple(open(folder + '/' + filename, 'r'))
  except Exception as e:
    return
    
  rule = re.compile(r"pcie-bus_bp_[0-9]+.TransferredBytes = ([0-9]+)")
  packet_rule = re.compile(r"pcie-bus_bp_[0-9]+.TransferredMessages = ([0-9]+)")
  cycleRule = re.compile(r"Cycles = ([0-9]+)")
  transferedBytes = 0;
  transferedPackets = 0;
  cycles = 0;
  for line in lines:
    match = cycleRule.match(line)
    if not match == None:
      cycles = int(match.group(1))

    match = rule.match(line)
    if not match == None:
      transferedBytes += int(match.group(1))

    match = packet_rule.match(line)
    if not match == None:
      transferedPackets += int(match.group(1))

  print folder + " transfered packets : " + str(transferedPackets);
  print folder + " transfered bytes : " + str(transferedBytes);
  print folder + " network cycles : " + str(cycles);

def get_cycle(folder):
  try:
    lines = tuple(open(folder + '/sim.err', 'r'))
  except Exception as e:
    print "sim.err not found"
    return

  rule = re.compile(r"Cycles = ([0-9]+)")
  inSiSection = False;
  for line in lines:
    if line == "[ SouthernIslands ]\n":
      inSiSection = True;
    if inSiSection:
      match = rule.match(line)
      if not match == None:
        cycles = int(match.group(1))
        print folder + " cycles : " + str(cycles);

def get_p2p_traffic(folder, filename):
  try:
    lines = tuple(open(folder + '/' + filename, 'r'))
  except Exception as e:
    return

  byteRule = re.compile(r"TransferredBytes = ([0-9]+)")
  packetRule = re.compile(r"TransferredPackets = ([0-9]+)")
  titleRule = re.compile(r"\[ Network\.si-net-..-..\.Link\.link_<.pu-switch(-[0-9]+)?\.out_buf_[0-9]+>_<.pu-switch*")
  cycleRule = re.compile(r"Cycles = ([0-9]+)")
  inRightSection = False
  transferedBytes = 0;
  transferedMessages = 0;
  cycles = 0;

  for line in lines:

    match = cycleRule.match(line)
    if not match == None: 
      cycles = int(match.group(1))

    if titleRule.match(line):
      inRightSection = True
      continue
    
    if inRightSection:
      match = byteRule.match(line)
      if not match == None:
        inRightSection = False
        transferedBytes += int(match.group(1))
      match = None

      match = packetRule.match(line)
      if not match == None:
        transferedMessages += int(match.group(1));

  print folder + " p2p transfered packets : " + str(transferedMessages);
  print folder + " p2p transfered bytes : " + str(transferedBytes);
  print folder + " p2p network cyles : " + str(cycles);


def checkCrashed(folder):
  try:
    lines = tuple(open(folder + '/sim.err', 'r'))
  except Exception as e:
    print "sim.err not found"
    return True

  for line in lines:
   if "fatal" in line:
     print line
     return True

  return False


def main():
  folder = sys.argv[1]
  if checkCrashed(folder):
    print "Not finished or crashed"
    return

  network_file_name = ""
  if "umh" in folder:
    network_file_name = "si-net-gm-mm_net.ref"
  elif "zc" in folder:
    network_file_name = "si-net-l2-mm_net.ref"
  elif "nc" in folder:
    network_file_name = "si-net-l2-gm_net.ref"

  if "pcie" in folder:
    get_pcie_traffic(folder, network_file_name)
  elif "p2p" in folder:
    get_p2p_traffic(folder, network_file_name)

  get_cycle(folder)


if __name__ == "__main__":
  main();

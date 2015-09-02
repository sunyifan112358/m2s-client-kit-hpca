#!/usr/bin/python

import sys
import re

def getKimTraffic(folder):
  try:
    lines = tuple(open(folder + '/si-net-l2-gm_net.ref', 'r'))
  except Exception as e:
    print "si-net-l2-gm_net.ref not found"
    return
    
  rule = re.compile(r"bus_bp_[0-9]+.TransferredBytes = ([0-9]+)")
  transferedBytes = 0;
  for line in lines:
    match = rule.match(line)
    if not match == None:
      transferedBytes += int(match.group(1))
  print folder + " transfered bytes : " + str(transferedBytes);

def getKimCycles(folder):
  try:
    lines = tuple(open(folder + '/sim.err', 'r'))
  except Exception as e:
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

def getOurTraffic(folder):
  try:
    lines = tuple(open(folder + '/si-net-gm-mm_net.ref', 'r'))
  except Exception as e:
    print "si-net-gm-mm_net.ref not found"
    return

  rule = re.compile(r"bus_bp_[0-9]+.TransferredBytes = ([0-9]+)")
  transferedBytes = 0;
  for line in lines:
    match = rule.match(line)
    if not match == None:
      transferedBytes += int(match.group(1))
  print folder + " transfered bytes : " + str(transferedBytes);

def getOurCycles(folder):
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



def main():
  folder = sys.argv[1]
  getKimTraffic(folder)
  getKimCycles(folder)
  getOurTraffic(folder)
#getOurCycles(folder)


if __name__ == "__main__":
  main();

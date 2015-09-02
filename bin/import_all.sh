#!/bin/bash
cd ../result
rm -rf hetero_kim-8-16cu_PCI
rm -rf hetero_kim-8-16cu_PCI

cd ../bin
./m2s-cluster.sh import -a hetero_kim-8-16cu_PCI &
./m2s-cluster.sh import -a hetero_ours-8-16cu_PCI

cd ../result
./analyzeResults.sh hetero_kim-8-16cu_PCI/
./analyzeResults.sh hetero_ours-8-16cu_PCI/

KEEP_RECORD="keep"
if [ "$1" -eq "$KEEP_RECORD" ]
then
  ./analyzeResults.sh hetero_kim-8-16cu_PCI/ >$(date +%Y%m%d%H%M%S)_kim-8-16cu_PCI.out
  ./analyzeResults.sh hetero_ours-8-16cu_PCI/ >$(date +%Y%m%d%H%M%S)_ours-8-16cu_PCI.out
fi

#!/bin/bash

CONFIGS="
hetero_kim-8-16cu-msi_PCI
hetero_kim-8-16cu-nsi_PCI
hetero_ours-8-16cu-msi-64_PCI
hetero_ours-8-16cu-msi-128_PCI
hetero_ours-8-16cu-msi-256_PCI
hetero_ours-8-16cu-msi-512_PCI
hetero_ours-8-16cu-msi-1024_PCI
hetero_ours-8-16cu-msi-2048_PCI
hetero_ours-8-16cu-msi-4096_PCI
hetero_ours-8-16cu-nsi-64_PCI
hetero_ours-8-16cu-nsi-128_PCI
hetero_ours-8-16cu-nsi-256_PCI
hetero_ours-8-16cu-nsi-512_PCI
hetero_ours-8-16cu-nsi-1024_PCI
hetero_ours-8-16cu-nsi-2048_PCI
"

for config in $CONFIGS
do

  echo $config
  rm -rf ../result/"$config"
  scp -r amir@nyan.ece.neu.edu:~/m2s-server-kit/run/$config ../result > scp.out

  ./analyzeResults.sh ../result/$config/
done

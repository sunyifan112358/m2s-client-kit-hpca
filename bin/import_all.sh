#!/bin/bash

CONFIGS="
hetero_ours-8-16cu-msi-64-pho
hetero_ours-8-16cu-nsi-64-pho
hetero_kim-8-16cu-msi-nvlink-zc
hetero_kim-8-16cu-nsi-nvlink-zc
hetero_kim-8-16cu-msi
hetero_kim-8-16cu-nsi
hetero_kim-8-16cu-msi-pciph
hetero_kim-8-16cu-nsi-pciph
hetero_kim-8-16cu-msi-pcie-zc
hetero_kim-8-16cu-nsi-pcie-zc
hetero_ours-8-16cu-msi-64
hetero_ours-8-16cu-msi-128_PCI
hetero_ours-8-16cu-msi-256_PCI
hetero_ours-8-16cu-msi-512_PCI
hetero_ours-8-16cu-msi-1024_PCI
hetero_ours-8-16cu-msi-2048_PCI
hetero_ours-8-16cu-msi-4096_PCI
hetero_ours-8-16cu-nsi-64
hetero_ours-8-16cu-nsi-128_PCI
hetero_ours-8-16cu-nsi-256_PCI
hetero_ours-8-16cu-nsi-512_PCI
hetero_ours-8-16cu-nsi-1024_PCI
hetero_ours-8-16cu-nsi-2048_PCI
hetero_ours-8-16cu-nsi-4096_PCI
hetero_kim-8-16cu-msi-nvlink
hetero_kim-8-16cu-nsi-nvlink
hetero_ours-8-16cu-msi-64-nvlink
hetero_ours-8-16cu-nsi-64-nvlink
hetero_ours-8-16cu-msi-128-nvlink
hetero_ours-8-16cu-nsi-128-nvlink
"

for config in $CONFIGS
do

  echo $config
  rm -rf ../result/"$config"
  scp -r amir@nyan.ece.neu.edu:~/m2s-server-kit/run/$config ../result > scp.out

  ./analyzeResults.sh ../result/$config/
done

#!/bin/bash

CONFIGS="
hetero_kim-8-16cu-nsi-nvlink-zc-l2d2
hetero_kim-8-16cu-nsi-nvlink-zc-l2d4
hetero_kim-8-16cu-nsi-nvlink-zc-l2d8
hetero_kim-8-16cu-nsi-nvlink-zc-l2d16
hetero_ours-8-16cu-nsi-64-pho-l2d2
hetero_ours-8-16cu-nsi-64-pho-l2d4
hetero_ours-8-16cu-nsi-64-pho-l2d8
hetero_ours-8-16cu-nsi-64-pho-l2d16
hetero_kim-4-16cu-nsi-nvlink-zc-ph
hetero_kim-2-16cu-nsi-nvlink-zc-ph
hetero_kim-4-16cu-nsi
hetero_kim-2-16cu-nsi
hetero_ours-8-16cu-msi-64-pho
hetero_ours-8-16cu-nsi-64-pho
hetero_ours-4-16cu-msi-64-pho
hetero_ours-4-16cu-nsi-64-pho
hetero_ours-2-16cu-msi-64-pho
hetero_ours-2-16cu-nsi-64-pho
hetero_kim-8-16cu-msi-nvlink-zc
hetero_kim-8-16cu-nsi-nvlink-zc
hetero_kim-8-16cu-nsi-nvlink-ph
hetero_kim-8-16cu-nsi-nvlink-zc-ph
hetero_kim-8-16cu-msi
hetero_kim-8-16cu-nsi
hetero_kim-8-16cu-msi-pciph
hetero_kim-8-16cu-nsi-pciph
hetero_kim-8-16cu-msi-pcie-zc
hetero_kim-8-16cu-nsi-pcie-zc
hetero_kim-8-16cu-nsi-pcie-zc-ph
hetero_ours-8-16cu-msi-64
hetero_ours-8-16cu-nsi-64
hetero_ours-8-16cu-msi-64-nvlink
hetero_ours-8-16cu-nsi-64-nvlink
hetero_ours-8-16cu-nsi-128-pho
hetero_ours-8-16cu-nsi-256-pho
hetero_ours-8-16cu-nsi-512-pho
hetero_ours-8-16cu-nsi-1024-pho
hetero_ours-8-16cu-nsi-2048-pho
hetero_ours-8-16cu-nsi-4096-pho
"

for config in $CONFIGS
do

  echo $config
  rm -rf ../result/"$config"
  scp -r amir@nyan.ece.neu.edu:~/m2s-server-kit/run/$config ../result > scp.out

  ./analyzeResults.sh ../result/$config/
done

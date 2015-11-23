#!/bin/bash

CONFIGS="
hetero_ours-4-16cu-nsi-4096-nvlink
hetero_ours-4-16cu-nsi-4096
hetero_kim-4-16cu-nsi-nvlink-zc
hetero_kim-4-16cu-nsi-pcie-zc
"

for config in $CONFIGS
do

  echo $config
  rm -rf ../result/"$config"
  scp -r amir@nyan.ece.neu.edu:~/m2s-server-kit/run/$config ../result > scp.out

  ./analyzeResults.sh ../result/$config/
done

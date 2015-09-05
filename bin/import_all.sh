#!/bin/bash

CONFIGS="
hetero_kim-8-16cu-nsi_PCI
hetero_kim-8-16cu-msi_PCI
hetero_ours-8-16cu-nsi_PCI
hetero_ours-8-16cu-msi_PCI
hetero_ours-8-16cu-msi-64_PCI
hetero_ours-8-16cu-msi-128_PCI
hetero_ours-8-16cu-msi-256_PCI
hetero_ours-8-16cu-msi-512_PCI
"

for config in $CONFIGS
do
  echo $config
  rm -rf ../result/"$config"
  scp -r amir@nyan.ece.neu.edu:~/m2s-server-kit/run/$config ../result > scp.out

  ./analyzeResults.sh ../result/$config/

  KEEP_RECORD="keep"
  if [ "$1" == "$KEEP_RECORD" ]
  then
  ./analyzeResults.sh $config/ >$(date +%Y%m%d%H%M%S)_$config.out
  fi


done

#!/bin/bash

CONFIGS="
hetero_kim-8-16cu-nsi_PCI
hetero_kim-8-16cu-msi_PCI
hetero_ours-8-16cu-nsi_PCI
hetero_ours-8-16cu-msi_PCI
"

cd ../result
for config in $CONFIGS
do
  echo $config
  rm -rf "$config"
  scp -r amir@nyan.ece.neu.edu:~/m2s-server-kit/run/$config . > scp.out
  ../bin/analyzeResults.sh $config/

  KEEP_RECORD="keep"
  if [ "$1" == "$KEEP_RECORD" ]
  then
  ../bin/analyzeResults.sh $config/ >$(date +%Y%m%d%H%M%S)_$config.out
  fi

done

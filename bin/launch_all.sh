#/bin/bash

TASKS="
umh_p2p_4gpu_nsi_64
umh_p2p_4gpu_nsi_128
umh_p2p_4gpu_nsi_256
umh_p2p_4gpu_nsi_512
umh_p2p_4gpu_nsi_1024
uhh_p2p_4gpu_nsi_2048
umh_p2p_4gpu_nsi_4096
zc_p2p_4gpu_nsi_64
nc_p2p_4gpu_nsi_64
"

for task in $TASKS
do
  cd ../config/$task
  rm mem-config.ini
  rm net-config.ini
  ./config_gen.sh
  if [[ $task == *"msi"* ]]
  then
    echo "Copy moesi version m2s"
    cp ~/m2s-moesi m2s
  else
    echo "Copy nmoesi version m2s"
    cp ~/m2s-nmoesi m2s
  fi

  cd ../../bin
  ./launch_one.sh $task
done

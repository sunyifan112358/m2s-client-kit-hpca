#/bin/bash

TASKS="
umh_p2p_1gpu_nsi_4096_ddr4
umh_p2p_2gpu_nsi_4096_ddr4
umh_p2p_4gpu_nsi_4096_ddr4
umh_p2p_8gpu_nsi_4096_ddr4
umh_p2p_16gpu_nsi_4096_ddr4
zc_p2p_1gpu_nsi_64_ddr4
zc_p2p_2gpu_nsi_64_ddr4
zc_p2p_4gpu_nsi_64_ddr4
zc_p2p_8gpu_nsi_64_ddr4
zc_p2p_16gpu_nsi_64_ddr4
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

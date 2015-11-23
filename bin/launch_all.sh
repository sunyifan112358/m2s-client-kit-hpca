#/bin/bash

TASKS="
kim-4-16cu-nsi-pcie-zc
kim-4-16cu-nsi-nvlink-zc
ours-4-16cu-nsi-4096
ours-4-16cu-nsi-4096-nvlink
"

for task in $TASKS
do
  cd ../config/$task
  rm mem-si.ini
  rm net-si.ini
  ./config-gen.py
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

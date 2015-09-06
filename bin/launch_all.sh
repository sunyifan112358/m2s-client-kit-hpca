#/bin/bash

TASKS="
kim-8-16cu-msi
kim-8-16cu-nsi
ours-8-16cu-msi-64
ours-8-16cu-msi-128
ours-8-16cu-msi-256
ours-8-16cu-msi-512
ours-8-16cu-msi-1024
ours-8-16cu-msi-2048
ours-8-16cu-msi-4096
ours-8-16cu-nsi-64
ours-8-16cu-nsi-128
ours-8-16cu-nsi-256
ours-8-16cu-nsi-512
ours-8-16cu-nsi-1024
ours-8-16cu-nsi-2048
ours-8-16cu-nsi-4096
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

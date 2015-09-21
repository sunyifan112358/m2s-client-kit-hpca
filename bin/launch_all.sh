#/bin/bash

TASKS="
ours-4-16cu-nsi-64-pho
ours-2-16cu-nsi-64-pho
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

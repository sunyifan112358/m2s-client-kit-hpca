#!/bin/bash

rm -rf ../config
mkdir ../config
mkdir ../config/kim-8-16cu-nsi
mkdir ../config/kim-8-16cu-msi
mkdir ../config/ours-8-16cu-nsi
mkdir ../config/ours-8-16cu-msi

cp ~/HetroPaper/Kim-8-16CU-SI/*.ini ../config/kim-8-16cu-nsi/
cp ~/HetroPaper/Kim-8-16CU-SI/*.ini ../config/kim-8-16cu-msi/
cp ~/HetroPaper/Ours-8-16-CU-SI/*.ini ../config/ours-8-16cu-msi/
cp ~/HetroPaper/Ours-8-16-CU-SI/*.ini ../config/ours-8-16cu-nsi/

cp ~/m2s-nmoesi ../config/kim-8-16cu-nsi/m2s 
cp ~/m2s-moesi ../config/kim-8-16cu-msi/m2s 
cp ~/m2s-nmoesi ../config/ours-8-16cu-nsi/m2s 
cp ~/m2s-moesi ../config/ours-8-16cu-msi/m2s 

./launch_kim_moesi.sh kim-8-16cu-nsi
./launch_kim_moesi.sh ours-8-16cu-nsi
#./launch_kim_moesi.sh ours-8-16cu-msi
#./launch_kim_moesi.sh kim-8-16cu-msi

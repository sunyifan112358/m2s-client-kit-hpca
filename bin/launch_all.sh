#!/bin/bash

cp ~/HetroPaper/Kim-8-16CU-SI/*.ini ../config/kim-8-16cu/
cp ~/HetroPaper/Ours-8-16-CU-SI/*.ini ../config/ours-8-16cu/

./launch_kim_moesi.sh kim-8-16cu
./launch_kim_moesi.sh ours-8-16cu

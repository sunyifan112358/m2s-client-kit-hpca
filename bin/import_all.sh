#!/bin/bash


CONFIGS="
pcie_umh_4gpu_16cu_8192B_ddr3_nsi
p2p_nc_1gpu_16cu_64B_ddr3_nsi
p2p_nc_2gpu_16cu_64B_ddr3_nsi
p2p_nc_4gpu_16cu_64B_ddr3_nsi
p2p_nc_8gpu_16cu_64B_ddr3_nsi
p2p_nc_16gpu_16cu_64B_ddr3_nsi
p2p_nc_1gpu_16cu_64B_ddr4_nsi
p2p_nc_2gpu_16cu_64B_ddr4_nsi
p2p_nc_4gpu_16cu_64B_ddr4_nsi
p2p_nc_8gpu_16cu_64B_ddr4_nsi
p2p_nc_16gpu_16cu_64B_ddr4_nsi
p2p_umh_4gpu_16cu_4096B_ddr3_nsi
"

for config in $CONFIGS
do
  config=hetero_$config
  echo $config
  rm -rf ../result/"$config"
  scp -r yifan@nyan.ece.neu.edu:~/m2s-server-kit/run/$config ../result > scp.out

  ./analyzeResults.sh ../result/$config/
done

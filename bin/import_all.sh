#!/bin/bash


# umh_pcie_4gpu_nsi_64
# umh_pcie_4gpu_nsi_128
# umh_pcie_4gpu_nsi_256
# umh_pcie_4gpu_nsi_512
# umh_pcie_4gpu_nsi_1024
# umh_pcie_4gpu_nsi_2048
# umh_pcie_4gpu_nsi_4096

CONFIGS="
umh_p2p_4gpu_nsi_64
umh_p2p_4gpu_nsi_128
umh_p2p_4gpu_nsi_256
umh_p2p_4gpu_nsi_512
umh_p2p_4gpu_nsi_1024
umh_p2p_4gpu_nsi_2048
umh_p2p_4gpu_nsi_4096
zc_pcie_4gpu_nsi_64
zc_p2p_4gpu_nsi_64
nc_pcie_4gpu_nsi_64
nc_p2p_4gpu_nsi_64
"

for config in $CONFIGS
do
  config=hetero_$config
  echo $config
  rm -rf ../result/"$config"
  scp -r yifan@nyan.ece.neu.edu:~/m2s-server-kit/run/$config ../result > scp.out

  ./analyzeResults.sh ../result/$config/
done

#!/bin/bash


# umh_pcie_4gpu_nsi_64
# umh_pcie_4gpu_nsi_128
# umh_pcie_4gpu_nsi_256
# umh_pcie_4gpu_nsi_512
# umh_pcie_4gpu_nsi_1024
# umh_pcie_4gpu_nsi_2048
# umh_pcie_4gpu_nsi_4096
# umh_p2p_4gpu_nsi_64
# umh_p2p_4gpu_nsi_128
# umh_p2p_4gpu_nsi_256
# umh_p2p_4gpu_nsi_512
# umh_p2p_4gpu_nsi_1024
# umh_p2p_4gpu_nsi_2048
# umh_p2p_4gpu_nsi_4096
# nc_p2p_4gpu_nsi_64
 


CONFIGS="
zc_pcie_4gpu_nsi_64
zc_p2p_4gpu_nsi_64
umh_p2p_1gpu_nsi_4096
umh_p2p_2gpu_nsi_4096
umh_p2p_8gpu_nsi_4096
umh_p2p_16gpu_nsi_4096
umh_pcie_1gpu_nsi_4096
umh_pcie_2gpu_nsi_4096
umh_pcie_8gpu_nsi_4096
umh_pcie_16gpu_nsi_4096
zc_p2p_1gpu_nsi_64
zc_p2p_2gpu_nsi_64
zc_p2p_8gpu_nsi_64
zc_p2p_16gpu_nsi_64
zc_pcie_1gpu_nsi_64
zc_pcie_2gpu_nsi_64
zc_pcie_8gpu_nsi_64
zc_pcie_16gpu_nsi_64
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

for config in $CONFIGS
do
  config=hetero_$config
  echo $config
  rm -rf ../result/"$config"
  scp -r yifan@nyan.ece.neu.edu:~/m2s-server-kit/run/$config ../result > scp.out

  ./analyzeResults.sh ../result/$config/
done

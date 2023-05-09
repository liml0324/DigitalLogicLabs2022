-makelib ies_lib/xpm -sv \
  "D:/Program_files/Vivado/2021.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Program_files/Vivado/2021.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/Program_files/Vivado/2021.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_4 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Experiment_6.gen/sources_1/ip/VRAM/sim/VRAM.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib


vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vcom -work xil_defaultlib -64 \
"../../../../MB_LED.srcs/sources_1/ip/lite_slv_LFSR_0/src/LFSR_v1.vhd" \
"../../../../MB_LED.srcs/sources_1/ip/lite_slv_LFSR_0/hdl/lite_slv_LFSR_v1_0_S00_AXI.vhd" \
"../../../../MB_LED.srcs/sources_1/ip/lite_slv_LFSR_0/hdl/lite_slv_LFSR_v1_0.vhd" \
"../../../../MB_LED.srcs/sources_1/ip/lite_slv_LFSR_0/sim/lite_slv_LFSR_0.vhd" \



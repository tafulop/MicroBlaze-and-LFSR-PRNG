vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../ip/axi_lite_LFSR_PRNG_0/src/LFSR_v1.vhd" \
"../../../ip/axi_lite_LFSR_PRNG_0/hdl/axi_lite_LFSR_PRNG_v1_0_S00_AXI.vhd" \
"../../../ip/axi_lite_LFSR_PRNG_0/hdl/axi_lite_LFSR_PRNG_v1_0.vhd" \
"../../../ip/axi_lite_LFSR_PRNG_0/sim/axi_lite_LFSR_PRNG_0.vhd" \



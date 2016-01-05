onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib axi_lite_LFSR_PRNG_0_opt

do {wave.do}

view wave
view structure
view signals

do {axi_lite_LFSR_PRNG_0.udo}

run -all

quit -force

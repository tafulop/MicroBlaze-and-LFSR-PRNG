onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib lite_slv_LFSR_0_opt

do {wave.do}

view wave
view structure
view signals

do {lite_slv_LFSR_0.udo}

run -all

quit -force

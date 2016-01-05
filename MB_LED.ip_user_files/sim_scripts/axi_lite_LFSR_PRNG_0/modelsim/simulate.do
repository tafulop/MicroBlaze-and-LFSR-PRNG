onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L secureip -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.axi_lite_LFSR_PRNG_0

do {wave.do}

view wave
view structure
view signals

do {axi_lite_LFSR_PRNG_0.udo}

run -all

quit -force

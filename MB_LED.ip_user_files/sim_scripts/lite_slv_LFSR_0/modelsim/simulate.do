onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L secureip -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.lite_slv_LFSR_0

do {wave.do}

view wave
view structure
view signals

do {lite_slv_LFSR_0.udo}

run -all

quit -force

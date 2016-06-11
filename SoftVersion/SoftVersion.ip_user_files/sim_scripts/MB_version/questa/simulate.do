onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib MB_version_opt

do {wave.do}

view wave
view structure
view signals

do {MB_version.udo}

run -all

quit -force

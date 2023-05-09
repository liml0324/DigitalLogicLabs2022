onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+PCLK -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.PCLK xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {PCLK.udo}

run -all

endsim

quit -force

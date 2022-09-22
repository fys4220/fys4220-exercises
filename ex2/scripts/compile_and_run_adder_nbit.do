if ![ file exists work ] {
        vlib work
}
vmap work work

vcom -2008 ../src/adder_nbit.vhd
vcom -2008 ../src/full_adder.vhd
vcom -2008 ../src/adder_nbit.vhd
vcom -2008 ../tb/adder_nbit_tb.vhd
 
vsim -voptargs=+acc adder_nbit_tb

view wave
delete wave *
add wave -label A /adder_nbit_tb/A
add wave -label B /adder_nbit_tb/B
add wave -label SUM /adder_nbit_tb/SUM
add wave -label COUT /adder_nbit_tb/COUT

run -all

wave zoom full

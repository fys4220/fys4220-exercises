if ![ file exists work ] {
        vlib work
}
vmap work work

vcom -2008 ../src/half_adder.vhd
vcom -2008 ../src/full_adder.vhd
vcom -2008 ../src/adder_4bit.vhd
vcom -2008 ../tb/adder_4bit_tb.vhd

vsim -voptargs=+acc adder_4bit_tb

view wave
delete wave *
add wave -label A /adder_4bit_tb/A
add wave -label B /adder_4bit_tb/B
add wave -label SUM /adder_4bit_tb/SUM
add wave -label COUT /adder_4bit_tb/COUT

run -all

wave zoom full


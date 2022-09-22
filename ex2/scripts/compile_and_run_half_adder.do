if ![ file exists work ] {
        vlib work
}
vmap work work

vcom -2008 ../src/half_adder.vhd
vcom -2008 ../tb/half_adder_tb.vhd

df
vsim -voptargs=+acc half_adder_tb

view wave
delete wave *
add wave -label A /half_adder_tb/A
add wave -label B /half_adder_tb/B
add wave -label SUM /half_adder_tb/SUM
add wave -label COUT /half_adder_tb/COUT

run -all

wave zoom full



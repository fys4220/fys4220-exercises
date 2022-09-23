if ![ file exists work ] {
        vlib work
}
vmap work work

vcom -2008 ../src/half_adder.vhd
vcom -2008 ../src/full_adder.vhd
vcom -2008 ../tb/full_adder_tb.vhd

vsim -voptargs=+acc full_adder_tb

view wave
delete wave *
add wave -divider FULL_ADDER
add wave -label A /full_adder_tb/A
add wave -label B /full_adder_tb/B
add wave -label SUM /full_adder_tb/SUM
add wave -label COUT /full_adder_tb/COUT
add wave -label CIN /full_adder_tb/CIN

add wave -divider HALF_ADDER_1
add wave -label A /full_adder_tb/dut/comp_ha1/A
add wave -label B /full_adder_tb/dut/comp_ha1/B
add wave -label SUM /full_adder_tb/dut/comp_ha1/SUM
add wave -label COUT /full_adder_tb/dut/comp_ha1/COUT


add wave -divider HALF_ADDER_2
add wave -label A /full_adder_tb/dut/comp_ha2/A
add wave -label B /full_adder_tb/dut/comp_ha2/B
add wave -label SUM /full_adder_tb/dut/comp_ha2/SUM
add wave -label COUT /full_adder_tb/dut/comp_ha2/COUT


run -all

wave zoom full



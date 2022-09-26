do compile.do
vsim -voptargs="+acc" tx_fsm_tb
do wave.do
run -all


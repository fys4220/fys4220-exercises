view wave
delete wave *

add wave -divider TX_FSM_TB
add wave -label clk /tx_fsm_tb/clk
add wave -label areset_n /tx_fsm_tb/areset_n

add wave -divider TX_FSM
add wave -label tx_data_valid /tx_fsm_tb/dut/tx_data_valid
add wave -label tx_complete /tx_fsm_tb/dut/tx_complete
add wave -label tx_enable /tx_fsm_tb/dut/tx_enable
add wave -label tx_busy /tx_fsm_tb/dut/tx_busy
add wave -label state /tx_fsm_tb/dut/state


wave zoom full

# Create new project, force overwrite
# Create two revisions to demonstrate
# manual instantiation and for-generate instantiation
project_new counter -revision counter -overwrite


# Set device family and part, output directory
set_global_assignment -name FAMILY "MAX 10"
set_global_assignment -name DEVICE 10M50DAF484C7G
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files

# Assign pins 


set_location_assignment PIN_A8 -to led[0]
set_location_assignment PIN_A9 -to led[1]
set_location_assignment PIN_A10 -to led[2]
set_location_assignment PIN_B10 -to led[3]
set_location_assignment PIN_D13 -to led[4]
set_location_assignment PIN_C13 -to led[5]
set_location_assignment PIN_E14 -to led[6]
set_location_assignment PIN_D14 -to led[7]

set_location_assignment PIN_P11 -to clk
set_location_assignment PIN_B8 -to reset_n
set_location_assignment PIN_A7 -to enable_n

set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED"

# Assign VHDL files
set_global_assignment -name VHDL_FILE ../../ex2/src/half_adder.vhd
set_global_assignment -name VHDL_FILE ../../ex2/src/full_adder.vhd
set_global_assignment -name VHDL_FILE ../../ex2/src/adder_nbit.vhd
set_global_assignment -name VHDL_FILE ../src/counter.vhd
# Timing
set_global_assignment -name SDC_FILE counter.sdc

# Close project
project_close


# Create new project, force overwrite
project_new full_adder -revision full_adder -overwrite

# Set device family and part, output directory
set_global_assignment -name FAMILY "MAX 10"
set_global_assignment -name DEVICE 10M50DAF484C7G
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files


# Assign VHDL files

set_global_assignment -name VHDL_FILE ../src/half_adder.vhd
set_global_assignment -name VHDL_FILE ../src/full_adder.vhd

# Assign pins 
set_location_assignment PIN_C10 -to A
set_location_assignment PIN_C11 -to B
set_location_assignment PIN_A8 -to sum
set_location_assignment PIN_A9 -to cout
set_location_assignment PIN_D12 -to cin
set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED"

project_close


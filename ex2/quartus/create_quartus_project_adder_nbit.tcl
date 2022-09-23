# Create new project, force overwrite
# Create two revisions to demonstrate
# manual instantiation and for-generate instantiation
project_new adder_nbit -revision adder_nbit -overwrite


# Set device family and part, output directory
set_global_assignment -name FAMILY "MAX 10"
set_global_assignment -name DEVICE 10M50DAF484C7G
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files

# Assign pins 
set_location_assignment PIN_C10 -to A[0]
set_location_assignment PIN_C11 -to A[1]
set_location_assignment PIN_D12 -to A[2]
set_location_assignment PIN_C12 -to A[3]

set_location_assignment PIN_A12 -to B[0]
set_location_assignment PIN_B12 -to B[1]
set_location_assignment PIN_A13 -to B[2]
set_location_assignment PIN_A14 -to B[3]

set_location_assignment PIN_A8 -to sum[0]
set_location_assignment PIN_A9 -to sum[1]
set_location_assignment PIN_A10 -to sum[2]
set_location_assignment PIN_B10 -to sum[3]

set_location_assignment PIN_D13 -to cout
set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED"

# Assign VHDL files
set_global_assignment -name VHDL_FILE ../src/half_adder.vhd
set_global_assignment -name VHDL_FILE ../src/full_adder.vhd
set_global_assignment -name VHDL_FILE ../src/adder_nbit.vhd

# Close project
project_close


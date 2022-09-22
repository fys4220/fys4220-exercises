# Create project and revision for first sub-exercise
project_new adder -revision half_adder -overwrite

# Create a list of common settings for all revisions
# Assign family, device and output directory
#set tcl_cmds [list [list set_global_assignment -name FAMILY "MAX 10"] \
#[list set_global_assignment -name DEVICE 10M50DAF484C7G] \
#[list set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files] \
#[list set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED"]]


set tcl_common_cmds [ list [list set_global_assignment -name FAMILY "MAX 10"] \
                           [list set_global_assignment -name DEVICE 10M50DAF484C7G] \
                           [list set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files] \
                           [list set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED"]]
# Set the common assignments
execute_assignment_batch $tcl_common_cmds

# Assign VHDL files
set_global_assignment -name VHDL_FILE ../src/half_adder.vhd

# Assign pins for half_adder revision
set_location_assignment PIN_C10 -to A
set_location_assignment PIN_C11 -to B
set_location_assignment PIN_A8 -to sum
set_location_assignment PIN_A9 -to cout


# Create additional revisions for full_adder and set to current active revision
create_revision full_adder -based_on half_adder -set_current

# Set the common assignments
execute_assignment_batch $tcl_common_cmds

# Assign VHDL files
set_global_assignment -name VHDL_FILE ../src/half_adder.vhd

# Assign pins for half_adder revision
set_location_assignment PIN_C10 -to A
set_location_assignment PIN_C11 -to B
set_location_assignment PIN_A8 -to sum
set_location_assignment PIN_A9 -to cout
set_location_assignment PIN_D12 -to cin


project_close

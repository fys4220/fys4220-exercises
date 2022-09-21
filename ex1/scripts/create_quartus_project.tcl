# Create new project, force overwrite to
# recreate project everytime the script is run
project_new ex1 -revision ex1 -overwrite


# Set device family and part, output directory
set_global_assignment -name FAMILY "MAX 10"
set_global_assignment -name DEVICE 10M50DAF484C7G
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files

# Source pinning file
source ../scripts/de10-lite-pinning.tcl

# VHDL source files
set_global_assignment -name VHDL_FILE ../src/ex1.vhd

# Close project
project_close


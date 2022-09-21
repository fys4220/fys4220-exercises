# EX1: Your first FPGA project


This is the solution example for EX1 in FYS4220.

Exercise description: https://fys4220.github.io/part-exercises/exercises_your_first_fpga_project.html


## Create and compile project

To create the project run the *create_quartus_project.tcl* script from the *quartus* folder.

```
cd quartus
quartus_sh -t ../script/create_quartus_project_tcl
```

This create the Quartus project files *ex1.qpf* and *ex1.qsf*. 

To compile the project and generate the programming file run the following command in the quartus folder:

```
quartus_sh --flow compile ex1
```

This compiles the project and synthesizes the design into hardware and a programming file.

To program the FPGA from the command line use the following command from the quartus folder:

```
quartus_pgm -m jtag -o "p;output_files/ex1.sof" 
```


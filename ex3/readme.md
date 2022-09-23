# EX2: 4-bit up-counter

This is the solution example for EX3 in FYS4220.

Exercise description: https://fys4220.github.io/part-exercises/exercises_counter.html

## Simulation

Open Modelsim and run the following command from the sim folder

```
do compile_and_run_counter.do
```

## Synthesis

Create the Quartus project and synthesize the design. Run the following scripts in the 
quartus folder.
```
quartus_sh -t create_project_counter.tcl
quartus_sh --flow compile counter
```

Program the FPGA

```
quartus_pgm -m jtag -o "p;output_files/counter.sof"
```



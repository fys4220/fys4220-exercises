# EX2: Adder

This is the solution example for EX1 in FYS4220.

Exercise description: https://fys4220.github.io/part-exercises/exercises_adder.html


## EX2.A: 1-bit half adder

* Source files:
  * src/half_adder.vhd
  * tb/half_adder_tb.vhd

### Simulation

To compile and run the simulation open Modelsim/Questasim and run the *compile_and_run.do_half_adder.do* from with in the *sim* folder.

```
mkdir sim
cd sim
do ../scripts/compile_and_run_half_adder.do
```

If the simulation is run using Questasim, adding the argument *-voptarg=+acc*  will keep Questasim from optimizing which signals and ports that will be available to be visualized in the wave diagram. This optimization can help to speed up the simulation, since the value of all internal signals will not be stored for debugging. However, the simulations performed here are not very complex and simulation time is not an issue. If you are using the Modelsim starter edition this argument is ignore, and all ports and signals are visible by default. 



### Synthesis in Quartus

To compile and synthesize the half adder run the following commands from the quartus folder.

```
mkdir quartus
cd quartus
quartus_sh -t ../create_quartus_project_half_adder.tcl
quartus_sh --flow compile half_adder
```

To program the FPGA

```
quartus_pgm -m jtag -o "p;output_files/half_adder.sof"
```

## EX2.B 1-bit full adder


* Source files:
  * src/half_adder.vhd
  * src/full_adder.vhd
  * tb/full_adder_tb.vhd


### Simulation
To compile and run the simulation open Modelsim/Questasim and run the *compile_and_run.do_full_adder.do* from with in the *sim* folder.

```
mkdir sim
cd sim
do ../scripts/compile_and_run_full_adder.do
```

### Synthesis in Quartus

To compile and synthesize the half adder run the following commands from the quartus folder.

```
mkdir quartus
cd quartus
quartus_sh -t ../create_quartus_project_full_adder.tcl
quartus_sh --flow compile full_adder
```

To program the FPGA

```
quartus_pgm -m jtag -o "p;output_files/full_adder.sof"
```


## EX2.C 4-bit full adder

* Source files:
  * src/half_adder.vhd
  * src/full_adder.vhd
  * src/adder_4bit.vhd
  * tb/adder_4bit_tb.vhd


### Simulation
To compile and run the simulation open Modelsim/Questasim and run the *compile_and_run.do_adder_4bit.do* from with in the *sim* folder.

```
mkdir sim
cd sim
do ../scripts/compile_and_run_adder_4bit.do
```

### Synthesis in Quartus

To compile and synthesize the half adder run the following commands from the quartus folder.

```
mkdir quartus
cd quartus
quartus_sh -t ../create_quartus_project_adder_4bit.tcl
quartus_sh --flow compile adder_4bit
```

To program the FPGA

```
quartus_pgm -m jtag -o "p;output_files/adder_4bit.sof"
```


## EX2 Bonus exercise: n-bit adder

* Source files:
  * src/half_adder.vhd
  * src/full_adder.vhd
  * src/adder_nbit.vhd
  * tb/adder_nbit_tb.vhd

### Simulation
To compile and run the simulation open Modelsim/Questasim and run the *compile_and_run.do_half_adder.do* from with in the *sim* folder.

```
mkdir sim
cd sim
do ../scripts/compile_and_run_adder_nbit.do
```

### Synthesis in Quartus

To compile and synthesize the half adder run the following commands from the quartus folder.

```
mkdir quartus
cd quartus
quartus_sh -t ../create_quartus_project_adder_nbit.tcl
quartus_sh --flow compile adder_nbit
```

To program the FPGA

```
quartus_pgm -m jtag -o "p;output_files/adder_nbit.sof"
```






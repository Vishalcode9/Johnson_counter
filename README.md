## Johnson Counter ##
## Introduction ##
Ring counter is like a shift counter where the output of the last flip-flop is connected to the input of the first flip-flop.
With a certain type of connections and changing ORI(over ride inputs), clock pulse forms a ring like structure. Thus the
name ”Ring counter”. Johnson’s counter is a modified ring counter. In this counter,
the complimented output of the last flip-flop is given as the input to the first flip-flop. Johnson’s counter consists
of a common clock to activate all the flip-flops, so it is a
synchronous counter. For a 4 bit counter, 4 D flip-flops are used. In a Johnson’s
counter, the number of states is double the number of flip-flops used unlike a ring counter where number of flip-flops used is
same as the number of states. This is an advantage for the Johnson’s counter.  It roughly consumes 80-100 mW of power and runs at a clock frequency of 36 MHz.
<p align="center">
  <img  src="/images/1.png">
</p>

## Working ##
The clock and ORI is connected to all the flip-flops, it is a synchronous counter. Here the ORI is connected to
Clear(CLR) to all the flip-flops where as in ring counter PR of first flip-flop will be connected. When PR is 0 output is 1
and when CLR is 0 output is 0.
So, the outputs of every flip-flop is going to be 0 when ORI low is given. But as inverted output of last flip-flop is taken
as input to the first flip-flop, the input of the first flip-flop is now going to be 1 and 0 for the other 3 flip-flops. Then ORI
is made to high and apply low clock pulse signal as the Clock (CLK) is negative edge activated. A 4-bit Johnson ring counter
passes blocks of four logic “0” and then four logic “1” thereby producing an 8-bit pattern. This way, 8 states are going to be
created unlike ring counter which only creates 4 states.
The Johnson counter can also be designed by using D or JK flip flop. This is better than ring counter as it gives double
states for the number of flip-flopes used. 
<p align="center">
  <img  src="/images/2.png">
</p>
<p align="center">
  <img  src="/images/3.png">
</p>
## Applications of Johnson counter ##
1. Johnson counter is used as a synchronous decade counter or divider circuit.
2. It is used in hardware logic design to create complicated Finite states machine. ex: ASIC and FPGA design.
3. The 3 stage Johnson counter is used as a 3 phase square wave generator which produces 1200 phase shift.
4. It is used to divide the frequency of the clock signal by varying their feedback.
5. A stepper motor controller.

## Block Diagram of Johnson Counter ##

<p align="center">
  <img  src="/images/5.png">
</p>

## Tool Installation Details ##
 #### 1.About iverilog ####
Icarus Verilog is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format.
#### 2.About gtkwave ####
GTKWave is a fully featured GTK+ based wave viewer for Unix, Win32, and Mac OSX which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing.
#### 3. Installing iverilog and gtkwave ####
     $ sudo apt-get install git 
     $ sudo apt-get install iverilog 
     $ sudo apt-get install gtkwave
 
#### 4. Executing the project ####
     $   git clone https://github.com/vamsidhar32/SISO_shift-Register
     $   cd SISO_shift-register
     $   iverilog iiitb_SISO_Shiftregister.v iiitb_SISO_Shiftregister_tb.v
     $   ./a.out
     $   gtkwave test1.vcd
 #### Synthesis of verilog code ####
 About Yosys
           Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for           various application domains.
           
    to synthesize
    $   yosys
    $   yosys>    script yosys_run.sh
  
  
    o see different types of cells after synthesys
      $   yosys>    stat
    to generate schematics
    $   yosys>    show
 
 
 ## Functional Characteristics ##
    Simulation results of Shift register.
    We can observe the shifting of serial input data.
    Test bench is given according to the graph.
    
    
    <p align="center">
  <img  src="/images/presynth.jpeg">
  </p>
  
  ## SYNTHESIS ##
  
  #### Synthesis: ####
  Synthesis transforms the simple RTL design into a gate-level netlist with all the constraints as specified by the designer. In simple language, Synthesis is a process that converts the abstract form of design to a properly implemented chip in terms of logic gates.
  Synthesis takes place in multiple steps:

  1)Converting RTL into simple logic gates.
  2)Mapping those gates to actual technology-dependent logic gates available in the technology libraries.
  3)Optimizing the mapped netlist keeping the constraints set by the designer intact.
  
  #### Yosys Synthesizer ####
  It is a tool we use to convert out RTL design code to netlist. Yosys is the tool I've used in this project.
  
  The commands to get the yosys is given below:
  
  
    git clone https://github.com/YosysHQ/yosys.git
    make
    sudo make install make test
    
  Now you need to create a yosys_run.sh file , which is the yosys script file used to run the synthesis. The contents of the yosys_run file are given below:
  
  
    read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    read_verilog iiitb_jc.v
    synth -top iiitb_rv32i	
    dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    clean
    flatten
    write_verilog -noattr iiitb_jc_synth.v
    
  Now, in the terminal of your verilog files folder, run the following commands:
  
  
    yosys
    yosys -s yosys_run.sh
    
  
  Now the synthesized netlist is written in "iiitb_jc_synth.v" file.
  
  #### GATE LEVEL SIMULATION(GLS) ####
  
  GLS is generating the simulation output by running test bench with netlist file generated from synthesis as design under test. Netlist is logically same as RTL code, therefore, same test bench can be used for it.We perform this to verify logical correctness of the design after synthesizing it. Also ensuring the timing of the design is met. Folllowing are the commands to run the GLS simulation:
  
  
    iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 ../verilog_model/primitives.v ../verilog_model/sky130_fd_sc_hd.v iiitb_jc_synth.v iiitb_jc_tb.v
    ./a.out
    gtkwave iiitb_jc.vcd
    
 
 The gtkwave output for the netlist should match the output waveform for the RTL design file. As netlist and design code have same set of inputs and outputs, we can use the same testbench and compare the waveforms.
 
 <p align="center">
  <img  src="/images/glsbigpic.jpeg">
</p>



 <p align="center">
   <img  src="/images/stat.jpeg">
</p>


The output waveform of the synthesized netlist are given below:
 <p align="center">
    <img  src="/images/postsynth.jpeg">
</p>


 ## Docker installation ##
 $ sudo apt-get remove docker docker-engine docker.io containerd runc (removes older version of docker if installed)

 $ sudo apt-get update

 $ sudo apt-get install
 ca-certificates
 curl
 gnupg
 lsb-release

 $ sudo mkdir -p /etc/apt/keyrings

 $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

 $ echo
 "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu
 $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

 $ sudo apt-get update

 $ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

 $ apt-cache madison docker-ce (copy the version string you want to install)

 $ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io docker-compose-plugin (paste the version string copies in place of    <VERSION_STRING>)

 $ sudo docker run hello-world (If the docker is successfully installed u will get a success message here)
 
 ## Openlane installation ##
 $ git clone https://github.com/The-OpenROAD-Project/OpenLane.git

 $ cd OpenLane/

 $ make

 $ make test
 
 ## magic installation ##
 For Magic to be installed and work properly the following softwares have to be installed first:

Installing csh $ sudo apt-get install csh

Installing x11/xorg $ sudo apt-get install x11

$ sudo apt-get install xorg

$ sudo apt-get install xorg openbox

Installing GCC $ sudo apt-get install gcc

Installing build-essential $ sudo apt-get install build-essential

Installing OpenGL $ sudo apt-get install freeglut3-dev

Installing tcl/tk $ sudo apt-get install tcl-dev tk-dev

Installing magic After all the softwares are installed, run the following commands for installing magic
$ git clone https://github.com/RTimothyEdwards/magic

$ cd magic

$ ./configure

$ make

$ make install

Klayout Installation $ sudo apt-get install klayout

ngspice Installation $ sudo apt-get install ngspice

## PRE SYNTHESIS ##
-To clone the repository, download the netlist files and simulate the results, Enter the following commands in your terminal:

$ git clone https://github.com/DantuNandiniDevi/iiitb_freqdiv

$ cd iiitb_freqdiv

$ iverilog -o iiitb_freqdiv_out.out iiitb_freqdiv.v iiitb_freqdiv_tb.v

$ ./iiitb_freqdiv_out.out

$ gtkwave iiitb_freqdiv_vcd.vcd

## POST SYNTHESIS ##

$ yosys

yosys> read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

yosys> read_verilog iiitb_freqdiv.v

yosys> synth -top iiitb_freqdiv

yosys> dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

yosys> abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

yosys> stat

yosys> show

yosys> write_verilog iiitb_freqdiv_netlist.v

$ iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 ../verilog_model/primitives.v ../verilog_model/sky130_fd_sc_hd.v iiitb_freqdiv_netlist.v iiitb_freqdiv_tb.v

$ ./a.out

$ gtkwave iiitb_freqdiv_vcd.vcd

** CREATING CUSTOM INVERTER CELL** $ git clone https://github.com/nickson-jose/vsdstdcelldesign.git

$ cd vsdstdcelldesign

$ cp ./libs/sky130A.tech sky130A.tech
$ magic -T sky130A.tech sky130_inv.mag &

<p align="center">
  <img  src="/images/magic spice.png">
</p>

The above layout will open. The design can be verified and various layers can be seen and examined by selecting the area of examination and type what in the tcl window.

To extract Spice netlist, Type the following commands in tcl window.

% extract all

% ext2spice cthresh 0 rthresh 0

% ext2spice

(cthresh 0 rthresh 0 is used to extract parasitic capacitances from the cell.)

<p align="center">
  <img  src="/images/spice.png">
</p>

Open the terminal in the directory where ngspice is stored and type the following command, ngspice console will open:

$ ngspice sky130_inv.spice
<p align="center">
  <img  src="/images/ngspice.png">
</p>

Now you can plot the graphs for the designed inverter model.

-> plot y vs time a

<p align="center">
  <img  src="/images/plot.png">
</p>

Four timing parameters are used to characterize the inverter standard cell:

Rise time: Time taken for the output to rise from 20% of max value to 80% of max value Rise time = (2.23843 - 2.17935) = 59.08ps Fall time- Time taken for the output to fall from 80% of max value to 20% of max value Fall time = (4.09291 - 4.05004) = 42.87ps Cell rise delay = time(50% output rise) - time(50% input fall) Cell rise delay = (2.20636 - 2.15) = 56.36ps Cell fall delay = time(50% output fall) - time(50% input rise) Cell fall delay = (4.07479 - 4.05) = 24.79ps

## Layout ##

The layout is generated using OpenLane. To run a custom design on openlane, Navigate to the openlane folder and run the following commands:

$ cd designs

$ mkdir iiitb_jc

$ cd iiitb_jc

$ mkdir src

$ touch config.json

$ cd src

$ touch iiitb_jc.v

The iiitb_jc.v file should contain the verilog RTL code you have used and got the post synthesis simulation for.

Copy sky130_fd_sc_hd__fast.lib, sky130_fd_sc_hd__slow.lib, sky130_fd_sc_hd__typical.lib and sky130_vsdinv.lef files to src folder in your design.

Results All the results are in run folder,synthesis,placement,floor,routing reports are present. The following codes for running are run_synthesis run_floor run_placement run_cts run_routing

<p align="center">
  <img  src="/images/placement.png">
</p>

<p align="center">
  <img  src="/images/routing.png">
</p>

## Reports ##

<p align="center">
  <img  src="/images/fpca.jpeg">
</p>

<p align="center">
  <img  src="/images/fpda.jpeg">
</p>

<p align="center">
  <img  src="/images/synprest.jpeg">
</p>

<p align="center">
  <img  src="/images/syntharest.jpeg">
</p>

There is no inverter cell used in the design, so inverter cell is not located.

 
    
 ## Contributors ##
 Vishal Cheeti
 
 Kunal Gosh
    
    
 ## Acknowledgements ##
 Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.
 
 Madhav Rao, Associate Professor, IIIT Bangalore
 
 
 ## Contact Information ##
 Vishal Cheeti, imtech2020 Student, International Institute of Information Technology, Bangalore , Vishal.Cheeti@iiitb.ac.in
 
 Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com
 
 ## References ##
 
 https://verilogcodes.blogspot.com/2015/10/verilog-code-for-4-bit-johnson-counter.html
 
 https://www.elprocus.com/what-is-johnson-counter-circuit-diagram-truth-table-its-applications/
 
 https://www.javatpoint.com/johnson-counter-in-digital-electronics
 
 https://www.electronics-tutorials.ws/sequential/seq_6.html
 
 
   
   
 

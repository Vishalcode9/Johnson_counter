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
 
 
   
   
 

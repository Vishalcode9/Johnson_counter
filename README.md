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
 
 
   
   
 

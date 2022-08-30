# read design

read_verilog iiitb_jc.v

# generic synthesis
synth -top iiitb_jc

# mapping to mycells.lib
dfflibmap -liberty /home/visshall/Downloads/asic/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty /home/visshall/Downloads/asic/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

clean
flatten
# write synthesized design
write_verilog -noattr synth_iiitb_jc.v

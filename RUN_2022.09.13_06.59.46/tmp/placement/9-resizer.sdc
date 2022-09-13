###############################################################################
# Created by write_sdc
# Tue Sep 13 07:00:10 2022
###############################################################################
current_design iiitb_jc
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {reset}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q[6]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {q[7]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {q[7]}]
set_load -pin_load 0.0334 [get_ports {q[6]}]
set_load -pin_load 0.0334 [get_ports {q[5]}]
set_load -pin_load 0.0334 [get_ports {q[4]}]
set_load -pin_load 0.0334 [get_ports {q[3]}]
set_load -pin_load 0.0334 [get_ports {q[2]}]
set_load -pin_load 0.0334 [get_ports {q[1]}]
set_load -pin_load 0.0334 [get_ports {q[0]}]
set_driving_cell -lib_cell sky130_vsdinv -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_vsdinv -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 10.0000 [current_design]

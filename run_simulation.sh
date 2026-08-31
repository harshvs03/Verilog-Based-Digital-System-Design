#!/bin/bash
mkdir -p simulation
iverilog -o simulation/digital_system_sim rtl/*.v tb/digital_system_tb.v
vvp simulation/digital_system_sim
echo "Simulation completed. Open digital_system.vcd using GTKWave."

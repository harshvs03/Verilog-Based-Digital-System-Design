# Verilog-Based Digital System Design

A modular RTL-based digital system designed and verified using Verilog HDL.

## Project Overview
This project implements a small digital control system consisting of:
- 4-bit ALU
- Finite State Machine (FSM) controller
- Register bank
- Top-level digital system
- Self-checking Verilog testbench
- MATLAB waveform analysis and visualization

## Tools
- Verilog HDL
- Icarus Verilog / ModelSim / Vivado
- GTKWave
- MATLAB

## Directory Structure
```text
Verilog_Digital_System_Design/
├── rtl/
│   ├── alu_4bit.v
│   ├── register_4bit.v
│   ├── controller_fsm.v
│   └── digital_system.v
├── tb/
│   └── digital_system_tb.v
├── matlab/
│   └── plot_waveforms.m
├── simulation/
│   └── run_simulation.sh
└── README.md
```

## ALU Operations
| Opcode | Operation |
|---|---|
| 000 | ADD |
| 001 | SUB |
| 010 | AND |
| 011 | OR |
| 100 | XOR |
| 101 | NOT A |

## Verification
The testbench applies reset, arithmetic operations, logic operations, and FSM control sequences. Waveform analysis can be performed using GTKWave. MATLAB can be used to visualize exported simulation data.

## How to Simulate
Using Icarus Verilog:

```bash
iverilog -o simulation/digital_system_sim rtl/*.v tb/digital_system_tb.v
vvp simulation/digital_system_sim
```

If a VCD file is generated:

```bash
gtkwave digital_system.vcd
```

## Learning Outcomes
- RTL design methodology
- Combinational and sequential logic
- FSM design
- Modular Verilog coding
- Testbench development
- Functional verification
- Waveform-based debugging

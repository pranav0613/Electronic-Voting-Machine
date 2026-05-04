# Electronic-Voting-Machine
Synthesizable Verilog implementation of a 3-candidate Electronic Voting Machine (EVM) with 8-bit synchronous counters and testbench verification.

## 📖 Project Overview
This project features the digital logic design and RTL verification of a 3-candidate Electronic Voting Machine (EVM). The system processes synchronous voting inputs and securely increments 8-bit counting registers, preventing race conditions through clock-edge synchronization.

## 🛠️ Technical Stack
Hardware Description Language: Verilog HDL

Verification: Custom Testbench with VCD waveform generation

Prototyping: Structural gate-level validation


##  💻 RTL Architecture
The core logic is written in synthesizable Verilog (EVM_design.v).

Inputs: Global Clock (clk), Active-high Reset (reset), and 3 independent voting buttons (vote_btn1, vote_btn2, vote_btn3).

Outputs: Three parallel 8-bit registers (count1, count2, count3) capable of storing up to 255 votes per candidate.

Logic: Synchronous, positive-edge triggered increment logic.

Logic Prototyping
Initial structural validation of the voting mechanism and state control.


## 🧪 Testbench & Verification
A comprehensive verification environment (EVM_tb.v) was authored to stimulate the design and validate state transitions.

Simulation Scenario Tested:

Global system reset applied.

Candidate 1 receives 5 sequential votes.

Candidate 2 receives 3 sequential votes.

Candidate 3 receives 2 sequential votes.

Simulation Analysis
Simulation results confirming correct 8-bit counter increments corresponding to specific button assertions.


## 🚀 Key Learning Outcomes
Designed synchronous digital architectures avoiding latch generation.

Handled multi-bit register manipulations (8-bit counters) in Verilog.

Authored automated testbenches for functional verification and waveform debugging.

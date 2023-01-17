# Experiment 5: 7-segment displays

Introduces students to 7-segment displays and counters. This only implements one digit form 0 to 9.

### Contents:

- Nexys-A7-100T-Master.xdc: Board contraints file
- top.vhd: Main VHDL file that contains instances of Clock Divider and BCD Decoder
- bcd_decoder.vhd: BCD Decoder component file
- clk_divider.vhd: Clock Divider component file
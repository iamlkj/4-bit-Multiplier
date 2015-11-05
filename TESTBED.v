
`timescale 1ns/10ps
`include "mul_4bits.v"
//`include "./Netlist/mul_4bits_SYN.v"
`include "PATTERN.v"

module TESTBED;

//---------------------------------------------------------------------
// DUMP WAVEFORM
//---------------------------------------------------------------------

initial begin
  $fsdbDumpfile("mul_4bits.fsdb");
  $fsdbDumpvars;
  //$sdf_annotate("./Netlist/mul_4bits_SYN.sdf",top);
end

//---------------------------------------------------------------------
//WIRE AND REG DECLARATION
//---------------------------------------------------------------------

wire [3:0] IN1;
wire [3:0] IN2;
wire [7:0] OUT1;

//---------------------------------------------------------------------
// MODULE INSTANTIATION
//---------------------------------------------------------------------

PATTERN PATTERN
(
  .in1(IN1),
  .in2(IN2),
  .mout1(OUT1)
);

mul_4bits top
(
  .x(IN1),
  .y(IN2),
  .out(OUT1)
);

endmodule

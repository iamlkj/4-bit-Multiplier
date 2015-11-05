`include "full_adder.v"
// a 4-bit unsigned array multiplier
module mul_4bits(x, y, out);
// inputs and outputs
input   [3:0] x, y;
output [7:0] out;
wire a1,a2,a3,a4,b1,b2,b3,b4,c1,c2,c3,c4,d1,d2,d3,d4;
wire o2,o3,o4,o6,o7,o8,o10,o11,o12;
wire r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15;
assign a1=x[0]&y[0];
assign a2=x[1]&y[0];
assign a3=x[2]&y[0];
assign a4=x[3]&y[0];
assign b1=x[0]&y[1];
assign b2=x[1]&y[1];
assign b3=x[2]&y[1];
assign b4=x[3]&y[1];
assign c1=x[0]&y[2];
assign c2=x[1]&y[2];
assign c3=x[2]&y[2];
assign c4=x[3]&y[2];
assign d1=x[0]&y[3];
assign d2=x[1]&y[3];
assign d3=x[2]&y[3];
assign d4=x[3]&y[3];

full_adder FA1(.a(a1),.b(1'b0),.cin(1'b0),.s(out[0]),.cout(r1));
full_adder FA2(.a(a2),.b(1'b0),.cin(r1),.s(o2),.cout(r2));
full_adder FA3(.a(a3),.b(1'b0),.cin(r2),.s(o3),.cout(r3));
full_adder FA4(.a(a4),.b(1'b0),.cin(r3),.s(o4),.cout(r4));
full_adder FA5(.a(b1),.b(o2),.cin(1'b0),.s(out[1]),.cout(r5));
full_adder FA6(.a(b2),.b(o3),.cin(r5),.s(o6),.cout(r6));
full_adder FA7(.a(b3),.b(o4),.cin(r6),.s(o7),.cout(r7));
full_adder FA8(.a(b4),.b(r4),.cin(r7),.s(o8),.cout(r8));
full_adder FA9(.a(c1),.b(o6),.cin(1'b0),.s(out[2]),.cout(r9));
full_adder FA10(.a(c2),.b(o7),.cin(r9),.s(o10),.cout(r10));
full_adder FA11(.a(c3),.b(o8),.cin(r10),.s(o11),.cout(r11));
full_adder FA12(.a(c4),.b(r8),.cin(r11),.s(o12),.cout(r12));
full_adder FA13(.a(d1),.b(o10),.cin(1'b0),.s(out[3]),.cout(r13));
full_adder FA14(.a(d2),.b(o11),.cin(r13),.s(out[4]),.cout(r14));
full_adder FA15(.a(d3),.b(o12),.cin(r14),.s(out[5]),.cout(r15));
full_adder FA16(.a(d4),.b(r12),.cin(r15),.s(out[6]),.cout(out[7]));

endmodule
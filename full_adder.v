// a 1-bit full adder
module full_adder(a, b, cin, s, cout);
// inputs and outputs
input   a, b, cin;
output s,cout;
wire p,g;
assign p=a^b;
assign g=a&b;
assign s=p^cin;
assign cout=g|(p&cin);

endmodule

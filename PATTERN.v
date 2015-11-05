
module PATTERN(in1,in2,mout1);

//---------------------------------------------------------------------
// INPUT AND OUTPUT DECLARATION
//---------------------------------------------------------------------

  output [3:0] in1;
  output [3:0] in2;

  input [7:0] mout1;

//---------------------------------------------------------------------
// WIRE AND REG DECLARATION
//---------------------------------------------------------------------

  parameter CYCLE = 100;
  parameter NUM = 20;	// the number of execute
  integer k,e;
 
  reg CLK;  
  reg [3:0] in1;
  reg [3:0] in2;

  wire [7:0] mout1;
  
  reg delay;
  
  wire [7:0] eout;

  assign eout=in1*in2;
//---------------------------------------------------------------------
// CLOCK GENERATION
//---------------------------------------------------------------------
  initial CLK = 0;
  always #(50)    CLK = ~ CLK;
  
//---------------------------------------------------------------------
// TEST PATTERN
//---------------------------------------------------------------------

always @ ( posedge CLK )
	begin
		if (delay==1'b0)
			begin
				delay <= 1'b1;
			end
		in1<=$random;
		in2<=$random;
	end


always @ ( posedge CLK )
	begin
		if(delay)
			begin
			$display( "OUT:%b  ANS:%b",mout1,eout);
			if (mout1!==eout)
				begin
					$display( "Different in K:%d ",k);
					$display( "OUT:%b  ANS:%b",mout1,eout);
					$display( "!!!!!!!!!!!!!!!!!!!!!!!!!!");
					e=e+1;
				end
			k=k+1;
			end
	end

initial
    begin
	  in1=0;
	  in2=0;
      delay = 0;
      k=0;e=0;
      #((NUM+1)*CYCLE);
      $display("INCORRECT:%d ",e);
	  if (e==0)
		$display("Good!just do it!!\n" );
      $finish;
end

endmodule	

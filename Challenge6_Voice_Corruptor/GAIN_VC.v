module GAIN_VC (clk, enable, t1, t2, t3, t4, GAIN);

input clk;
input enable;
input t1;
input t2;
input t3;
input t4;
output [7:0] GAIN;

reg [7:0] GAIN;
reg [7:0] MID1,MID2, MID3, MID4;
initial MID1 = 0;
initial MID2 = 1;
initial MID3 = 8'd131;
initial MID4 = 0;

always @ (posedge clk)
  begin
  if(enable == 1'b1)begin
     if(t1 == 1'b1) begin
	     MID1 <= MID1+1'b1;
		  GAIN <= MID1;
		  MID2 <= 1;
		  MID3 <= 8'd131;
		  MID4 <= 0;
		  end
	  if(t2 == 1'b1) begin
	     MID2 <= MID2;
		  GAIN<= MID2;
		  MID1 <= 0;
		  MID3 <= 8'd131;
		  MID4 <= 0;
		  end
	  if(t3 == 1'b1) begin
	     MID3 <= MID3-1;
		  GAIN <= MID3;
		  MID1 <= 0;
		  MID2 <= 1;
		  MID4 <= 0;
		  end
	  if(t4 == 1'b1) begin
	     MID4 <= 0;
		  GAIN <= MID4;
		  MID1 <= 0;
		  MID2 <= 1;
		  MID3 <= 8'd131;
		  end
  end
  end
endmodule
		  
		  
		  
		  
		  
	     
module G_A_B (clk, A, AB, B, BA, GAIN1, GAIN2, q_sig_KA, q_sig_KB, GA, GB);
input clk;
input A;
input AB;
input B;
input BA;
input [6:0] GAIN1, GAIN2;
input [7:0] q_sig_KA, q_sig_KB;
output[7:0] GA, GB;
reg   [6:0] GA, GB;

always @ (posedge clk)

begin
   if(A == 1'b1) begin
	  GA <= q_sig_KA*GAIN1;
	  //GB = q_sig_KB*GAIN2;
	  end
	if(AB == 1'b1) begin
	  if(GAIN1 >= 7'd115)begin
	     GA <= q_sig_KA >> 1;end
	  else if(GAIN1 >= 7'd99)begin
	     GA <= q_sig_KA >> 2;end
	  else if(GAIN1 >= 7'd83)begin
	     GA <= q_sig_KA >> 3;end
	  else if(GAIN1 >= 7'd67)begin
	     GA <= q_sig_KA >> 4;end
	  else if(GAIN1 >= 7'd51)begin
	     GA <= q_sig_KA >> 5;end
	  else if(GAIN1 >= 7'd35)begin
	     GA <= q_sig_KA >> 6;end
	  else if(GAIN1 >= 7'd19)begin
	     GA <= q_sig_KA >> 7;end
	  else if(GAIN1 >= 7'd3) begin
	     GA <= q_sig_KA >> 8;end
	  end
   if(B == 1'b1)begin
	  GA <= q_sig_KA*GAIN1;end
	if(BA == 1'b1)begin
	  if(GAIN1 >= 7'd115)begin
	     GA <= q_sig_KA >> 1;end
	  else if(GAIN1 >= 7'd99)begin
	     GA <= q_sig_KA >> 2;end
	  else if(GAIN1 >= 7'd83)begin
	     GA <= q_sig_KA >> 3;end
	  else if(GAIN1 >= 7'd67)begin
	     GA <= q_sig_KA >> 4;end
	  else if(GAIN1 >= 7'd51)begin
	     GA <= q_sig_KA >> 5;end
	  else if(GAIN1 >= 7'd35)begin
	     GA <= q_sig_KA >> 6;end
	  else if(GAIN1 >= 7'd19)begin
	     GA <= q_sig_KA >> 7;end
	  else if(GAIN1 >= 7'd3) begin
	     GA <= q_sig_KA >> 8;end
	  end  
   //GAIN KB  
	if(B == 1'b1)begin
	  GB <= q_sig_KB*GAIN2;end
	  //GB = q_sig_KB*GAIN2;
	if(AB == 1'b1)begin
	  if(GAIN1 >= 7'd115)begin
	     GB <= q_sig_KB >> 1;end
	  else if(GAIN2 >= 7'd99)begin
	     GB <= q_sig_KB >> 2;end
	  else if(GAIN2 >= 7'd83)begin
	     GB <= q_sig_KB >> 3;end
	  else if(GAIN2 >= 7'd67)begin
	     GB <= q_sig_KB >> 4;end
	  else if(GAIN2 >= 7'd51)begin
	     GB <= q_sig_KB >> 5;end
	  else if(GAIN2 >= 7'd35)begin
	     GB <= q_sig_KB >> 6;end
	  else if(GAIN2 >= 7'd19)begin
	     GB <= q_sig_KB >> 7;end
	  else if(GAIN2 >= 7'd3) begin
	     GB <= q_sig_KB >> 8;end
	  end
   if(A == 1'b1)begin
	  GB <= q_sig_KB*GAIN2;end
	if(BA == 1'b1)begin
	  if(GAIN2 >= 7'd115)begin
	     GB <= q_sig_KB >> 1;end
	  else if(GAIN2 >= 7'd99)begin
	     GB <= q_sig_KB >> 2;end
	  else if(GAIN2 >= 7'd83)begin
	     GB <= q_sig_KB >> 3;end
	  else if(GAIN2 >= 7'd67)begin
	     GB <= q_sig_KB >> 4;end
	  else if(GAIN2 >= 7'd51)begin
	     GB <= q_sig_KB >> 5;end
	  else if(GAIN2 >= 7'd35)begin
	     GB <= q_sig_KB >> 6;end
	  else if(GAIN2 >= 7'd19)begin
	     GB <= q_sig_KB >> 7;end
	  else if(GAIN2 >= 7'd3) begin
	     GB <= q_sig_KB >> 8;end
	  end
end
endmodule

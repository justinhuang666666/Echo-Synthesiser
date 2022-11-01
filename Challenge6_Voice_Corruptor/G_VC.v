module G_VC (clk, t1, t2, t3, t4, GAIN, q, G);
input clk;
input t1;
input t2;
input t3;
input t4;
input [7:0] GAIN;
input [8:0] q;
output [9:0] G;
reg    [9:0] G;

always @ (posedge clk)
begin
  if(t1 == 1'b1) begin
     if(GAIN >= 8'd115)begin
	     G <= {q[8], q[8:0]};
		  end
	  else if(GAIN>=8'd99)begin
	     G <= {q[8], q[8], q[8:1]};
		  end
	  else if(GAIN>=8'd83)begin
	     G <= {q[8], q[8], q[8], q[8:2]};
		  end
	  else if(GAIN>=8'd67)begin
	     G <= {q[8], q[8], q[8], q[8], q[8:3]};
		  end
	  else if(GAIN>=8'd51)begin
	     G <= {q[8], q[8], q[8], q[8], q[8], q[8:4]};
		  end
	  else if(GAIN>=8'd35)begin
	     G <= {q[8], q[8], q[8], q[8], q[8], q[8], q[8:5]};
		  end
	  else if(GAIN>=8'd19)begin
	     G <= {q[8], q[8], q[8], q[8], q[8], q[8], q[8], q[8:6]};
		  end
	  else if(GAIN>=8'd3)begin
	     G <= {q[8], q[8], q[8], q[8], q[8], q[8], q[8], q[8], q[8:7]};
		  end
	  end
  if(t2 == 1'b1) begin
     G <= {q[8:0], 1'b0};
	  end
  if(t3 == 1'b1) begin
     if(GAIN >= 8'd115)begin
	     G <= {q[8], q[8:0]};
		  end
	  else if(GAIN>=8'd99)begin
	     G <= {q[8], q[8], q[8:1]};
		  end
	  else if(GAIN>=8'd83)begin
	     G <= {q[8], q[8], q[8], q[8:2]};
		  end
	  else if(GAIN>=8'd67)begin
	     G <= {q[8], q[8], q[8], q[8], q[8:3]};
		  end
	  else if(GAIN>=8'd51)begin
	     G <= {q[8], q[8], q[8], q[8], q[8], q[8:4]};
		  end
	  else if(GAIN>=8'd35)begin
	     G <= {q[8], q[8], q[8], q[8], q[8], q[8], q[8:5]};
		  end
	  else if(GAIN>=8'd19)begin
	     G <= {q[8], q[8], q[8], q[8], q[8], q[8], q[8], q[8:6]};
		  end
	  else if(GAIN>=8'd3)begin
	     G <= {q[8], q[8], q[8], q[8], q[8], q[8], q[8], q[8], q[8:7]};
		  end
	  end
  if(t4 == 1'b1) begin
     G <= 0;
	  end
end
endmodule

		  
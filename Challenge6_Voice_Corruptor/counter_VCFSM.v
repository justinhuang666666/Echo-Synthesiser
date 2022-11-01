module counter_VCFSM (clk, en, count);

input clk;
input en;
output count;

reg [8:0] MID;
reg count;


parameter N = 9'd654;

initial MID = N;

always @ (posedge clk)
   begin
	   if(en == 1'b1) begin
		   if(MID == 0) begin
			   MID <= N;
				count <= 1'b1;
				end
			else begin
		      MID <= MID-1'b1;
				count <= 1'b0;
				end
		   end
		else begin
		   MID <= N;
			count <= 1'b0;
			end
	end
endmodule
			
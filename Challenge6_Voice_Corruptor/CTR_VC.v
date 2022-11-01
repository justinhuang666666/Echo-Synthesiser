module CTR_VC  (clk, t1, t2, t3, count);

input clk;
input t1;
input t2;
input t3;

output [12:0] count;
reg    [12:0] count;
reg    [12:0] MID1, MID2, MID3;
initial MID1 = 13'd393;
initial MID2 = 13'd255;
initial MID3 = 13'd127;

always @ (negedge clk)
    begin
	    if(t1==1'b1) begin
		    MID1 <= MID1-1;
			 MID2 <= 13'd255;
			 MID3 <= 13'd127;
		    count <= MID1;
			 end
		 else if(t2 == 1'b1) begin
		    MID2 <= MID2-1;
			 MID1 <= 13'd393;
			 MID3 <= 13'd127;
		    count <= MID2;
			 end
		 else if(t3 == 1'b1) begin
		    MID3 <= MID3-1;
			 MID1 <= 13'd393;
			 MID2 <= 13'd255;
		    count <= MID3;
			 end
		 else begin
		    count <= 13'd393;
			 MID1 <= 13'd393;
			 MID2 <= 13'd255;
			 MID3 <= 13'd127;
			 end
	 end
endmodule 

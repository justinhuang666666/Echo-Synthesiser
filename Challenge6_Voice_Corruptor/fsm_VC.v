module fsm_VC (clk, countA, countAB, countB, countBA, A_en, AB_en, B_en, BA_en, T1, T2, T3, T4);

input clk;
input countA;
input countAB;
input countB;
input countBA;
output A_en;
output AB_en;
output B_en;
output BA_en;
output T1;
output T2;
output T3;
output T4;

reg [1:0] state;
reg A_en;
reg AB_en;
reg B_en;
reg BA_en;
reg T1;
reg T2;
reg T3;
reg T4;

parameter A = 2'b00;
parameter AB= 2'b01;
parameter B = 2'b10;
parameter BA= 2'b11;

initial state = A;

always @ (posedge clk)
   begin
	   case (state)
	   
	   A: if(countA == 1'b1) begin
		      A_en <= 1'b0;
				T1 <=1'b0;
				T2 <=1'b1;
				AB_en <= 1'b1;
			   state <=	AB;
				end
			else begin
			   A_en <= 1'b1;
				T1 <=1'b1;
				state <= A;
				end
		AB: if(countAB == 1'b1) begin
		      AB_en <= 1'b0;
				T2 <=1'b0;
				T3 <=1'b1;
				B_en <= 1'b1;
				state <= B;
				end
			else begin
			   AB_en <= 1'b1;
				T2 <= 1'b1;
				state <= AB;
				end
		
		B: if(countB == 1'b1) begin
		      B_en <= 1'b0;
				T3 <= 1'b0;
				T4 <= 1'b1;
				BA_en <= 1'b1;
				state <= BA;
				end
			else begin
			   B_en <= 1'b1;
				T3 <= 1'b1;
				state <= B;
				end
		BA:if(countBA == 1'b1) begin
		      BA_en <= 1'b0;
				T4 <= 1'b0;
				T1 <= 1'b1;
				A_en <= 1'b1;
				state <= A;
				end
			else begin
			   BA_en <= 1'b1;
				T4 <= 1'b1;
				state <= BA;
				end
			
		default: ;
		endcase
	end
endmodule

		 
		 
		 
		 
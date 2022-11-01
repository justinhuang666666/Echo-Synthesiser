module processor (sysclk, data_in, data_out, data_valid, IN);

	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	input 			data_valid;	// asserted when sample data is ready for processing
	input [12:0]   IN;
	//output [9:0]   delay;
	output [9:0] 	data_out;	// 10-bit output data
 
	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y;
	wire           enable;
	wire [8:0]     data_sig;
	wire [8:0]     q_sig;
	wire [12:0]    wdaddr;
	wire [12:0]    rdaddr;
	//wire           rden;
	//wire           wren;
	wire [12:0]    ADR;

	wire [9:0]     half;
	wire [9:0]     mid;
//	wire [9:0]      double;
//	wire [9:0]      mid;
 
	parameter 		ADC_OFFSET = 10'd512;
	parameter 		DAC_OFFSET = 10'd512;

	assign x = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
	
	// This part should include your own processing hardware 
	// ... that takes x to produce y
	// ... In this case, it is ALL PASS.
//	assign double[9] = x[9];
//	assign mid = x<< 1;
//	assign double[8:0] = mid[8:0];
//	assign y = double;
	
	//assign y = x;
	pulse_gen  PULSE (enable, data_valid, sysclk);
	CTR_13     CTR   (data_valid, ADR);
	assign wdaddr[12:0] = ADR + IN;
	assign rdaddr[12:0] = ADR;
	assign data_sig[8:0]= y[9:1];
	

	
	ram	ram_inst (
	.clock ( sysclk ),
	.data ( data_sig ),
	.rdaddress ( rdaddr ),
	.rden ( enable ),
	.wraddress ( wdaddr ),
	.wren ( enable ),
	.q ( q_sig )
	);

	
	//FSM_echo  fsm    (sysclk, full_sig, fifo_state);
	
	//and       a1     (read, enable, fifo_state);
	
	
	
	assign  mid[9] = q_sig[8];
	assign  half[8:0] = q_sig[8:0];
	assign  mid[8:0] = half[8:0];
	assign  y = x-mid;
	

	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		if (enable == 1'b1)
       data_out <=  y + DAC_OFFSET;
		
endmodule
	
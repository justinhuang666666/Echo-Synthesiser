module processor_vc (sysclk, data_in, data_out, data_valid);

	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	input 			data_valid;	// asserted when sample data is ready for processing
	//output [9:0]   delay;
	output [9:0] 	data_out;	// 10-bit output data
	
   wire [12:0]    DELAY_KA;
	wire [12:0]    DELAY_KB; 
	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y;
	wire           enable;
//	wire [8:0]     data_sig_KA;
//	wire [8:0]     data_sig_KB;
   wire [8:0]     data_sig;
	wire [8:0]     q_sig_KA;
	wire [8:0]     q_sig_KB;
	wire [12:0]    wdaddr_KA;
	wire [12:0]    wdaddr_KB;
	wire [12:0]    rdaddr_KA;
	wire [12:0]    rdaddr_KB;
	wire countA;
	wire countAB;
	wire countB;
	wire countBA;
	wire A_en;
	wire AB_en;
	wire B_en;
	wire BA_en;
	wire A;
	wire AB;
	wire B;
	wire BA;
	wire [12:0] delayKA, delayKB;
	//wire           rden;
	//wire           wren;
	wire [12:0]    ADR;

	//wire [9:0]     half;
//	wire [9:0]     midKA;
//	wire [9:0]     midKB;
	wire [8:0]     GA;
	wire [8:0]     GB;
	wire [6:0]     GAIN1;
	wire [6:0]     GAIN2;
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
	fsm_VC     FSM   (sysclk,countA,countAB,countB,countBA,A_en,AB_en,B_en,BA_en,A,AB,B,BA);
	counter_VCFSM  CTA (sysclk, A_en, countA);
	counter_VCFSM  CTAB(sysclk, AB_en, countAB);
	counter_VCFSM  CTB (sysclk, B_en, countB);
	counter_VCFSM  CTBA(sysclk, BA_en, countBA);
	CTR_VC  CTRKA      (enable, BA, A, AB, delayKA);
	CTR_VC  CTRKB      (enable, AB, B, BA, delayKB);
	assign wdaddr_KA[12:0] = ADR+delayKA;
	assign rdaddr_KA[12:0] = ADR;
	assign rdaddr_KB[12:0] = ADR;
	assign wdaddr_KB[12:0] = ADR+delayKB;
	assign data_sig[8:0]= x[9:1];
	
	ram_vc	ram_vc_inst_KA (
	.clock ( sysclk ),
	.data ( data_sig ),
	.rdaddress ( rdaddr_KA ),
	.rden ( enable ),
	.wraddress ( wdaddr_KA ),
	.wren ( enable ),
	.q ( q_sig_KA )
	);
   
	
	ram_vc	ram_vc_inst_KB (
	.clock ( sysclk ),
	.data ( data_sig ),
	.rdaddress ( rdaddr_KB ),
	.rden ( enable ),
	.wraddress ( wdaddr_KB ),
	.wren ( enable ),
	.q ( q_sig_KB )
	);
	

	
	//FSM_echo  fsm    (sysclk, full_sig, fifo_state);
	
	//and       a1     (read, enable, fifo_state);
	
//	
//	assign  midKA[9] = q_sig_KA[8];
//	assign  midKB[9] = q_sig_KB[8];
	
   GAIN_VC  gainKA  (sysclk, enable, BA, A, AB, B, GAIN1);
	GAIN_VC  gainKB  (sysclk, enable, AB, B, BA, A, GAIN2);
//	assign  mid[9] = q_sig[8];
//	assign  half[8:0] = q_sig >> 1;
//	assign  mid[8:0] = half[8:0];
//	assign  y = x-mid;
//GAIN KA
	//G_A_B   gainab   (sysclk, A, AB, B, BA, GAIN1, GAIN2, q_sig_KA, q_sig_KB, GA, GB);	
//   assign GA = q_sig_KA;
//	assign GB = q_sig_KB;
//	assign midKA[8:0] = GA;
//	assign midKB[8:0] = GB;
//	assign y = midKA + midKB;
   G_VC   GVC1  (sysclk, BA, A, AB, B, GAIN1, q_sig_KA, GA);
	G_VC   GVC2  (sysclk, AB, B, BA, A, GAIN2, q_sig_KB, GB);
	assign y = GA+GB;
	//  Now clock y output with system clock
	always @(posedge sysclk)
   	if (enable == 1'b1)
       data_out <=  y + DAC_OFFSET;
		
endmodule
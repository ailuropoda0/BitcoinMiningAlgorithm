//-----------------------------------------------------------
// SHA-256 round unit part
// 	receives N groups of 64 blocks of 32 bits
//	return 512 bits
//-----------------------------------------------------------
`define BYTE(x) (((x)+1)*(32)-1):((x)*(32))

`include "sha256_round_block.v"

module sha256_round_unit 
( 
	input clk,	// clock
	output reg [511:0] tx_w, 	 	// 
	output reg [255:0] inter_hash,	// 8 intermediate hash values of 32 bits

	input [31:0] k,			// one of 64 constants
 	input [511:0] words,	// a message block of 512 bits
 	input [255:0] vars 		// 8 working variables of 32 bits(a ~ h)
);
 
	wire [31:0] l0_val, l1_val, ch_val, maj_val, s0_val, s1_val; 
 
	l0 l0_block (l0_val, vars[`BYTE(0)]); // l0(A)
	l1 l1_block (l1_val, vars[`BYTE(4)]); // l1(E)
	ch ch_block (ch_val, vars[`BYTE(4)], vars[`BYTE(5)], vars[`BYTE(6)]); // Ch(E,F,G) 
	maj maj_block (maj_val, vars[`BYTE(0)], vars[`BYTE(1)], vars[`BYTE(2)]); // Maj(A,B,C)
 	s0 s0_block (s0_val, words[63:32]);   //
	s1 s1_block (s1_val, words[479:448]); //
 
	wire [31:0] t1 = vars[`BYTE(7)] + l1_val + ch_val + k + words[31:0]; // H + l1(E) + Ch(E,F,G) + W + K  
	wire [31:0] t2 = l0_val + maj_val;  // l0(A) + Maj(A,B,C)
	wire [31:0] new_val = s1_val + words[319:288] + s0_val + words[31:0];  
	
	always @ (posedge clk)
	begin   
	 	tx_w[511:480] <= new_val; 
	 	tx_w[479:0] <= words[511:32]; 
	
		inter_hash[`BYTE(7)] <= vars[`BYTE(6)]; // H = G
		inter_hash[`BYTE(6)] <= vars[`BYTE(5)]; // G = F
		inter_hash[`BYTE(5)] <= vars[`BYTE(4)]; // F = E
		inter_hash[`BYTE(4)] <= vars[`BYTE(3)] + t1; // E = D + T1
		inter_hash[`BYTE(3)] <= vars[`BYTE(2)]; // D = C
		inter_hash[`BYTE(2)] <= vars[`BYTE(1)]; // C = B
		inter_hash[`BYTE(1)] <= vars[`BYTE(0)]; // B = A
		inter_hash[`BYTE(0)] <= t1 + t2; // A = T1 + T2
	end 
 
endmodule
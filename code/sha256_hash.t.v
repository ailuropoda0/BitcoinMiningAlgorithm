`timescale 1 ns / 1 ps

`include "sha256_hash.v"

module testSHA256_hash();

	localparam H0 = {
		32'h5be0cd19, 32'h1f83d9ab, 32'h9b05688c, 32'h510e527f,
		32'ha54ff53a, 32'h3c6ef372, 32'hbb67ae85, 32'h6a09e667 
	};

	reg clk;
	reg feedback;
	reg[5:0] count;
	reg[255:0] rx_state;
	reg[511:0] rx_input;
	wire[255:0] hash;

	initial clk=0;
    always #10 clk=!clk;

    sha256_transform hash_unit(
    	.clk(clk), .feedback(feedback), .cnt(count),
    	.rx_state(rx_state), .rx_input(rx_input), .tx_hash(hash)
    );

    initial begin
    $dumpfile("hash.vcd");
    $dumpvars(0,testSHA256_hash);
    $display("test");

    count = 0; feedback = 0; rx_state = H0;
    rx_input = 512'h3080000000000000000000000000000000000000000000000000000000000008; //input: '0'
    #1300

    $display("%h", hash);
    $display("5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9");
    $display("%h | %h", rx_state[31:0], rx_state[255:224]);
    

    end

endmodule
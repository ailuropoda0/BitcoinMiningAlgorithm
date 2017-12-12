module ch
(
	output[31:0] o,
	input[31:0] x, y, z
);
	assign o = (x & y) ^ ((~x) & z);

endmodule

module maj
(
	output[31:0] o,
	input[31:0] x, y, z
);
	assign o = (x & y)^(x & z)^(y & z);

endmodule

module l0
(
	output[31:0] o,
	input[31:0] x
);
	assign o = {x[1:0],x[31:2]} ^ {x[12:0],x[31:13]} ^ {x[21:0],x[31:22]};

endmodule

module l1
(
	output[31:0] o,
	input[31:0] x
);
	assign o = {x[5:0],x[31:6]} ^ {x[10:0],x[31:11]} ^ {x[24:0],x[31:25]};

endmodule

module s0
(
	output[31:0] o,
	input[31:0] x
);
	assign o[28:0] = {x[3:0], x[31:7]} ^ {x[14:0], x[31:18]} ^ x[31:3];
	assign o[31:29] = x[6:4] ^ x[17:15];

endmodule

module s1
(
	output[31:0] o,
	input[31:0] x
);
	assign o[21:0] = {x[6:0], x[31:17]} ^ {x[8:0], x[31:19]} ^ x[31:10];
	assign o[31:22] = x[16:7] ^ x[18:9];

endmodule
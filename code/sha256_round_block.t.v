`timescale 1 ns / 1 ps

`include "sha256_round_block.v"

module testSHA256_round_block();
    reg[31:0] x, y, z;
    wire[31:0] result_ch;
    wire[31:0] result_maj;
    wire[31:0] result_l0;
    wire[31:0] result_l1;
    wire[31:0] result_s0;
    wire[31:0] result_s1;

    ch ch_block(result_ch, x, y, z);
    maj maj_block(result_maj, x, y, z);
    l0 l0_block(result_l0, x);
    l1 l1_block(result_l1, x);
    s0 s0_block(result_s0, x);
    s1 s1_block(result_s1, x);
    
    initial begin
    $display("testing ch");
    $display("input1   input2   input3   | result   | expected outputs");
    x=32'h0000ffff; y=32'h00ff00ff; z=32'h000f0fff; #10
    $display("%h %h %h | %h | 0f0f00ff", x, y, z, result_ch);

    $display("testing maj");
    $display("%h %h %h | %h | 000f0fff", x, y, z, result_maj);

    $display("testing large sigma0");
    x=32'h00000000; #10
    $display("%h -------- -------- | %h | 00000000", x, result_l0);
    x=32'h00000010; #10
    $display("%h -------- -------- | %h | 00804004", x, result_l0);
    x=32'hd412097c; #10
    $display("%h -------- -------- | %h | 36c7d19f", x, result_l0);
    x=32'hf0d3b597; #10
    $display("%h -------- -------- | %h | 1e5d343b", x, result_l0);

    $display("testing large sigma1");
    x=32'h00000000; #10
    $display("%h -------- -------- | %h | 00000000", x, result_l1);
    x=32'h00000010; #10
    $display("%h -------- -------- | %h | 42000800", x, result_l1);
    x=32'hd412097c; #10
    $display("%h -------- -------- | %h | d5ce740e", x, result_l1);
    x=32'hf0d3b597; #10
    $display("%h -------- -------- | %h | 84e79f58", x, result_l1);

    
    $display("testing small sigma0");
    x=32'h00000000; #10
    $display("%h -------- -------- | %h | 00000000", x, result_s0);
    x=32'h00000010; #10
    $display("%h -------- -------- | %h | 20040002", x, result_s0);
    x=32'hd412097c; #10
    $display("%h -------- -------- | %h | 61755039", x, result_s0);
    x=32'hf0d3b597; #10
    $display("%h -------- -------- | %h | dc9e2ded", x, result_s0);
    
    $display("testing small sigma1");
    x=32'h00000000; #10
    $display("%h -------- -------- | %h | 00000000", x, result_s1);
    x=32'h00000010; #10
    $display("%h -------- -------- | %h | 000A0000", x, result_s1);
    x=32'hd412097c; #10
    $display("%h -------- -------- | %h | 45a4f409", x, result_s1);
    x=32'hf0d3b597; #10
    $display("%h -------- -------- | %h | ac45329e", x, result_s1);

    end
endmodule
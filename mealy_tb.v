`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 04:28:59 PM
// Design Name: 
// Module Name: mealy_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mealy_tb;
    reg P1, P2, clk, reset;
    wire z;
    mealy dut(.P1(P1), .P2(P2), .clk(clk), .reset(reset), .z(z));

    always #5 clk = ~clk;   // 10 ns clock

    initial begin
        clk = 0; reset = 1; P1 = 0; P2 = 0;
        #12 reset = 0;

        // P1=1 means input bit 1, P2=1 means input bit 0 (one bit per clock)
        P1=1; P2=0; #10;
        P1=1; P2=0; #10;
        P1=0; P2=1; #10;
        P1=1; P2=0; #10;   // 1101 done -> z=1
        P1=1; P2=0; #10;
        P1=0; P2=1; #10;
        P1=1; P2=0; #10;   // overlapping 1101 done -> z=1
        P1=0; P2=1; #10;
        P1=0; P2=1; #10;

        #20 $finish;
    end

    always @(posedge z) $display("%0t ps: z=1", $time);
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 04:24:21 PM
// Design Name: 
// Module Name: moore_tb
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


module moore_tb;

reg p1, p2, clk, rst; wire out;

moore uut(.p1(p1), .p2(p2), .clk(clk), .rst(rst), .fsm_out(out));

initial clk =0;
always#5 clk=~clk;

//input stream
reg [16:0] stream= 17'b1100_1101100_111100;
integer i;

initial begin
 $dumpfile("moore.vcd"); $dumpvars(0, moore_tb);
        p1 = 0; p2 = 0; rst = 1;
        #12 rst = 0;
        for (i = 16; i >= 0; i = i - 1) begin
            @(negedge clk);
            p1 = stream[i];      // button 1 = enter a 1
            p2 = ~stream[i];     // button 2 = enter a 0
        end
        @(negedge clk); p1 = 0; p2 = 0;
        #20 $finish;
    end
 
    always @(posedge out) $display("%t: 1100 detected", $time);
endmodule
 
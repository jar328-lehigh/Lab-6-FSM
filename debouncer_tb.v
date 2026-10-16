`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 04:21:07 PM
// Design Name: 
// Module Name: debouncer_tb
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


module debouncer_tb;

reg raw, clk; wire clean;

debouncer dut(.raw(raw), .clk(clk), .clean(clean));
initial clk= 0; 
always #5 clk= ~clk;
initial begin
$dumpfile("deb.vcd"); $dumpvars(0, debouncer_tb);
        raw = 0; #50;
        // bouncing press
        raw=1; #20 raw=0; #20 raw=1; #30 raw=0; #20 raw=1; #100 $display("100ns into press: clean=%b",clean);
        #400; $display("held: clean=%b",clean);               // held: clean must go high
        raw=0; #20 raw=1; #20 raw=0; #100; $display("after release: clean=%b",clean);
        $finish;
    end
endmodule

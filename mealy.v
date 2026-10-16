`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 03:20:13 PM
// Design Name: 
// Module Name: mealy
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


module mealy(input P1, P2, clk, reset, output reg z);

parameter S0= 2'd0, S1=2'd1, S2=2'd2, S3=2'd3;
reg[1:0] PS, NS;

always @(posedge clk or posedge reset)
begin
    if(reset)
    PS<=S0;
    else
    PS<=NS;
    end
always@(PS or P1 or P2)
begin
NS=PS;
z=1'b0;
case(PS)
S0 : begin
     if (P1)
     NS = S1;
     else
     NS = S0;
 end
 S1 : begin
     if (P1)
     NS = S2;
     else
     NS = S0;
     end
 S2 : begin
    if (P1)
     NS = S2;
     else
     NS = S3;
     end
 S3 : begin
     if (P1)
     begin
     NS = S1;
     z=1'b1;
     end
     else if (P2)
     NS = S0;
     end
 default: NS= S0;
 endcase
 end

endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 03:23:56 PM
// Design Name: 
// Module Name: moore
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


module moore(input wire p1, input wire p2, input wire clk, input wire rst, output reg fsm_out);
//1101

//state variables
parameter s0= 3'b000;
parameter s1= 3'b001;
parameter s2= 3'b010;
parameter s3= 3'b011;
parameter s4= 3'b100;

//register
reg [2:0] cs, ns;

//state transitions
always @(posedge clk)begin
    if (rst==1)
        cs<= s0;
    else 
        cs<=ns;
end

//ns determination logic-combinational
always @(cs, p1, p2) //p1 is for 1, p2 is for 2
begin
    case(cs)
        s0:begin
            if(p1) ns=s1;
            else if (p2) ns=s0;
        end

    s1:begin
        if(p1) ns=s2;
        else if (p2)ns=s0;
    end

    s2:begin
        if(p1) ns=s2;
        else if (p2)ns=s3;
    end
    
    s3:begin
        if(p1) ns=s1;
        else if (p2)ns=s4;

    end
    s4:begin
        if(p1) ns=s1;
        else if (p2)ns=s0;

    end
    default: ns= s0;
    endcase

end

//combinatinoal logic to determine output

//putput only depends on curernt state

always @(cs)begin
    case(cs)
    s4: fsm_out= 1'b1;
    default: fsm_out= 1'b0;
    endcase
end



endmodule

//reset =1'b0;
//#10
//reset =0
//p1=1'b1
//#10
// p1=1'b0

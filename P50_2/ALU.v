`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:07:21 12/06/2017 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(A,B,Result,ALUctrl,s   //////比较的时候要比较有符号的
    );
	 input [31:0]A;
	 input [31:0]B;
	 input [2:0]ALUctrl;
	 input [4:0]s;
	 output reg [31:0]Result;
	 always @* begin
	   case(ALUctrl)
		  0:Result=A+B;
		  1:Result=A-B;
		  2:Result=A|B;
		  3:Result=B>>s;
		  4:Result=B<<s;
		  5:Result=A^B;
		  6:Result=A&B;
		  7:Result=$signed(B)>>>A[4:0];
		  default:Result=32'bx;
		  endcase
		end
endmodule

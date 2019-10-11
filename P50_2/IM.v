`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:32:25 12/27/2017 
// Design Name: 
// Module Name:    IM 
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
module IM(addr,instr
    );
	 input [9:0] addr;
	 output [31:0] instr;
	 reg [31:0] ROM [1023:0];
	 initial begin
	   $readmemh("code.txt",ROM);
		end
	 assign instr=ROM[addr];
endmodule

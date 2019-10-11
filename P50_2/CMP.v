`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:45:44 12/27/2017 
// Design Name: 
// Module Name:    CMP 
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
module CMP(RD1,RD2,instr,Zero,bZero 
    );
	 input [31:0] RD1;
	 input [31:0] RD2;
	 input [31:0] instr;
	 output Zero;
	 output bZero; ///////////////////////////
	 assign Zero=((RD1==RD2)&&(instr[31:26]==6'b000100))||((RD1!=RD2)&&(instr[31:26]==6'b000101))||(($signed(RD1)>0)&&(instr[31:26]==6'b000111))?1:0;
	 assign bZero=((($signed(RD1))>=($signed(RD2)))&&(instr[31:26]==6'b111111))?1:0; ///////////////
endmodule

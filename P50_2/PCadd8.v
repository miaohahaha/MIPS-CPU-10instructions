`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:22 12/23/2017 
// Design Name: 
// Module Name:    PCadd8 
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
module PCadd8(PC4,PC8
    );
	 input [31:0]PC4;
	 output [31:0]PC8;
	 assign PC8=PC4+4;
endmodule

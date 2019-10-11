`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:50:42 12/06/2017 
// Design Name: 
// Module Name:    EXT 
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
module EXT(imm,EXTOp,imm32
    );
	 input [15:0]imm;
	 input [1:0]EXTOp;
	 output reg [31:0]imm32;
	 
	 always @* begin
	   case(EXTOp)
		  0:imm32={16'b0,imm};
		  1:imm32={imm,16'b0};
		  2:imm32={{16{imm[15]}},imm};
		  default imm32=32'bx;
		  endcase
		  end

endmodule

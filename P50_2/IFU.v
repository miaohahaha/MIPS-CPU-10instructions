`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:50:05 12/06/2017 
// Design Name: 
// Module Name:    IFU 
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
module IFU(clk,reset,offset,j_addr,nPC_sel,Zero,jal,npc,jraddr,jr,PC,j,pc_en,bZero,b_RD2 ///////////////
    );
	 input clk;
	 input reset;
	 input [31:0] offset;
	 input [25:0]j_addr;
	 input nPC_sel;
	 input Zero;
	 input jal;
	 input jr;
	 input [31:0] jraddr;
	 output [31:0] npc;
	 output [31:0] PC;
	 reg [31:0] pc;
	 
	 input bZero;     ////////////////////
	 input [31:0] b_RD2;     /////////////////
	 
	 input pc_en;
	 input j;
	 initial begin
		pc=32'h00003000;
		end
	 assign npc=pc+4;
	 assign PC=pc;
	 always @(posedge clk)begin
	   if(reset)
		  pc=32'h00003000;
		else if(pc_en==0)
		  pc=pc;
		else if(nPC_sel&&bZero)          ////////////////
		  pc=b_RD2;                 //////////////////
		else if(nPC_sel&&Zero)
		  pc=pc+$signed({offset[29:0],2'b00});
		else if(jal||j)
		  pc={pc[31:28],j_addr,2'b00};
		else if(jr)
		  pc=jraddr;
		else
		  pc=pc+4;
		end

endmodule

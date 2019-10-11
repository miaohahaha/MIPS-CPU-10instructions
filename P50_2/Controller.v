`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:40:36 12/06/2017 
// Design Name: 
// Module Name:    Controller 
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
module Controller(instr,RegDst,jal,jr,ALUSrc,MemtoReg,RegWrite,MemWrite,nPC_sel,EXTOp,ALUctrl,j,bbb ///////////
    );
	 input [31:0]instr;
	 output reg [1:0] RegDst;
	 output reg jal;
	 output reg jr;
	 output reg ALUSrc;
	 output reg [1:0] MemtoReg;
	 output reg RegWrite;
	 output reg MemWrite;
	 output reg nPC_sel;
	 output reg [1:0] EXTOp;
	 output reg [2:0] ALUctrl;
	 
	 output reg j;
	 output reg bbb;////////////////
	 
	 wire [5:0] op,func;
	 assign op=instr[31:26];
	 assign func=instr[5:0];

	 
	 always @* begin
	   case(op)
	   6'b000000:begin
		  if(func==6'b100001)begin//addu
		    RegDst=1;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=0;
			 MemWrite=0;
			 bbb=0;
			 end
       if(func==6'b100000)begin//addu
		    RegDst=1;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=0;
			 MemWrite=0;
			 bbb=0;
			 end
		  else if(func==6'b100011)begin //subu
		    RegDst=1;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=1;
			 MemWrite=0;
			 bbb=0;
			 end
		  else if(func==6'b001000)begin //jr
		    RegDst=1;
			 jal=0;
			 jr=1;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=0;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=0;
			 MemWrite=0;
			 bbb=0;
			 end
		  else if(func==6'b000010)begin  //srl
		    RegDst=1;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=3;
			 MemWrite=0;
			 bbb=0;
			 end
		  else if(func==6'b000000)begin  //sll
		    RegDst=1;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=4;
			 MemWrite=0;
			 bbb=0;
			 end
		  else if(func==6'b100110)begin  //xor
		    RegDst=1;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=5;
			 MemWrite=0;
			 bbb=0;
			 end
		  else if(func==6'b100101)begin  //or
		    RegDst=1;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=2;
			 MemWrite=0;
			 bbb=0;
			 end
		  else if(func==6'b100100)begin  //and
		    RegDst=1;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=6;
			 MemWrite=0;
			 bbb=0;
			 end
        else if(func==6'b000111)begin // SRAV
		    RegDst=1;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=7;
			 MemWrite=0;
			 bbb=0;
			 end
		  else if(func==6'b000000)begin//nop
		    RegDst=1;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=0;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=0;
			 MemWrite=0;
			 bbb=0;
			 end
			 end
		  6'b001101:begin //ori
		    RegDst=0;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=1;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=2;
			 MemWrite=0;
			 bbb=0;
			 end
		  6'b100011:begin //LW
		    RegDst=0;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=1;
			 MemtoReg=1;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=2;
			 ALUctrl=0;
			 MemWrite=0;
			 bbb=0;
			 end
		  6'b101011:begin //SW
		  	 RegDst=0;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=1;
			 MemtoReg=0;
			 RegWrite=0;
			 nPC_sel=0;
			 EXTOp=2;
			 ALUctrl=0;
			 MemWrite=1;
			 bbb=0;
			 end
		  6'b000100:begin //BEQ
		  	 RegDst=0;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=0;
			 nPC_sel=1;
			 EXTOp=2;
			 ALUctrl=1;
			 MemWrite=0;
			 bbb=0;
			 end
		  6'b000101:begin //bne
		  	 RegDst=0;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=0;
			 nPC_sel=1;
			 EXTOp=2;
			 ALUctrl=1;
			 MemWrite=0;
			 bbb=0;
			 end
		  6'b000111:begin //bgtz
		    RegDst=0;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=0;
			 nPC_sel=1;
			 EXTOp=2;
			 ALUctrl=1;
			 MemWrite=0;
			 bbb=0;
			 end
		  6'b001111:begin //lui
		    RegDst=0;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=1;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=1;
			 ALUctrl=0;
			 MemWrite=0;
			 bbb=0;
			 end
		  6'b000011:begin //jal
		    RegDst=2;
			 jal=1;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=2;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=0;
			 MemWrite=0;
			 bbb=0;
			 end
		  6'b000010:begin //j
		    RegDst=0;
			 jal=0;
			 jr=0;
			 j=1;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=0;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=0;
			 MemWrite=0; 
			 bbb=0;	
			 end
			6'b001000:begin //addi ÎÞÒç³ö
			 RegDst=0;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=1;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=2;
			 ALUctrl=0;
			 MemWrite=0; 
          bbb=0;	
			 end
			6'b001001:begin //addiu
			 RegDst=0;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=1;
			 MemtoReg=0;
			 RegWrite=1;
			 nPC_sel=0;
			 EXTOp=2;
			 ALUctrl=0;
			 MemWrite=0; 
          bbb=0;	
			 end
			 
			6'b111111:begin //bbb  //////////////
			 RegDst=1;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=2;
			 RegWrite=1;
			 nPC_sel=1;
			 EXTOp=2;
			 ALUctrl=0;
			 MemWrite=0;
          bbb=1;            /////////////////////
			 end
			default: begin 
			 RegDst=0;
			 jal=0;
			 jr=0;
			 j=0;
			 ALUSrc=0;
			 MemtoReg=0;
			 RegWrite=0;
			 nPC_sel=0;
			 EXTOp=0;
			 ALUctrl=0;
			 MemWrite=0;
          bbb=0;
			 end
		endcase
		end
	 
endmodule

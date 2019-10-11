`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:34 12/23/2017 
// Design Name: 
// Module Name:    Wall 
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
module Wall_IFID(clk,reset,npc,instr,IFID_en,IFID_rd,IFID_rs,IFID_rt,IFID_imm,IFID_pc4,IFID_instr,PC,IFID_WPC
    );
	 input clk;
	 input reset;
	 input [31:0] npc;
	 input [31:0] instr;
	 input IFID_en;
	 input [31:0] PC;
	 output reg [4:0] IFID_rd;
	 output reg [4:0] IFID_rs;
	 output reg [4:0] IFID_rt;
	 output reg [15:0] IFID_imm;
	 output reg [31:0] IFID_pc4;
	 output reg [31:0] IFID_instr;
	 output reg [31:0] IFID_WPC;
	 always @(posedge clk)begin
	   if(reset)begin
	     IFID_rd=0;
		  IFID_rs=0;
		  IFID_rt=0;
		  IFID_imm=0;
		  IFID_pc4=0;
		  IFID_instr=0;
		  IFID_WPC=0;
		  end
		else if(IFID_en)begin
		  IFID_rs=instr[25:21];
		  IFID_rt=instr[20:16];
		  IFID_rd=instr[15:11];
		  IFID_imm=instr[15:0];
		  IFID_pc4=npc;
		  IFID_instr=instr;
		  IFID_WPC=PC;
		  end
		end
endmodule

module Wall_IDEX(clk,reset,RD1_D,RD2_D,imm32_D,IFID_pc8,IFID_rd,IFID_rs,IFID_rt,IFID_WA,IFID_instr,RD1_E,RD2_E,IDEX_imm32,IDEX_rd,IDEX_rs,IDEX_rt,IDEX_WA,IDEX_pc8,IDEX_instr,IFID_WPC,IDEX_WPC
    );
	 input clk;
	 input reset;
	 input [31:0] RD1_D;
	 input [31:0] RD2_D;
	 input [31:0] imm32_D;
	 input [31:0] IFID_pc8;
	 input [4:0] IFID_rd;
	 input [4:0] IFID_rs;
	 input [4:0] IFID_rt;
	 input [4:0] IFID_WA;
	 input [31:0] IFID_instr;
	 input [31:0] IFID_WPC;
	 output reg [31:0] RD1_E;
	 output reg [31:0] RD2_E;
	 output reg [31:0] IDEX_imm32;
	 output reg [4:0] IDEX_rd;
	 output reg [4:0] IDEX_rs;
	 output reg [4:0] IDEX_rt;
	 output reg [4:0] IDEX_WA;
	 output reg [31:0] IDEX_pc8;
	 output reg [31:0] IDEX_instr;
	 output reg [31:0] IDEX_WPC;
	 always @(posedge clk)begin
	   if(reset)begin
	     RD1_E=0;
		  RD2_E=0;
		  IDEX_imm32=0;
		  IDEX_rd=0;
		  IDEX_rs=0;
		  IDEX_rt=0;
		  IDEX_WA=0;
		  IDEX_pc8=0;
		  IDEX_instr=0;
		  IDEX_WPC=0;
		  end
		else begin
	     RD1_E=RD1_D;
		  RD2_E=RD2_D;
		  IDEX_imm32=imm32_D;
		  IDEX_rd=IFID_rd;
		  IDEX_rs=IFID_rs;
		  IDEX_rt=IFID_rt;
		  IDEX_WA=IFID_WA;
		  IDEX_pc8=IFID_pc8;
		  IDEX_instr=IFID_instr;
		  IDEX_WPC=IFID_WPC;
		  end
		end
endmodule

module Wall_EXMEM(clk,reset,RD2_new,IDEX_pc8,IDEX_WA,IDEX_instr,ALUout_E,EXMEM_RD2_new,EXMEM_pc8,EXMEM_WA,EXMEM_ALUout,EXMEM_instr,IDEX_WPC,EXMEM_WPC,EXMEM_rt,IDEX_rt
    );
	 input clk;
	 input reset;
	 input [31:0] RD2_new;
	 input [31:0] IDEX_pc8;
	 input [4:0] IDEX_WA;
	 input [31:0] IDEX_instr;
	 input [31:0] ALUout_E;
	 input [31:0] IDEX_WPC;
	 input [4:0] IDEX_rt;
	 output reg [31:0] EXMEM_RD2_new;
	 output reg [31:0] EXMEM_pc8;
	 output reg [4:0] EXMEM_WA;
	 output reg [31:0] EXMEM_ALUout;
	 output reg [31:0] EXMEM_instr;
	 output reg [31:0] EXMEM_WPC;
	 output reg [4:0] EXMEM_rt;
	 always @(posedge clk)begin
	   if(reset)begin
	     EXMEM_RD2_new=0;
		  EXMEM_pc8=0;
		  EXMEM_WA=0;
		  EXMEM_ALUout=0;
		  EXMEM_instr=0;
		  EXMEM_WPC=0;
		  EXMEM_rt=0;
		  end
		else begin
	     EXMEM_RD2_new=RD2_new;
		  EXMEM_pc8=IDEX_pc8;
		  EXMEM_WA=IDEX_WA;
		  EXMEM_ALUout=ALUout_E;
		  EXMEM_instr=IDEX_instr;
		  EXMEM_WPC=IDEX_WPC;
		  EXMEM_rt=IDEX_rt;
		  end
		end
endmodule

module Wall_MEMWB(clk,reset,DMout_M,EXMEM_pc8,EXMEM_WA,EXMEM_instr,EXMEM_ALUout,MEMWB_DMout,MEMWB_pc8,MEMWB_WA,MEMWB_ALUout,MEMWB_instr,EXMEM_WPC,MEMWB_WPC
    );
	 input clk;
	 input reset;
	 input [31:0] DMout_M;
	 input [31:0] EXMEM_pc8;
	 input [4:0] EXMEM_WA;
	 input [31:0] EXMEM_instr;
	 input [31:0] EXMEM_ALUout;
	 input [31:0] EXMEM_WPC;
	 output reg [31:0] MEMWB_DMout;
	 output reg [31:0] MEMWB_pc8;
	 output reg [4:0] MEMWB_WA;
	 output reg [31:0] MEMWB_ALUout;
	 output reg [31:0] MEMWB_instr;
	 output reg [31:0] MEMWB_WPC;
	 always @(posedge clk)begin
	   if(reset)begin
	     MEMWB_DMout=0;
		  MEMWB_pc8=0;
		  MEMWB_WA=0;
		  MEMWB_ALUout=0;
		  MEMWB_instr=0;
		  MEMWB_WPC=0;
		  end
		else begin
	     MEMWB_DMout=DMout_M;
		  MEMWB_pc8=EXMEM_pc8;
		  MEMWB_WA=EXMEM_WA;
		  MEMWB_ALUout=EXMEM_ALUout;
		  MEMWB_instr=EXMEM_instr;
		  MEMWB_WPC=EXMEM_WPC;
		  end
		end
endmodule



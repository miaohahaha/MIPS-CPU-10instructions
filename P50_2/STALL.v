`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:45:14 12/27/2017 
// Design Name: 
// Module Name:    STALL 
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
module STALL(MemtoRegE,IFID_rs,IFID_rt,IDEX_WA,EXMEM_WA,nPC_sel,RegWriteE,MemtoRegM,jr,IFID_en,pc_en,IDEX_reset,MemWriteD
    );
	 input [1:0] MemtoRegE;
	 input [4:0] IFID_rs;
	 input [4:0] IFID_rt;
	 input [4:0] IDEX_WA;
	 input [4:0] EXMEM_WA;
	 input nPC_sel;
	 input RegWriteE;
	 input [1:0] MemtoRegM;
	 input jr;
	 input MemWriteD;
	 wire stall_load,stall_b,stall_jr;
	 wire [1:0] stall;
	 reg restall;
	 output reg IFID_en;
	 output reg pc_en;
	 output reg IDEX_reset;
	 
	 
	 
	 initial begin
	   IFID_en=1;
		pc_en=1;
		IDEX_reset=0;
		restall=0;
		end
	 //////////MEMtoReg=1´ú±ílw
	 
	 assign stall_load=(MemtoRegE==1&&IDEX_WA!=0&&IFID_rs==IDEX_WA)||(MemtoRegE==1&&IDEX_WA!=0&&IFID_rt==IDEX_WA&&!MemWriteD);
	 assign stall_b=(nPC_sel&&RegWriteE&&IFID_rs!=0&&IFID_rs==IDEX_WA)||(nPC_sel&&RegWriteE&&IFID_rt!=0&&IFID_rt==IDEX_WA)||(nPC_sel&&MemtoRegM==1&&IFID_rs!=0&&IFID_rs==EXMEM_WA)||(nPC_sel&&MemtoRegM==1&&IFID_rt!=0&&IFID_rt==EXMEM_WA);
    assign stall_jr=(jr&&RegWriteE&&IFID_rs!=0&&IFID_rs==IDEX_WA)||(jr&&MemtoRegM==1&&IFID_rs!=0&&IFID_rs==EXMEM_WA);
    assign stall=(stall_load&&(stall_b||stall_jr))?2:(stall_load||stall_b||stall_jr)?1:0;
	 
	 always@(stall)begin
	   if(stall==2)begin
		  IFID_en=0;
		  pc_en=0;
		  IDEX_reset=1;
		  restall=1;
		  end
		 else if(stall==1||restall==1)begin
		  IFID_en=0;
		  pc_en=0;
		  IDEX_reset=1;
		  restall=0;
		  end
		 else begin
		  IFID_en=1;
		  pc_en=1;
		  IDEX_reset=0;
		  restall=0;
		  end
		end
endmodule

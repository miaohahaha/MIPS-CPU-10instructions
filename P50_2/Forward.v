`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:19:01 12/27/2017 
// Design Name: 
// Module Name:    Forward 
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
module Forward(RegWriteM,RegWriteW,EXMEM_WA,MEMWB_WA,IFID_rs,IFID_rt,IDEX_rs,IDEX_rt,Forward1,Forward2,Forward3,Forward4,Forward5,EXMEM_rt,MemtoRegW
    );
	 input RegWriteM;
	 input RegWriteW;
	 input [4:0] EXMEM_WA;
	 input [4:0] MEMWB_WA;
	 input [4:0] IFID_rs;
	 input [4:0] IFID_rt;
	 input [4:0] IDEX_rs;
	 input [4:0] IDEX_rt;
	 output reg [1:0] Forward1;
	 output reg [1:0] Forward2;
	 output reg [1:0] Forward3;
	 output reg [1:0] Forward4;
	 output reg Forward5;
	 input [4:0] EXMEM_rt;
	 input [1:0] MemtoRegW;
	 
	 always @* begin
	   if(RegWriteM&&EXMEM_WA!=0&&IFID_rs==EXMEM_WA)
		  Forward1=1;
		else if(RegWriteW&&MEMWB_WA!=0&&IFID_rs==MEMWB_WA)
		  Forward1=2;
		else
		  Forward1=0;
		if(RegWriteM&&EXMEM_WA!=0&&IFID_rt==EXMEM_WA)
		  Forward2=1;
		else if(RegWriteW&&MEMWB_WA!=0&&IFID_rt==MEMWB_WA)
		  Forward2=2;
		else
		  Forward2=0;
		if(RegWriteM&&EXMEM_WA!=0&&IDEX_rs==EXMEM_WA)
		  Forward3=1;
		else if(RegWriteW&&MEMWB_WA!=0&&IDEX_rs==MEMWB_WA)
		  Forward3=2;
		else 
		  Forward3=0;
		if (RegWriteM&&EXMEM_WA!=0&&IDEX_rt==EXMEM_WA)
		  Forward4=1;
		else if(RegWriteW&&MEMWB_WA!=0&&IDEX_rt==MEMWB_WA)
		  Forward4=2;
		else
		  Forward4=0;
		  
		if((MemtoRegW==1)&&MEMWB_WA!=0&&EXMEM_rt==MEMWB_WA)
		  Forward5=1;
		else
		  Forward5=0;
		end
endmodule

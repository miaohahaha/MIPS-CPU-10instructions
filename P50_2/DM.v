`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:19:38 12/06/2017 
// Design Name: 
// Module Name:    DM 
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
module DM(Result,WD,MemWrite,clk,reset,RD,PC
    );
	 input [31:0]Result;
    input [31:0]WD;
	 input MemWrite;
	 input clk;
	 input reset;
	 input [31:0]PC;
	 output [31:0]RD;
	 
	 reg [31:0] RAM[0:1023];
	 integer i;
	 initial begin
	   for(i=0;i<1024;i=i+1)begin
		  RAM[i]=0;
		  end
		end
	 always @(posedge clk)begin
	   if(reset)begin
		  for(i=0;i<1024;i=i+1)begin
		    RAM[i]=0;
		    end
		  end
		else if(MemWrite)begin
		  RAM[Result[11:2]]=WD;
		  $display("%d@%h: *%h <= %h", $time, PC, Result,WD);
		  end
	  end
	  assign RD=RAM[Result[11:2]];

	 
	 
 
endmodule

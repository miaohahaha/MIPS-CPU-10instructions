`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:45:33 12/06/2017 
// Design Name: 
// Module Name:    mips 
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
module mips(clk,reset   
    );
	 input clk;
	 input reset;
	 
	 wire [31:0] IFID_instr,IDEX_instr,EXMEM_instr,MEMWB_instr,IDEX_imm32,npc,RD1_D,PC,RD2_D,imm32_D,IFID_pc4,IFID_pc8;
	 wire [31:0] M4,RD1,RD2,MEMWB_WPC,inALU1,inALU2,ALUout_E,EXMEM_ALUout,EXMEM_RD2_new,DMout_M,EXMEM_WPC,instr,IFID_WPC;
	 wire [31:0] RD1_E,RD2_E,IDEX_pc8,IDEX_WPC,RD2_new,MEMWB_DMout,MEMWB_pc8,MEMWB_ALUout,EXMEM_pc8,AO;
	 wire [15:0] IFID_imm;
	 wire [4:0] IFID_rs,IFID_rt,MEMWB_WA,IFID_rd,GRFWA,IDEX_rd,IDEX_rs,IDEX_rt,IDEX_WA,EXMEM_WA;
	 wire [2:0] ALUctrl;
	 wire [1:0] RegDst,EXTOp,MemtoRegE,MemtoRegM,MemtoRegW,Forward1,Forward2,Forward3,Forward4;
	 wire jal,jr,j,nPC_sel,ALUSrc,RegWriteE,RegWriteM,MemWriteM,jalM,RegWriteW,Zero,pc_en,IFID_en,IDEX_reset;
	 
	 wire MemWriteD,Forward5;
	 wire [4:0]EXMEM_rt;
	 wire [31:0]DMinput;
	 
	 wire bbbM,bZero;
	 
	 Controller DController(
	 .instr(IFID_instr),
	 .RegDst(RegDst),
	 .jal(jal),
	 .jr(jr),
	 .j(j),
	 .nPC_sel(nPC_sel),/////////////
	 .EXTOp(EXTOp),
	 .MemWrite(MemWriteD)
    );
	 
	 Controller EController(
	 .instr(IDEX_instr),
	 .ALUSrc(ALUSrc),
	 .MemtoReg(MemtoRegE),
	 .RegWrite(RegWriteE),
	 .ALUctrl(ALUctrl)
    );
	 
	 Controller MController(
	 .instr(EXMEM_instr),
	 .MemtoReg(MemtoRegM),
	 .RegWrite(RegWriteM),
	 .MemWrite(MemWriteM),
	 .jal(jalM),///////////////
	 .bbb(bbbM)///////////////
    );
	 
	 Controller WController(
	 .instr(MEMWB_instr),
	 .MemtoReg(MemtoRegW),
	 .RegWrite(RegWriteW),
	 .MemWrite(MemWriteW)
    );
	 
	 
	 IFU IFU(
	 .clk(clk),
	 .reset(reset),
	 .offset(imm32_D),
	 .j_addr(IFID_instr[25:0]),
	 .nPC_sel(nPC_sel),
	 .Zero(Zero),
	 .jal(jal),
	 .npc(npc),
	 .jraddr(RD1_D),
	 .jr(jr),
	 .PC(PC),
	 .j(j),
	 .pc_en(pc_en),
	 .bZero(bZero),//////////////////////////////
	 .b_RD2(RD2_D)////////////////////////////
	 );
	 
	 IM IM(
	 .addr(PC[11:2]),
	 .instr(instr)
	 );
	 
	 CMP CMP(
	 .RD1(RD1_D),
	 .RD2(RD2_D),
	 .instr(IFID_instr),
	 .Zero(Zero),
	 .bZero(bZero)///////////////////////////
	 );
	 
	 EXT EXT(
	 .imm(IFID_imm),
	 .EXTOp(EXTOp),
	 .imm32(imm32_D)
	 );
	 
	 PCadd8 PCadd8(
	 .PC4(IFID_pc4),
	 .PC8(IFID_pc8)
	 );
	 
	 GRF GRF(
	 .clk(clk),
	 .reset(reset),
	 .RA1(IFID_rs),
	 .RA2(IFID_rt),
	 .WA(MEMWB_WA),
	 .WD(M4),
	 .RegWrite(RegWriteW),
	 .RD1(RD1),
	 .RD2(RD2),
	 .PC(MEMWB_WPC)
	 );
	 
	 ALU ALU(
	 .A(inALU1),
	 .B(inALU2),
	 .Result(ALUout_E),
	 .ALUctrl(ALUctrl),
	 .s(IDEX_instr[10:6])
	 );
	 
	 DM DM(
	 .Result(EXMEM_ALUout),
	 .WD(DMinput),
	 .MemWrite(MemWriteM),
	 .clk(clk),
	 .reset(reset),
	 .RD(DMout_M),
	 .PC(EXMEM_WPC)
	 );
	 
	 
	 Wall_IFID Wall_IFID(
	 .clk(clk),
	 .reset(reset),
	 .npc(npc),
	 .instr(instr),
	 .IFID_en(IFID_en),
	 .IFID_rd(IFID_rd),
	 .IFID_rs(IFID_rs),
	 .IFID_rt(IFID_rt),
	 .IFID_imm(IFID_imm),
	 .IFID_pc4(IFID_pc4),
	 .IFID_instr(IFID_instr),
	 .PC(PC),
	 .IFID_WPC(IFID_WPC)
	 );
	 
	 Wall_IDEX Wall_IDEX(
	 .clk(clk),
	 .reset(reset||IDEX_reset),
	 .RD1_D(RD1_D),
	 .RD2_D(RD2_D),
	 .imm32_D(imm32_D),
	 .IFID_pc8(IFID_pc8),
	 .IFID_rd(IFID_rd),
	 .IFID_rs(IFID_rs),
	 .IFID_rt(IFID_rt),
	 .IFID_WA(GRFWA),
	 .IFID_instr(IFID_instr),
	 .RD1_E(RD1_E),
	 .RD2_E(RD2_E),
	 .IDEX_imm32(IDEX_imm32),
	 .IDEX_rd(IDEX_rd),
	 .IDEX_rs(IDEX_rs),
	 .IDEX_rt(IDEX_rt),
	 .IDEX_WA(IDEX_WA),
	 .IDEX_pc8(IDEX_pc8),
	 .IDEX_instr(IDEX_instr),
	 .IFID_WPC(IFID_WPC),
	 .IDEX_WPC(IDEX_WPC)
    );
	 
	 Wall_EXMEM Wall_EXMEM(
	 .clk(clk),
	 .reset(reset),
	 .RD2_new(RD2_new),
	 .IDEX_pc8(IDEX_pc8),
	 .IDEX_WA(IDEX_WA),
	 .IDEX_instr(IDEX_instr),
	 .ALUout_E(ALUout_E),
	 .EXMEM_RD2_new(EXMEM_RD2_new),
	 .EXMEM_pc8(EXMEM_pc8),
	 .EXMEM_WA(EXMEM_WA),
	 .EXMEM_ALUout(EXMEM_ALUout),
	 .EXMEM_instr(EXMEM_instr),
	 .IDEX_WPC(IDEX_WPC),
	 .EXMEM_WPC(EXMEM_WPC),
	 .IDEX_rt(IDEX_rt),
	 .EXMEM_rt(EXMEM_rt)
    );
	 
	 Wall_MEMWB Wall_MEMWB(
	 .clk(clk),
	 .reset(reset),
	 .DMout_M(DMout_M),
	 .EXMEM_pc8(EXMEM_pc8),
	 .EXMEM_WA(EXMEM_WA),
	 .EXMEM_instr(EXMEM_instr),
	 .EXMEM_ALUout(EXMEM_ALUout),
	 .MEMWB_DMout(MEMWB_DMout),
	 .MEMWB_pc8(MEMWB_pc8),
	 .MEMWB_WA(MEMWB_WA),
	 .MEMWB_ALUout(MEMWB_ALUout),
	 .MEMWB_instr(MEMWB_instr),
	 .EXMEM_WPC(EXMEM_WPC),
	 .MEMWB_WPC(MEMWB_WPC)
    );
	 
	 STALL STALL(
	 .MemtoRegE(MemtoRegE),
	 .IFID_rs(IFID_rs),
	 .IFID_rt(IFID_rt),
	 .IDEX_WA(IDEX_WA),
	 .EXMEM_WA(EXMEM_WA),
	 .nPC_sel(nPC_sel),
	 .RegWriteE(RegWriteE),
	 .MemtoRegM(MemtoRegM),
	 .jr(jr),
    .IFID_en(IFID_en),
	 .pc_en(pc_en),
	 .IDEX_reset(IDEX_reset),
	 .MemWriteD(MemWriteD)
    );
	 
	 Forward Forward(
	 .RegWriteM(RegWriteM),
	 .RegWriteW(RegWriteW),
	 .EXMEM_WA(EXMEM_WA),
	 .MEMWB_WA(MEMWB_WA),
	 .IFID_rs(IFID_rs),
	 .IFID_rt(IFID_rt),
	 .IDEX_rs(IDEX_rs),
	 .IDEX_rt(IDEX_rt),
	 .Forward1(Forward1),
	 .Forward2(Forward2),
	 .Forward3(Forward3),
	 .Forward4(Forward4),
	 .Forward5(Forward5),
	 .EXMEM_rt(EXMEM_rt),
	 .MemtoRegW(MemtoRegW)
    );
	 
	 MUX1 M1(
	 .A(IFID_rt),
	 .B(IFID_rd),
	 .C(5'b11111),
	 .ctrl(RegDst),
	 .D(GRFWA)
	 );
	 
	 MUX2 M21(
	 .A(RD2_new),
	 .B(IDEX_imm32),
	 .ctrl(ALUSrc),
	 .D(inALU2)
	 );
	 
	 MUX2 M22(
	 .A(EXMEM_ALUout),
	 .B(EXMEM_pc8),
	 .ctrl(jalM||bbbM),/////////////////////////////////////
	 .D(AO)
	 );
	 
	 MUX3 M31(
	 .A(MEMWB_ALUout),
	 .B(MEMWB_DMout),
	 .C(MEMWB_pc8),
	 .ctrl(MemtoRegW),
	 .D(M4)
	 );
	 
	 MUX3 M32(
	 .A(RD1),
	 .B(AO),
	 .C(M4),
	 .ctrl(Forward1),
	 .D(RD1_D)
	 );
	 
	 MUX3 M33(
	 .A(RD2),
	 .B(AO),
	 .C(M4),
	 .ctrl(Forward2),
	 .D(RD2_D)
	 );

	 MUX3 M34(
	 .A(RD1_E),
	 .B(AO),
	 .C(M4),
	 .ctrl(Forward3),
	 .D(inALU1)
	 );
	 
	 MUX3 M35(
	 .A(RD2_E),
	 .B(AO),
	 .C(M4),
	 .ctrl(Forward4),
	 .D(RD2_new)
	 );
	 
	 MUX2 M23(
	 .A(EXMEM_RD2_new),
	 .B(M4),
	 .ctrl(Forward5),
	 .D(DMinput)
	 );
	 
	 
endmodule

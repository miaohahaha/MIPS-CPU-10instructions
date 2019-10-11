`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:46:28 12/06/2017 
// Design Name: 
// Module Name:    MUX 
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
module MUX1(A,B,C,ctrl,D
    );
	 input [4:0]A;
	 input [4:0]B;
	 input [4:0]C;
	 input [1:0]ctrl;
	 output reg [4:0]D;
	 always @* begin
	   case(ctrl)
		  2'b00:D=A;
		  2'b01:D=B;
		  2'b10:D=C;
		  default D=5'bx;
		  endcase
		  end
endmodule



module MUX2(A,B,ctrl,D
    );
	 input [31:0]A;
	 input [31:0]B;
	 input ctrl;
	 output reg [31:0]D;
	 always @* begin
	   case(ctrl)
		  1'b0:D=A;
		  1'b1:D=B;
		  default D=5'bx;
		  endcase
		  end
endmodule


module MUX3(A,B,C,ctrl,D
    );
	 input [31:0]A;
	 input [31:0]B;
	 input [31:0]C;
	 input [1:0]ctrl;
	 output reg [31:0]D;
	 always @* begin
	   case(ctrl)
		  2'b00:D=A;
		  2'b01:D=B;
		  2'b10:D=C;
		  default D=31'bx;
		  endcase
		  end
endmodule

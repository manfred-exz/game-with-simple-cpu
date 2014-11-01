`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:49:21 08/26/2014 
// Design Name: 
// Module Name:    clk_div 
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
module clock_divider(
	input 	wire 	clk_in,
	output 	wire 	clk_cpu,
	output 	wire 	clk_io,
	output 	wire 	clk_vga,
	output	wire	clk_blink,
	output   wire  [1:0]clk_7seg_scan,
	output 	reg [31:0]clk_div = 0,
	output 	reg [31:0]clk_div_dev = 0
	);
	
//	reg [31:0]clk_div = 0;
	 
	always @(posedge clk_in) begin
		clk_div <= clk_div + 1;
		clk_div_dev <= clk_div_dev + 1;
	end
		
	//OUTPUT Signals
//	assign clk_cpu = clk_in;
	assign clk_cpu = clk_div[1];	//50MHz, Note that 100MHz is not possible for this design
	assign clk_io 	= ~clk_cpu;
	assign clk_vga	= clk_div[1];	//25MHz
	assign clk_7seg_scan = clk_div[19:18];
	assign clk_blink = clk_div[25];
	 
endmodule

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
	output   wire  [1:0]clk_7seg_scan
	);
	
	reg [25:0]clk_div = 0;
	 
	always @(posedge clk_in)
		clk_div <= clk_div + 1;
		
	//OUTPUT Signals
//	assign clk_cpu = clk_in;
	assign clk_cpu = clk_div[0];	//50MHz, Note that 100MHz is not compatible for this design
	assign clk_io 	= ~clk_cpu;
	assign clk_vga	= clk_div[1];	//25MHz
	assign clk_7seg_scan = clk_div[19:18];
	assign clk_blink = clk_div[25];
	 
endmodule

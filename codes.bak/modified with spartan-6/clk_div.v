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
//	output 	wire 	clk_io,
	output 	wire 	clk_vga
	);
	
	reg clk_50mhz = 0, clk_25mhz = 0;
	 
	always @(posedge clk_in)
		clk_50mhz = ~clk_50mhz;
	
	always @(posedge clk_50mhz)
		clk_25mhz = ~clk_25mhz;
		
	//OUTPUT Signals
	assign clk_cpu = clk_in;
//	assign clk_io 	= ~clk_in;
	assign clk_vga	= clk_25mhz;
	 
endmodule

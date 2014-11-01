`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:17:16 09/27/2014
// Design Name:   display_scan_codes
// Module Name:   /home/manfred/workspace/vrlgWorkSpace/game_with_simple_cpu/workspace/test_top.v
// Project Name:  game_with_simple_cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: display_scan_codes
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_top;

	// Inputs
	reg clk_sys;
	reg [7:0] switch;
	reg [4:0] btn;
	reg ps2_clk;
	reg ps2_data;

	// Outputs
	wire [7:0] seg_out;
	wire [3:0] anode_out;
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;
	wire hs;
	wire vs;

	// Instantiate the Unit Under Test (UUT)
	display_scan_codes uut (
		.clk_sys(clk_sys), 
		.switch(switch), 
		.btn(btn), 
		.ps2_clk(ps2_clk), 
		.ps2_data(ps2_data), 
		.seg_out(seg_out), 
		.anode_out(anode_out), 
		.red(red), 
		.green(green), 
		.blue(blue), 
		.hs(hs), 
		.vs(vs)
	);

	initial begin
		// Initialize Inputs
		clk_sys = 0;
		switch = 0;
		btn = 0;
		ps2_clk = 0;
		ps2_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #1 clk_sys = ~clk_sys;
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:50:27 08/26/2014
// Design Name:   display_scan_codes
// Module Name:   D:/workspace/vrlgWorkspace/cpu_from_Li/codes/test_top.v
// Project Name:  cpu_from_Li
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
	reg clrn;
	reg ps2_clk;
	reg ps2_data;

	// Outputs
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;
	wire hs;
	wire vs;

	// Instantiate the Unit Under Test (UUT)
	display_scan_codes uut (
		.clk_sys(clk_sys), 
		.clrn(clrn), 
		.ps2_clk(ps2_clk), 
		.ps2_data(ps2_data), 
		.red(red), 
		.green(green), 
		.blue(blue), 
		.hs(hs), 
		.vs(vs)
	);

	initial begin
		// Initialize Inputs
		clk_sys = 0;
		clrn = 1;
		ps2_clk = 0;
		ps2_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #1 clk_sys = ~clk_sys;
      
endmodule


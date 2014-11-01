`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:50:15 02/27/2014 
// Design Name: 
// Module Name:    BTN_Anti_jitter 
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
module BTN_Anti_jitter(
	//CLK
	input wire clk,
	//INPUT
	input wire [4:0] button,
	//After anti jitter
	output reg [4:0] button_out = 32'h0000_0000
	);

	reg [31:0] counter = 32'h0000_0000;
	
	//the status of button and switch will change every 100000 clks
	always @(posedge clk) begin
		//if(counter >= 5) begin
		if(counter >= 100000) begin 
			counter <= 32'b0;
			button_out <= button;
		end
		//if any of the button or switch is on, then start counting, BUT
		//Don't know the purpose of the following code. Does it make the circuit any better?
		else// if(button > 0 || switch > 0 )
			counter <= counter + 1;
	end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:59 08/26/2014 
// Design Name: 
// Module Name:    bus 
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
module bus(	
	input wire [31:0]addr_bus,
	input wire m_read,
	input wire m_write,
	
	
	output wire write,
	output wire io_rdn,
	output wire io_wrn,
	output wire wvram,
	output wire rvram
   );
	
	wire io_space = (addr_bus[31:29] == 3'b101) ? 1'b1 : 1'b0;	// i/o space: 	a0000000-bfffffff
	wire vr_space = (addr_bus[31:29] == 3'b110) ? 1'b1 : 1'b0;	// vram space: c0000000-dfffffff
	
					  
	// output signals
	assign write   =   m_write & ~io_space & ~vr_space;    // data memory write
	assign io_rdn  = ~(m_read & io_space);                // i/o read
	assign io_wrn  = ~(m_write & io_space);                // i/o write
	assign wvram   =   m_write & vr_space;                 // video ram write
	assign rvram   =   m_read & vr_space;                 // video ram read


endmodule

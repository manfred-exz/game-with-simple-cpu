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
	input wire [31:0]d_t_mem,
	output wire [31:0]d_f_mem,
	
	//<<[keyboard]: d_f_mem = f(ready, key_data)
	input wire ready,
	input wire [7:0]key_data,
	//<<[vram]: d_f_mem = f(ascii)
	input wire [6:0]ascii,
	//<>[dram]:
	output wire we_dram,
	output wire [9:0]addr_dram,
	input wire [31:0]data_f_dram,
	output wire [31:0]data_t_dram,
	//>>[7seg]:
	output wire we_7seg,
	//<<[clk_div]
	input  wire [31:0]clk_div,
	
	output wire io_rdn,
	output wire io_wrn,
	output wire we_vram,
	output wire re_vram,
	output wire we_vram_shift
	
	
	
   );
	parameter true = 1'b1, false = 1'b0;
	
	wire dram_space 	= (addr_bus[31:28] == 4'b0000) ? true : false;	// data ram space:00000000-0fffffff
	wire vr_shift_space	= (addr_bus[31:8] == 24'h100000) ? true : false;	// vram shift: if not zero, then the screen will shift up/down for the specified pixels.
	wire clk_space		= (addr_bus[31:8] == 24'h100001) ? true : false;
	wire io_space 		= (addr_bus[31:29] == 3'b101) ? true : false;	// i/o space: 		a0000000-bfffffff, for now just keyboard
	wire vr_space 		= (addr_bus[31:29] == 3'b110) ? true : false;	// vram space: 	c0000000-dfffffff
	
	
	wire seg_space = (addr_bus[31:8] == 24'hfffffe) ? true : false;		// 7-segment space: ffff_fe00-ffff_feff
	
	
	
					  
	// output signals
	//		enable
	
	assign io_rdn  		= ~(m_read 	& 	io_space);                // i/o read
	assign io_wrn  		= ~(m_write & 	io_space);                // i/o write
	assign we_vram   	=   m_write & 	vr_space;                 // video ram write
	assign re_vram   	=   m_read 	& 	vr_space;                 // video ram read
	assign we_7seg 		= 	m_write & 	seg_space;
	assign we_vram_shift= 	m_write &	vr_shift_space;
	assign re_clk		= 	m_read	& 	clk_space;
	
	//		dram
	assign we_dram   =   m_write & ~io_space & ~vr_space;    // data memory write
	assign addr_dram = dram_space ? addr_bus[11:2] : 10'h0;
	assign data_t_dram = d_t_mem;
	
	assign d_f_mem = 	!io_rdn ? {ready,23'h0,key_data}
//	assign d_f_mem = 	!io_rdn ? {23'h0,ready,key_data}
								: (re_vram ? {25'h0, ascii} 
									: (re_clk ? clk_div
										: data_f_dram
										)
									);
	


endmodule

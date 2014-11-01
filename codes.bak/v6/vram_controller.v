`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:50 08/26/2014 
// Design Name: 
// Module Name:    vram_controller 
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
module vram_controller(
	input wire clk_sys,
	//address
	input wire [8:0]row_addr,	//vga
	input wire [9:0]col_addr,	
	input wire [14:2]addr_bus,	//cpu
	//enable
	input wire wvram,
	//data
	input wire [6:0]d_t_mem,
	output font_dot
    );
	wire [6:0]ascii;
	
    wire   [5:0] char_row = row_addr[8:3];                 // char row
    wire   [2:0] font_row = row_addr[2:0];                 // font row
    wire   [6:0] char_col = col_addr[9:3];                 // char col
    wire   [2:0] font_col = col_addr[2:0];                 // font col
	 
    // char ram, 640/8 = 80 = 64 + 16; 480/8 = 60;
    wire  [12:0] vga_cram_addr = (char_row<<6) + (char_row<<4) + char_col;
    wire  [12:0] char_ram_addr = wvram? addr_bus[14:2] : vga_cram_addr;
	 
	 (* bram_map = "yes" *)
    reg    [6:0] char_ram [0:4799];                        // 80 * 60 = 4800
    assign  ascii = char_ram[char_ram_addr];
	 
	 reg [1:0]wvram_sync = 2'b0;
	 always @ (posedge clk_sys)
        wvram_sync <= {wvram_sync[0],wvram};
    wire wvram_falling = ~wvram_sync[1] &
                   wvram_sync[0];           // had a falling edge
	 
    always @(posedge clk_sys) begin
        if (wvram_falling) begin
            char_ram[char_ram_addr] <= d_t_mem[6:0];
        end
    end
    // font_table 128 x 8 x 8 x 1
    wire [12:0] ft_a = {ascii,font_row,font_col};          // ascii,row,col
    font_table ft (ft_a,font_dot);


endmodule

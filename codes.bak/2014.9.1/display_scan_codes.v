/************************************************
  The Verilog HDL code example is from the book
  Computer Principles and Design in Verilog HDL
  by Yamin Li, published by A JOHN WILEY & SONS
************************************************/
module display_scan_codes (clk_sys,switch,btn,ps2_clk,ps2_data,seg_out,anode_out,red,green,blue,hs,vs);  // display key scan codes
	input        clk_sys;     // clk_sys: 100MHz
	input	 [7:0] switch;
	input  [4:0] btn;
	input        ps2_clk, ps2_data; // kbd clk and data
	output [7:0] seg_out;
	output [3:0] anode_out;
	output [2:0] red;
	output [2:0] green;
	output [1:0] blue;
	output       hs, vs;            // vga h and v synchronization

	wire clrn = ~btn[3];	//Button down
	wire         font_dot;          // font dot
	wire  [31:0] inst,pc,d_t_mem,addr_bus,d_f_mem;
	wire         write,read,io_rdn,io_wrn,wvram,rvram,ready,overflow;
	wire   [7:0] key_data;          // kbd code byte
	
	//CLK DIVIDER
	wire clk_cpu, clk_io, clk_vga, clk_blink;
	wire [1:0]clk_7seg_scan;
	clock_divider clk_div(
		.clk_in(clk_sys),
		.clk_cpu(clk_cpu),
		.clk_io(clk_io),
		.clk_vga(clk_vga),
		.clk_blink(clk_blink),
		.clk_7seg_scan(clk_7seg_scan)
		);
		
	//**************************ANTI JITTER***********************//
	//[OUT]ÎÈ¶¨µÄbutton/switchÐÅºÅ
//	wire [4:0]btn_out;
//	BTN_Anti_jitter BTN_OK (
//		//CLK
//		.clk(clk_sys),
//		
//		//INPUT
//		.button(btn),
//
//		//OUTPUT
//		.button_out(btn_out)
//		);
		
	//7-seg
	wire [31:0]disp_num;
	hex7seg seg(
    .scanning_clk(clk_7seg_scan), 
    .disp_num(disp_num), 
    .switch(switch[1:0]), 
    .seg_out(seg_out), 
    .anode_out(anode_out)
    );
		
	//dev-7-seg
	wire we_7seg;
	Device_GPIO_7seg seg_dev(
		.clk(clk_sys), 
		.clrn(clrn), 
		.write_enable(we_7seg), 
		.Test(switch[7:5]), 
		.disp_cpudata(d_t_mem), 
		//CPU data output
		.Test_data0({2'b00,pc[31:2]}),
		//pc[31:2]
		.Test_data1(32'h5a5a),
		//counter
		.Test_data2(inst), 			//Inst
		.Test_data3(addr_bus), 		//addr_bus
		.Test_data4(d_f_mem),	//Cpu_data2bus;
		.Test_data5(d_t_mem),	//Cpu_data4bus;
		.Test_data6(32'h5a5a), //pc;
//		.Test_data6({4{key_data}}), //pc;
		.disp_num(disp_num)
		);
		
		

	 

	//VGA CONTROLLER
	wire  [8:0] row_addr;          // pixel ram row addr, 480 (512) lines
	wire  [9:0] col_addr;          // pixel ram col addr, 640 (1024) pixels
	wire        vga_rdn;           // in vgac, rd_a = {row[8:0],col[9:0]}
//	wire  [7:0]vga_pixel = font_dot? 8'b111_111_11 : 8'b000_000_11; //white/blue
	reg 	[7:0]vga_pixel = 0;
	
	
	vgac vga_8 (clk_vga,clrn,vga_pixel,row_addr,col_addr,vga_rdn,
				  red,green,blue,hs,vs);
	//VRAM CONTROLLER
	 vram_controller vramc (
		 .clk_sys(clk_sys), 
		 .row_addr(row_addr), 
		 .col_addr(col_addr), 
		 .addr_bus(addr_bus[14:2]), 
		 .wvram(wvram), 
		 .d_t_mem(d_t_mem[6:0]), 
		 .font_dot(font_dot)
		 );
		 
		 
	//Cursor
	reg	[12:0]cur_cursor_addr = 0;
	wire  [12:0]cur_scan_char_addr = row_addr[8:3]*80 + col_addr[9:3];
	always @(negedge clk_cpu) begin
		if(wvram == 1)
			cur_cursor_addr <= cur_cursor_addr + 1;
	end		
	
		
	always @(posedge clk_sys) begin
		if(row_addr[2] == 1'b1 && clk_blink == 1 && cur_scan_char_addr == cur_cursor_addr)
			vga_pixel = font_dot  ? 8'b000_000_11 : 8'b111_111_11;
		else
			vga_pixel = font_dot ? 8'b111_111_11 : 8'b000_000_11;
	end

	//PS/2 KEYBOARD
	ps2_keyboard kbd (clk_cpu,clrn,ps2_clk,ps2_data,io_rdn,key_data,ready,
						 overflow);
	 
	//CPU
	wire m_write, m_read;
	single_cycle_cpu_io cpu (clk_cpu,clrn,pc,inst,addr_bus,m_write,m_read,d_f_mem,
								  d_t_mem);
									  
	//INSTRUCTION MEMORY
	scinstmem_make_code_break_code imem (pc, inst);

	//DATA MEMORY
	wire we_dram;
	wire [9:0]addr_dram;
	wire [31:0]data_f_dram, data_t_dram;
	d_ram dram (
		.clka(clk_io), // input clka
		.wea(we_dram), // input [0 : 0] wea
		.addra(addr_dram), // input [9 : 0] addra
		.dina(data_t_dram), // input [31 : 0] dina
		.douta(data_f_dram) // output [31 : 0] douta
		);
	 
	//BUS
	bus bs(	
		.addr_bus(addr_bus),
		.m_read(m_read),
		.m_write(m_write),
		.d_f_mem(d_f_mem),
		.d_t_mem(d_t_mem),
		
		.ascii(ascii),
		.ready(ready),
		.key_data(key_data),
		
		.we_dram(we_dram),
		.we_7seg(we_7seg),
		.addr_dram(addr_dram),
		.data_f_dram(data_f_dram),
		.data_t_dram(data_t_dram),
		
		.io_rdn(io_rdn),
		.io_wrn(io_wrn),
		.we_vram(wvram),
		.re_vram(rvram)
		
		);

endmodule

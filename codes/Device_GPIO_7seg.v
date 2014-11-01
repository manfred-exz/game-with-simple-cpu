`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:18:02 05/08/2014 
// Design Name: 
// Module Name:    Device_GPIO_7seg 
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
module Device_GPIO_7seg( 
	clk,
	clrn,
	write_enable,
	Test,
	disp_cpudata,
	Test_data0,
	Test_data1,
	Test_data2,
	Test_data3,
	Test_data4,
	Test_data5,
	Test_data6,
	disp_num
	);
	
	input clk,clrn,write_enable;
	input [2:0] Test;
	input [31:0]disp_cpudata,Test_data0,Test_data1,Test_data2,Test_data3,Test_data4,
	Test_data5, Test_data6;
	output[31:0]disp_num;
	reg [31:0]disp_num = 32'h5A5A5A5A;
	
	// 7 Segments LEDs read and write & CPU state display
	// assign seven_seg_out = disp_num[15:0];
	always @(posedge clk or negedge clrn) begin
		if(~clrn)
			disp_num <= 32'hAA5555AA;
		else begin
			case(Test) //SW[7:5]
				0: begin 
					if(write_enable) 
						disp_num <= disp_cpudata; 
					else 
						disp_num <= disp_num; 
				end
				1: disp_num <= {2'b00,Test_data0[31:2]};	//pc[31:2]
				2: disp_num <= Test_data1[31:0]; //counter[31:0]
				3: disp_num <= Test_data2; //Inst
				4: disp_num <= Test_data3; //addr_bus
				5: disp_num <= Test_data4; //Cpu_data2bus;
				6: disp_num <= Test_data5; //Cpu_data4bus;
				7: disp_num <= Test_data6; //pc;
			endcase
		end
		
	end
	
endmodule

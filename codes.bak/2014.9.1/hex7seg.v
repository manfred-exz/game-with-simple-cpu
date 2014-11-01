`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Companode_outy: 
// Engineer: 
// 
// Create Date:    18:28:38 02/27/2014 
// Design Name: 
// Module Name:    seven_seg_dev 
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
module hex7seg (

	//CLK & RST
	input wire [1:0] scanning_clk, 	// ��ʾɨ���źţ���ʱ�ӷ�Ƶ��á�

	//INPUT
	input wire [31:0] disp_num, 	// ����ʾ��32λ�������������
	input wire [1:0] switch,		// switch[0]����ѡ��0:���� 1:16������*2
	
	//OUTPUT
	output wire [7:0] seg_out, 		// 7������ʾ����
	output reg [3:0] anode_out 			// 4λ7���빲�����ƶˣ�����ɨ����ʾ����
);


	reg [3:0] digit;
	reg [7:0] graph_seg, digit_seg;
	wire [15:0] disp_current;
	
	assign seg_out = switch[0] ? digit_seg : graph_seg; // 0��ѡ��ͼ�Σ�1:16������
	assign disp_current = switch[1] ? disp_num[31:16] : disp_num[15:0];// 0:��16λ,1:��16λ
	
	
	
	// ɨ����ƣ�����ѡ����ʾֵ��graph_seg�ĺ���ο�"�߶���ʾͼ.xlsx"
	// ��ʱѡ��ǰ��ʾ������ܣ��͹�������źš�
	always @ (*) begin
		case (scanning_clk) // graph_seg��ͼ����ʾ��ӳ��ֵ�����㹹��7����ͼ��
			0: begin // disp_num[7:0]
				digit = disp_current[3:0]; //16��������ʾ��D3~D0��D19~D16
				
				graph_seg = {disp_num[24], disp_num[0], disp_num[4], disp_num[16],		//����������ӳ�䵽�����������
				disp_num[25], disp_num[17], disp_num[5], disp_num[12]}; 
				
				anode_out = 4'b1110;
				end
				
			1: begin // disp_num[15:8]
				digit = disp_current[7:4]; //16��������ʾ��D7~D4��D23~D20
				graph_seg = {disp_num[26], disp_num[1], disp_num[6], disp_num[18],		//����������ӳ�䵽�����������
				disp_num[27], disp_num[19], disp_num[7], disp_num[13]};
				
				anode_out = 4'b1101;
				end
				
			2: begin // disp_num[23:16]
				digit = disp_current[11:8]; //16��������ʾ��D11~D8��D27~D24
				graph_seg = {disp_num[28], disp_num[2], disp_num[8], disp_num[20],		//����������ӳ�䵽�����������
				disp_num[29], disp_num[21], disp_num[9], disp_num[14]};
				
				anode_out = 4'b1011;
				end
				
			3: begin // disp_num[31:24]
				digit = disp_current[15:12]; //16��������ʾ��D15~D12��D31~D28
				graph_seg = {disp_num[30], disp_num[3], disp_num[10], disp_num[22],	//����������ӳ�䵽�����������
				disp_num[31], disp_num[23], disp_num[11], disp_num[15]};
				
				anode_out = 4'b0111;
				end
				
		endcase
	end


	// hex7seg_Decod��16������ʾ���룬0������1Ϩ�� 
	always @ (*) 
		begin 
			case (digit) 
				4'h0: digit_seg = 7'b0000001; 
				4'h1: digit_seg = 7'b1001111; 
				4'h2: digit_seg = 7'b0010010; 
				4'h3: digit_seg = 7'b0000110; 
				4'h4: digit_seg = 7'b1001100; 
				4'h5: digit_seg = 7'b0100100; 
				4'h6: digit_seg = 7'b0100000; 
				4'h7: digit_seg = 7'b0001111; 
				4'h8: digit_seg = 7'b0000000; 
				4'h9: digit_seg = 7'b0000100; 
				4'hA: digit_seg = 7'b0001000; 
				4'hB: digit_seg = 7'b1100000; 
				4'hC: digit_seg = 7'b0110001; 
				4'hD: digit_seg = 7'b1000010; 
				4'hE: digit_seg = 7'b0110000; 
				4'hF: digit_seg = 7'b0111000; 
			endcase 
		end 
endmodule

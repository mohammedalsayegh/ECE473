//ID_EX_pipe.v



module ID_EX_PIPE(
	input wire clock,
	input wire reset,
	input wire [31:0] pc_in,
	input wire [31:0] instr_in,
	
	// non-controller
	input wire [31:0] data_in_1,
	input wire [31:0] data_in_2,
	input wire [31:0] sextend_in,
	input wire [31:0] zerotend_in,
	
	output reg [31:0] data_out_1,
	output reg [31:0] data_out_2,
	
	output reg [31:0]instr_out,
	output reg reg_dst_out,
	output reg [4:0] rd_out,
	output reg [4:0] rt_out,
	output reg [4:0] rs_out,
	
	//controller
	input wire [1:0] op2_src_in,
	input wire reg_write_in,
	input wire reg_dst_in,
	input wire mem_reg_dst_in,
	output reg reg_write_out,
	output reg mem_reg_dst_out,
	
	//jump, jal, I type stuff
	input wire mem_write_in,
	output reg [31:0] pc_out,
	output reg [31:0] zeroext_out,
	output reg [31:0] sextend_out,
	output reg mem_write_out,
	output reg [1:0] op2_src_out,
	input wire jal_in,
	output reg jal_out,
	input wire jump_in,
	output reg jump_out
	);
	
	initial begin
		data_out_1 = 32'h00000000;
		data_out_2 = 32'h00000000;
		sextend_out = 32'h00000000;
		rt_out = 5'b00000;
		rs_out = 5'b00000;
		rd_out = 5'b00000;
		pc_out = 32'h00000000;
		reg_dst_out = 0;
		mem_reg_dst_out = 0;
		reg_write_out = 0;
		mem_write_out = 0;
		op2_src_out = 0;
		jal_out = 0;
	end
	
	always @(posedge clock) begin
	
		if (reset == 1'b1) begin
			data_out_1 <= 32'h00000000;
			data_out_2 <= 32'h00000000;
			sextend_out <= 32'h00000000;
			zeroext_out <= 32'h00000000;
			rt_out <= 5'b00000;
			rs_out <= 5'b00000;
			rd_out <= 5'b00000;
			pc_out <= 32'h00000000;
			reg_dst_out <= 0;
			mem_reg_dst_out <= 0;
			reg_write_out <= 0;
			mem_write_out <= 0;
			op2_src_out <= 0;
			jal_out <=0;
			jump_out <=0;
			
		end 
		
		else begin
			data_out_1 <= data_in_1;
			data_out_2 <= data_in_2;
			sextend_out <= sextend_in;
			zeroext_out <= zerotend_in;
			instr_out <= instr_in;
			rt_out <= instr_in[20:16];
			rs_out <= instr_in[25:21];
			rd_out <= instr_in[15:11];
			pc_out <= pc_in;
			reg_dst_out <= reg_dst_in;
			mem_reg_dst_out <= mem_reg_dst_in;
			reg_write_out <= reg_write_in;
			mem_write_out <= mem_write_in;
			op2_src_out <= op2_src_in;
			jal_out <= jal_in;
			jump_out <= jump_in;
		end
	end
endmodule

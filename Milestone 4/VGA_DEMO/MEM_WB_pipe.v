//MEM_WB_pipe.v


module MEM_WB_pipe(
	input wire clock,
	input wire reset,
	input wire reg_write_in,
	input wire mem_reg_dst_in,
	input wire [31:0] alu_in,	
	input wire [31:0] ram_data_in,
	input wire [4:0] dst_in,
	output reg [31:0] ram_data_out,
	output reg [31:0] alu_out,
	output reg mem_reg_dst_out,
	output reg reg_write_out,
	output reg [4:0] dst_out);
	
	initial begin
		reg_write_out = 0;
		mem_reg_dst_out = 0;
		ram_data_out = 32'h00000000;
		alu_out = 32'h00000000;
		dst_out = 5'b00000;
	end
	
	always @(posedge clock) begin
		if (reset == 1'b1) begin
			reg_write_out <= 0;
			mem_reg_dst_out <= 0;
			ram_data_out <= 32'h000000000;
			alu_out <= 32'h00000000;
			dst_out <= 5'b00000;
		end else begin
			reg_write_out <= reg_write_in;
			mem_reg_dst_out <= mem_reg_dst_in;
			ram_data_out <= ram_data_in;
			alu_out <= alu_in;
			dst_out <= dst_in;
		end
	end
endmodule


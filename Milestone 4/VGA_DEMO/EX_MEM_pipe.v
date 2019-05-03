//EX_MEM_pipe.v

module EX_MEM_pipe(
	input wire clock,
	input wire reset,
	
	// non-controller stuff
	input wire [31:0] alu_in,
	input wire [4:0] dst_in,
	
	//controller stuff
	input wire reg_write_in,
	input wire mem_reg_dst_in,
	output reg reg_write_out,
	output reg mem_reg_dst_out,
	output reg [31:0] alu_out,
	input wire mem_write_in,
	input wire [31:0] rt_in,
	output reg [31:0] rt_out,
	output reg mem_write_out,
	output reg [4:0] dst_out
	);
	
	initial begin
		alu_out = 32'h00000000;
		dst_out = 5'b00000;
		mem_reg_dst_out = 0;
		reg_write_out = 0;
		rt_out  = 0;
		mem_write_out = 0;
	end
	
	always @(posedge clock) begin
		if (reset == 1'b1) begin
			alu_out <= 32'h00000000;
			dst_out <= 5'b00000;
			mem_reg_dst_out <= 0;
			reg_write_out <= 0;
			rt_out <= 0;
			mem_write_out <= 0;
		end else begin
			alu_out <= alu_in;
			dst_out <= dst_in;
			mem_reg_dst_out <= mem_reg_dst_in;
			reg_write_out <= reg_write_in;
			rt_out <= rt_in;
			mem_write_out <= mem_write_in;
		end
	end
endmodule
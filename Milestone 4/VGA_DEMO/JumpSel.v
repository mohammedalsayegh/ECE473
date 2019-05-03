//JumpSel.v

module JumpSel(
	input wire [4:0] rs_id_ex,
	input wire [4:0] ex_mem_dst,
	input wire [4:0] mem_wb_dst,
	input wire [31:0] ex_mem_addr,
	input wire [31:0] mem_wb_addr,
	input wire [31:0] id_ex_addr,
	input wire j_jump,
	input wire [26:0] sign_imm,
	input wire [31:0] pc,
	input wire [31:0] rs_if_id,
	input wire jr,
	output reg [31:0] j_addr
	);
	
	always @* begin
	
		if (jr == 1) begin
			j_addr = rs_if_id;
		end
	
		if (j_jump == 1)  begin
			j_addr = {pc[31:28],(sign_imm << 2)};
		end 
		
		else begin
			if (rs_id_ex == ex_mem_dst) begin
				j_addr = ex_mem_addr;
			end else begin
				j_addr = id_ex_addr;
			end
		end
	end
endmodule

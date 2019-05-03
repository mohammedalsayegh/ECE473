//JumpSel.v

module JumpSel(
	input wire [4:0] rs_in,
	input wire [4:0] ex_mem_dst,
	input wire [31:0] ex_mem_addr,
	input wire [31:0] id_ex_addr,
	output reg [31:0] j_addr
	);
	
	always @* begin
		
		if (rs_in == ex_mem_dst) begin
			j_addr = ex_mem_addr;
		end else begin
			j_addr = id_ex_addr;
		end
	end
endmodule
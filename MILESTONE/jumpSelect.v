module jumpSelect(
	input wire [4:0] rs_id_ex,
	input wire [4:0] ex_mem_dest,
	input wire [4:0] mem_wb_dest,
	input wire [31:0] ex_mem_addr,
	input wire [31:0] mem_wb_addr,
	input wire [31:0] id_ex_addr,
	input wire Jump,
	input wire [26:0] Address,
	input wire [31:0] pc,
	input wire [31:0] rs_if_id,
	input wire jr,
	output reg [31:0] j_addr
);

	always begin
		if(jr == 1) j_addr = rs_if_id;
		
		if(Jump == 1) j_addr = {pc[31:28],(Address << 2)};
		else begin
			if(rs_id_ex == ex_mem_dest) 
			j_addr = ex_mem_dest;
			else j_addr = id_ex_addr;
		
		end
		
	end

endmodule

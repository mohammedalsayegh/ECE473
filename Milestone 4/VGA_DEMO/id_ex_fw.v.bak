//id_ex_fw.v

module id_ex_fw(
	input wire [31:0] data_in,
	input wire [31:0] ins,
	input wire [31:0] mem_wb_data,
	input wire [4:0] mem_wb_dst,
	output reg [31:0] data_out
	);
	
	integer rs;
	
	always @* begin
		rs = ins[25:21];
		
		if ((rs == mem_wb_dst)) begin
			data_out = mem_wb_data;
		end else begin
			data_out = data_in;
		end
	end
endmodule
//id_ex_fw.v

module ID_EX_FW(
	input wire [31:0] data_in,
	input wire [31:0] ins,
	input wire [31:0] mem_wb_data,
	input wire [4:0] mem_wb_dst,
	input wire jr,
	output reg [31:0] data_out
	);
	
	integer rs;
	
	always @* begin
	
		rs = ins[25:21];
		if (jr == 1) begin
			data_out = data_in;
		end
		
		else begin
			if ((rs == mem_wb_dst)) begin
				data_out = mem_wb_data;
			end 
		
			else begin
				data_out = data_in;
			end
		end
	end
endmodule

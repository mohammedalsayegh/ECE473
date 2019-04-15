//id_ex_fw.v

module ID_EX_Forward(
	input wire [31:0] data_in,
	input wire [31:0] instruction,
	input wire [31:0] mem_wb_data,
	input wire [4:0] mem_wb_dest,
	input wire jr,
	output reg [31:0] data_out
	);
	
	integer rs;
	
	always @* begin
	
		rs = instruction[25:21];
		if (jr == 1) begin
			data_out = data_in;
		end
		
		else begin
			if ((rs == mem_wb_dest)) begin
				data_out = mem_wb_data;
			end 
		
			else begin
				data_out = data_in;
			end
		end
	end
endmodule

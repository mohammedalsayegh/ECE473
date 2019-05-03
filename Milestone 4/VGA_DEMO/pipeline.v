//file pipeline.v


module pipeline (
	input wire clock,
	input wire [4:0] data_in_RD,
	input wire [31:0] data_in_D1,
	input wire [31:0] data_in_D2,
	output reg [31:0] data_out_D1,
	output reg [31:0]	data_out_D2,
	output reg [4:0] data_out_RD	
	);
	
	
	always @(posedge clock) begin
		data_out_D1<=data_in_D1;
		data_out_D2<=data_in_D2;
		data_out_RD<=data_in_RD;
			
	end
		
		
endmodule

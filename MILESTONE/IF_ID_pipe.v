module IF_ID_pipe(
	input wire clock,
	input wire reset,
	input wire [31:0] pc_in,
	input wire [31:0] inst_in,
	output reg [31:0] pc_out,
	output reg [31:0] inst_out
);

initial begin
	inst_out =0;
end

	always @(posedge clock) begin
		if(reset == 1'b1) begin
			pc_out <=0;
			inst_out <= 0;
		end 
		else begin
			pc_out <= pc_in;
			inst_out <= inst_in;
		end

	end

endmodule

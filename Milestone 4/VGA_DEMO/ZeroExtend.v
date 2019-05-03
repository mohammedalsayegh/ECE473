//ZeroExtend.v


module ZeroExtend(
	input wire [15:0] in,
	output reg [31:0] out);
	
	always @(in) begin
		out = 32'h00000000;
		out = out + in[15:0];
	end
endmodule
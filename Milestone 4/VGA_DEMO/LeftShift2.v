//LeftShift2.v

module LeftShift2(
	input wire [31:0] in,
	output reg [31:0] out
	);
	
	always @* begin
		out = in << 2;
	end
endmodule
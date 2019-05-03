//Zeros.v

module Zeros (output reg [31:0] zeros);

	always @* begin
		zeros = 32'h00000000;
	end
endmodule
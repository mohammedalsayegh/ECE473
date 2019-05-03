// Add.v

module Add4(
	input wire [31:0] in,
	input wire stall,
	output reg [31:0] out);
	
	always @* begin
		if (stall == 1'b0) begin
			out <= in + 4;
		end
		
		else begin
			out <= in;
		end
	end
endmodule
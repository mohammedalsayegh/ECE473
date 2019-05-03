// Add.v

module add(
	input wire [31:0] port1, port2,
	output reg [31:0] out);
	
	always @(*) begin
		out <= port1 + port2;
	end
endmodule
module Cycle_Counter(
	input wire clock, reset,
	
	output reg [15:0] cycle

);
initial begin

	cycle = 0;
end

	always @(posedge clock) begin
		if(reset == 1'b1) cycle <= 0;
		else cycle <= cycle +1;
	
	end
endmodule

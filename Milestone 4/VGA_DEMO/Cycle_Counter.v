//Cycle_Counter.v

module Cycle_Counter(
	input wire clock, reset,
	output reg [15:0] cycle);
				
	initial begin
			cycle = 0;
	end
	
	always @(posedge clock) begin
		if (reset == 1'b1) begin 
			cycle <= 0;
		end else begin
			cycle <= cycle + 1;
		end
	end
	

endmodule
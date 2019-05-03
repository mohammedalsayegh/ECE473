//IF_ID_pipe.v

module IF_ID_pipe(
	input wire clock,
	input wire reset,
	input wire [31:0] PC_in,
	input wire [31:0] instr_in,
	output reg [31:0] PC_out,
	output reg [31:0]	instr_out
	);
	
	initial begin
		instr_out = 0;
	end
	
	always @(posedge clock) begin
	
		if (reset == 1'b1) begin
			PC_out<=0;
			instr_out<=0;
		end
		
		else begin
			PC_out<=PC_in;
			instr_out<=instr_in;
		end
		
	end
endmodule
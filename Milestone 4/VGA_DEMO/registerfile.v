//file registerfile.v


module registerfile (
	input wire clock,
	input wire reset,
	input wire write_en,
	input wire clock_debug,
	input wire [4:0] read_address_debug,
	input wire [31:0] data_in,
	output reg [31:0] data_out_1,
	output reg [31:0]	data_out_2,
	output reg [31:0] data_out_debug,
	input wire [4:0] read_address_1,
	input wire [4:0] read_address_2,
	input wire [4:0] write_address
	);
	
	reg [31:0] Regfile [31:0];
	integer i;
	
	initial begin
		for (i=0;i<32;i=i+1) begin
			Regfile[i]=0;	
		end
		
		Regfile[29] = 32'h000000FF;
		
		
	end
		
	always @(posedge clock) begin
		
		
		if (reset == 1'b1) begin
			for (i=0; i<32; i=i+1) begin
				Regfile[i]<=0;	
			end
			
			Regfile[29] = 32'h000000FF;
			
		end 
		
		else if (write_en == 1'b1 && write_address != 5'b00000) begin
			Regfile[write_address]<=data_in;
		end
		
	end
	
	always@(negedge clock) begin
		data_out_1 <= Regfile[read_address_1];
		data_out_2 <= Regfile[read_address_2];
	end

	always@(negedge clock_debug) begin
		data_out_debug <= Regfile[read_address_debug];
	end
		
		
endmodule

	
	
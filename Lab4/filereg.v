module filereg(
	input wire [4:0] radd1,
	input wire [4:0] radd2,
	input wire [31:0] write_data_in,
	input wire [4:0] write_address,
	input wire writeEnable,
	input wire reset,
	input wire clock,
	
	output reg [31:0] dout1,
	output reg [31:0] dout2,
	
	//debug i/o
	input wire [4:0] radddb,
	input wire dbugClk,
	output reg [31:0] doutdb
	);	
	
	integer i;
	reg [31:0] register[31:0];
	
	initial begin
		for (i = 0; i < 32; i = i + 1) begin //initial conditions
		register[i] = i;
		end
	end

	
	always @(posedge clock) begin
	
		dout1 <= register[radd1];
		dout2 <= register[radd2];
	
		if (writeEnable == 1'b1) begin
			register[write_address] <= write_data_in;
		end 
		
		if (reset == 1'b1) begin //resets registers to zero //this part of the code has been problematic
			for (i = 0; i < 32; i = i + 1) begin //initial conditions
			register[i] = 0;
			end
		end 
		

	end
	
	always @(posedge dbugClk) begin
		doutdb <= register[radddb];
	end
endmodule

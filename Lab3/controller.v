	module controller(
	input reset,
	input one, 
	input x0,
	input clk,
	
	output reg SEL,
	output reg WEN,
	output reg [1:0] FS,
	output [2:0] state_out);
	
	reg [2:0] state;
	assign state_out =state;
	parameter [2:0] s0=3'b000,
					s1=3'b001,
					s2=3'b010,
					s3=3'b011,
					s4=3'b100;
					
		always @ (posedge clk or posedge reset)  begin
			if(reset == 1) begin
			SEL <= 0;
			WEN <= 1;
			FS <= 2'b11;
			state <= s0;
			end
			else begin
				case(state)
				
				s0: begin
					SEL <= 1;
					WEN <= 1;
					FS <= 2'b11;
					
					if (one == 1'b1) begin
					state <= s1;
					end 
					else if (x0 == 1'b0) begin
					state <= s4;
					end 
					else if (x0 == 1'b1) begin
					state <= s2;
					end
				end
				s1: begin
					SEL <= 1;
					WEN <= 1;
				end
				
				s2: begin
					SEL <= 1;
					WEN <= 0;
					FS <= 2'b00;
					state <= s3;
				end
				s3: begin
					SEL <= 1;
					WEN <= 1;
					FS = 2'b10;
					
					state <= s4;
				end
				s4: begin
					SEL <= 1;
					WEN <= 1;
					FS = 2'b01;
				
					if (one == 1) begin
					state <= s1;
					end 
					else if (x0 == 1'b1) begin
					state <= s2;
					end 
					else if (x0 == 1'b0) begin
					state <= s0;
					end
				end
				
				default: state <= s0;
				
			endcase	
			end
		end				
  endmodule
  
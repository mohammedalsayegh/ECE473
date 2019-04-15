module ALU(
	input wire [31:0] X,
	input wire [31:0] Y,
	input wire [31:0] ins,
	input wire [31:0] pc,
	output reg [31:0] result);
	
	integer shift_am;
	integer i;
	initial begin
		result = 32'h00000000;
	end
	
	always @* begin
		shift_am = ins[10:6];
		
		if (ins[31:26] == 6'b000000) begin		//r-type
		
			if(ins[5:0] == 6'b100000) begin		//normal add
				result = X + Y;
			end
			
			if(ins[5:0] == 6'b100001) begin		//unsigned add
				result = X + Y;
			end
			
			if(ins[5:0] == 6'b100010) begin		//normal sub
				result = X - Y;
			end
			
			if(ins[5:0] == 6'b100011) begin		//unsigned sub
				result = X - Y;
			end
			
			if(ins[5:0] == 6'b100100) begin		//and
				result = X & Y;
			end
			
			if(ins[5:0] == 6'b100101) begin		//or
				result = X | Y;
			end
			
			if(ins[5:0] == 6'b100111) begin		//nor
				result = ~(X | Y);
			end
			
			if(ins[5:0] == 6'b101010) begin		//slt
				if (X < Y) begin
					result = 1;
				end else begin
					result = 0;
				end
			end
			
			if(ins[5:0] == 6'b000000) begin		//sll
				result = Y << shift_am;
			end
			
			if(ins[5:0] == 6'b000010) begin		//srl
				result = Y >> shift_am;
			end
			
			if(ins[5:0] == 6'b000011) begin		//sra
				result = Y >> shift_am;
				if (Y[31] == 1'b1) begin
					for (i = 0; i < shift_am; i=i+1) begin
						result[31-i] = 1'b1;
					end
				end
			end
			
			if(ins[5:0] == 6'b001000) begin		//jr
				//result = 32'h00000000;
				result = X;
			end
		end
		
		//i-type
		if (ins[31:26] == 6'b001100) begin		//andi
			result = X & Y;
		end
		
		if (ins[31:26] == 6'b001101) begin		//ori
			result = X | Y;
		end
		
		if (ins[31:26] == 6'b001010) begin		//slti
			if (X < Y) begin
					result = 1;
				end else begin
					result = 0;
				end
		end
		
		if (ins[31:26] == 6'b001000) begin		//addi
			result = X + Y;
		end
		
		if (ins[31:26] == 6'b001001) begin		//addiu
			result = X + Y;
		end	
		if (ins[31:26] == 6'b100011) begin		//lw
			result = X + Y;
		end
		
		if (ins[31:26] == 6'b101011) begin		//sw
			result = X + Y;
		end
		
		if (ins[31:26] == 6'b001111) begin		//lui
			result = Y << 16;
		end
		
		//j-type
		
		if (ins[31:26] == 6'b00011) begin		//jal
			result = pc + 4;
		end
 
		if(ins[31:0] == 32'h00000000) begin		//nop
			result = 32'h00000000;
		end
	end
endmodule

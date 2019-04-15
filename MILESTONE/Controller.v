//Controller.v

module Controller(
	input wire [31:0] ins,
	output reg [1:0] op2_src,
	output reg reg_write,
	output reg reg_dest,
	output reg mem_reg_dst,
	output reg mem_write,
	output reg jal,
	output reg jump_out,
	output reg j_jump,
	output reg stall,
	output reg jr
	);
	
	integer instr;
	
	always @* begin
		instr = ins[31:26];
		if(instr == 6'b000000) begin
			reg_write = 1;
			op2_src = 2'b00;
			reg_dest = 0;
			mem_reg_dst = 0;
			jump_out = 0;
			j_jump = 0;
			mem_write = 0;
			jal = 0;
			stall = 0;
			jr = 0;
			//jump register instruction
			if (ins[5:0] == 6'b001000) begin
				jump_out = 1;
				reg_write = 0;
				op2_src = 2'b00;
				reg_dest = 1;
				mem_reg_dst = 0;
				j_jump = 0;
				mem_write = 0;
				jal = 0;
				stall = 0;
				jr = 1;
			end
		end 
		else if(instr != 6'b000000) begin
			if(instr == 6'b001100) begin	//andi
				op2_src = 2'b10;
				reg_write = 1;
				reg_dest = 1;
				mem_reg_dst = 0;
				jump_out = 0;
				j_jump = 0;
				mem_write = 0;
				jal = 0;
				stall = 0;
				jr = 0;
			end
			if(instr == 6'b001101) begin	//ori
				op2_src = 2'b01;
				reg_write = 1;
				reg_dest = 1;
				mem_reg_dst = 0;
				jump_out = 0;
				j_jump = 0;
				mem_write = 0;
				jal = 0;
				stall = 0;
				jr = 0;
			end
			if(instr == 6'b001010) begin	//slti
				op2_src = 2'b01;
				reg_write = 1;
				reg_dest = 1;
				mem_reg_dst = 0;
				jump_out = 0;
				j_jump = 0;
				mem_write = 0;
				jal = 0;
				stall = 0;
				jr = 0;
			end
			if(instr == 6'b001000) begin	//addi
				op2_src = 2'b01;
				reg_write = 1;
				reg_dest = 1;
				mem_reg_dst = 0;
				jump_out = 0;
				j_jump = 0;
				mem_write = 0;
				jal = 0;
				stall = 0;
				jr = 0;
			end
			if(instr == 6'b001001) begin	//addiu
				op2_src = 2'b01;
				reg_write = 1;
				reg_dest = 1;
				mem_reg_dst = 0;
				jump_out = 0;
				j_jump = 0;
				mem_write = 0;
				jal = 0;
				stall = 0;
				jr = 0;
			end
			if(instr == 6'b100011) begin	//lw
				op2_src = 2'b01;
				reg_write = 1;
				reg_dest = 1;
				mem_reg_dst = 1;
				jump_out = 0;
				j_jump = 0;
				mem_write = 0;
				jal = 0;
				stall = 0;
				jr = 0;
			end
			if(instr == 6'b101011) begin	//sw
				op2_src = 2'b01;
				reg_write = 0;
				reg_dest = 1;
				mem_reg_dst = 1;
				jump_out = 0;
				j_jump = 0;
				mem_write = 1;
				jal = 0;
				stall = 0;
				jr = 0;
			end
			if(instr == 6'b001111) begin	//lui
				op2_src = 2'b10;
				reg_write = 1;
				reg_dest = 1;
				mem_reg_dst = 0;
				jump_out = 0;
				j_jump = 0;
				mem_write = 0;
				jal = 0;
				stall = 0;
				jr = 0;
			end
			if(instr == 6'b000010) begin	//j
				op2_src = 2'b01;
				reg_write = 0;
				reg_dest = 0;
				mem_reg_dst = 0;
				jump_out = 1;
				j_jump = 1;
				jal = 0;
				mem_write = 0;
				stall = 0;
				jr = 0;
			end
			if(instr == 6'b000011) begin	//jal
				op2_src = 2'b01;
				reg_write = 1;
				reg_dest = 0;
				mem_reg_dst = 0;
				jump_out = 1;
				j_jump = 1;
				jal = 1;
				mem_write = 0;
				jr = 0;
			end
			if(instr == 6'b000100) begin	//beq
				op2_src = 2'b00;
				reg_write = 0;
				reg_dest = 0;
				mem_reg_dst = 0;
				jump_out = 0;
				j_jump = 0;
				jal = 0;
				mem_write = 0;
				jr = 0;
			end
			if(instr == 6'b000101) begin	//bne
				op2_src = 2'b00;
				reg_write = 0;
				reg_dest = 0;
				mem_reg_dst = 0;
				jump_out = 0;
				j_jump = 0;
				jal = 0;
				mem_write = 0;
				jr = 0;
			end
			if(instr == 6'b000111) begin	//bgtz
				op2_src = 2'b00;
				reg_write = 0;
				reg_dest = 0;
				mem_reg_dst = 0;
				jump_out = 0;
				j_jump = 0;
				jal = 0;
				mem_write = 0;
				jr = 0;
			end
			if(instr == 6'b000001) begin	//bgez
				op2_src = 2'b00;
				reg_write = 0;
				reg_dest = 0;
				mem_reg_dst = 0;
				jump_out = 0;
				j_jump = 0;
				jal = 0;
				mem_write = 0;
				jr = 0;
			end
		end
		else begin
			reg_write = 0;
		end
	end
endmodule

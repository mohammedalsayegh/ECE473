//br_controller.v


module br_controller(
	input wire [31:0] ins,
	input wire [4:0] id_ex_dst,
	input wire [4:0] ex_mem_dst,
	input wire [4:0] mem_wb_dst,
	input wire [31:0] rs_data,
	input wire [31:0] rt_data,
	input wire [31:0] data_id_ex,
	input wire [31:0] data_ex_mem,
	input wire [31:0] data_mem_wb,
	input wire [31:0] pc,
	output reg [31:0] b_addr,
	output reg branch
	);
	
	integer rs, rt, op1, op2, imm;
	
	always @* begin
		rs = ins[25:21];
		rt = ins[20:16];
		imm = ins[15:0];
		
		//get op1 data
		if (rs == id_ex_dst) begin
			op1 = data_id_ex;
		end else if (rs == ex_mem_dst) begin
			op1 = data_ex_mem;
		end else if (rs == mem_wb_dst) begin
			op1 = data_mem_wb;
		end else begin
			op1 = rs_data;
		end
		
		//get op2 data
		if (rt == id_ex_dst) begin
			op2 = data_id_ex;
		end else if (rt == ex_mem_dst) begin
			op2 = data_ex_mem;
		end else if (rt == mem_wb_dst) begin
			op2 = data_mem_wb;
		end else begin
			op2 = rt_data;
		end
		
		
		b_addr = pc + 4 + ({{14{imm[15]}},imm[15:0]} << 2);
		
		case (ins[31:26])
			6'b000100:		//beq
			begin
				branch = (op1 == op2);
			end
			6'b000101:		//bne
			begin
				branch = (op1 != op2);
			end
			6'b000111:		//bgtz
			begin
				branch = (op1 > op2);
			end
			6'b000001:		//bgez
			begin
				branch = (op1 >= op2);
			end
			default:
			begin
				branch = 0;
			end
		endcase
	end
endmodule
	
	
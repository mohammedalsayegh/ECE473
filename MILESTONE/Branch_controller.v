module branch_controller(
	input wire [31:0] instruction,
	input wire [4:0] id_ex_dest,
	input wire [4:0] ex_mem_dest,
	input wire [4:0] mem_wb_dest,
	input wire [31:0] rsData,
	input wire [31:0] rtData,
	input wire [31:0] data_id_ex,
	input wire [31:0] data_ex_mem,
	input wire [31:0] data_mem_wb,
	input wire [31:0] pc,
	output reg [31:0] branch_addr,
	output reg branch
);

integer rs, rt, opr1, opr2, imm;

	always begin
		rs = instruction[25:21];
		rt = instruction[20:16];
		imm = instruction[15:0];
		//data for opr1
		if(rs == id_ex_dest) opr1 = data_id_ex;
			else if(rs == ex_mem_dest) opr1 = data_ex_mem;
			else if(rs == mem_wb_dest) opr1 = data_mem_wb;
			else opr1 = rsData;
		
		//data for opr2
		if(rt == id_ex_dest) opr2 = data_id_ex;
		else if(rt == ex_mem_dest) opr2 = data_ex_mem;
		else if(rt == mem_wb_dest) opr2 = data_mem_wb;
		else opr2 = rtData;
		
		branch_addr = pc+4+({{14{imm[15]}}, imm[15:0]} << 2);
		
		case(instruction[31:26])
		6'b000100: //beq
		begin
			branch = (opr1 ==opr2);
		end
		6'b000101: //bne
		begin
			branch = (opr1 != opr2);
		end
		6'b000111: //bgtz
		begin
			branch = (opr1 > opr2);
		end
		6'b000001: //bgez
		begin
			branch = (opr1 >= opr2);
		end
		default: branch =0;
		
		endcase
	end
	
endmodule

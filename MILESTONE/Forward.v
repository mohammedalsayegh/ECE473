module Forward(
	input wire [4:0] rsIn,
	input wire [4:0] rtIn,
	input wire [4:0] ex_mem_dest,
	input wire [4:0] mem_wb_dest,
	input wire ex_mem_write,
	input wire mem_wb_write,
	output reg [1:0] alu_sel1,
	output reg [1:0] alu_sel2
);

	always begin
		alu_sel1 = 2'b00;
		alu_sel2 = 2'b00;
	
		if (ex_mem_write && (ex_mem_dest != 0) && (ex_mem_dest == rsIn)) 
			alu_sel1 = 2'b01;
		
		if (mem_wb_write && (mem_wb_dest != 0) && !(ex_mem_write && (ex_mem_dest != 0) && (ex_mem_dest == rsIn)) && (mem_wb_dest == rsIn)) 
			alu_sel1 = 2'b10;
		
		if (ex_mem_write && (ex_mem_dest != 0) && (ex_mem_dest == rtIn)) 
			alu_sel2 = 2'b01;
		
		if (mem_wb_write && (mem_wb_dest != 0) && !(ex_mem_write && (ex_mem_dest != 0) && (ex_mem_dest == rtIn)) && (mem_wb_dest == rtIn)) 
			alu_sel2 = 2'b10;
	end

endmodule

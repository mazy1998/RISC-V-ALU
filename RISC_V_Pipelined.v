//Add x1 x2 x3 - 0000000 00010 00011 000 00001 0110011
//Add x4 x1 x5 - 0000000 00001 00101 000 00100 0110011




module RISC_V_Processor_Pipelined
(
	input clk, reset
);

//------------------------------------------------------------------------------------------------------------------
// WIRES

// IF_ID
wire [63:0] IF_ID_PC_Out_wire;
wire [31:0] IF_ID_Instruction_wire;
wire [63:0] Adder_PC_wire;
wire [63:0] Mux1_out_wire;


// Our thing in the middle b/w IF/ID and ID/EX
wire [31:0] ID_EX_instruction_wire;	
wire [6:0] opcode_wire;
wire [4:0] ID_EX_rs1_wire;
wire [4:0] ID_EX_rs2_wire;
wire [4:0] ID_EX_rd_wire;
wire [63:0] ID_EX_ReadData1_wire;
wire [63:0] ID_EX_ReadData2_wire;
wire [63:0] ID_EX_imm_data_wire;
wire [63:0] ID_EX_PC_Out_wire;

wire ID_EX_ALUSrc_wire;				
wire [1:0] ID_EX_ALUOp_wire;			
wire ID_EX_Branch_wire;					
wire ID_EX_MemRead_wire;				
wire ID_EX_MemWrite_wire;					
wire ID_EX_RegWrite_wire;				
wire ID_EX_MemToReg_wire;					


// Our thing in the middle b/w ID/EX and EX/MEM
wire [3:0] EX_MEM_instruction_wire;		
wire [4:0] EX_MEM_Rd_wire;
wire [4:0] EX_MEM_Rs2_wire;
wire [4:0] EX_MEM_Rs1_wire;
wire [63:0] EX_MEM_imm_data_wire;
wire [63:0] EX_MEM_ReadData2_wire;
wire [63:0] EX_MEM_ReadData1_wire;
wire [63:0] EX_MEM_PC_Out_wire;

wire EX_MEM_ALUSrc_wire;				
wire [1:0] EX_MEM_ALUOp_wire; 			
wire EX_MEM_Branch_wire;					
wire EX_MEM_MemRead_wire;					
wire EX_MEM_MemWrite_wire;					
wire EX_MEM_RegWrite_wire;					
wire EX_MEM_MemToReg_wire;					

wire [3:0] EX_MEM_Operation_wire;

wire [1:0] EX_MEM_Forward_A_wire;			
wire [1:0] EX_MEM_Forward_B_wire;			

wire [63:0] EX_MEM_Adder_wire;

wire [63:0] EX_MEM_MUX_Offset_wire;

wire [63:0] EX_MEM_Upper_Forwarding_MUX_out_wire;			
wire [63:0] EX_MEM_Lower_Forwarding_MUX_out_wire;

wire [63:0] EX_MEM_ALU_result_wire;
wire EX_MEM_Zero_wire;

// Our thing in the middle b/w EX/MEM and MEM/WB
wire [4:0] MEM_WB_rd_wire;		

wire [63:0] MEM_WB_Lower_Forwarding_MUX_out_wire;

wire MEM_WB_zero_wire;					

wire [63:0] MEM_WB_ALU_result_wire;
wire [63:0] MEM_WB_Adder_wire;

wire MEM_WB_Branch_wire;					
wire MEM_WB_MemRead_wire;					
wire MEM_WB_MemWrite_wire;				
wire MEM_WB_RegWrite_wire;				
wire MEM_WB_MemToReg_wire;				

wire [63:0] MEM_WB_ReadData_wire;


// Thing after MEM/WB
wire [4:0] end_rd_wire;
wire [63:0] end_ALU_result_wire;
wire [63:0] end_ReadData_wire;

wire end_RegWrite_wire;				
wire end_MemToReg_wire;				

wire [63:0] end_MUX_2_wire;

//-----------------------------------------------------------------------
// These are the register modules.

	IF_ID IF_ID_register
	(
		.clk(clk),
		.reset(reset),
		.IF_ID_instruction(IF_ID_Instruction_wire),
		.IF_ID_PC_Out(IF_ID_PC_Out_wire),
		
		.IF_ID_instruction_out(ID_EX_instruction_wire),
		.IF_ID_out(ID_EX_PC_Out_wire)
	);
	
	ID_EX ID_EX_register
	(
		.clk(clk),
		.reset(reset),
		.ID_EX_instruction({ID_EX_instruction_wire[30], ID_EX_instruction_wire[14:12]}),
		.ID_EX_rd(ID_EX_rd_wire), 
		.ID_EX_rs1(ID_EX_rs1_wire),
		.ID_EX_rs2(ID_EX_rs2_wire),
		.ID_EX_imm_data(ID_EX_imm_data_wire),
		.ID_EX_ReadData2(ID_EX_ReadData2_wire),
		.ID_EX_ReadData1(ID_EX_ReadData1_wire),
		.ID_EX_PC_Out(ID_EX_PC_Out_wire),
		.ID_EX_ALUSrc(ID_EX_ALUSrc_wire),
		.ID_EX_ALUOp(ID_EX_ALUOp_wire),
		.ID_EX_Branch(ID_EX_Branch_wire),
		.ID_EX_MemRead(ID_EX_MemRead_wire),
		.ID_EX_MemWrite(ID_EX_MemWrite_wire),
		.ID_EX_RegWrite(ID_EX_RegWrite_wire),
		.ID_EX_MemToReg(ID_EX_MemToReg_wire),
		
		.ID_EX_output_rd(EX_MEM_Rd_wire),
		.ID_EX_output_rs2(EX_MEM_Rs2_wire),
		.ID_EX_output_rs1(EX_MEM_Rs1_wire), 
		.ID_EX_output_imm_data(EX_MEM_imm_data_wire),
		.ID_EX_output_ReadData2(EX_MEM_ReadData2_wire),
		.ID_EX_output_ReadData1(EX_MEM_ReadData1_wire),
		.ID_EX_a(EX_MEM_PC_Out_wire),
		
		
		.ID_EX_output_ALUSrc(EX_MEM_ALUSrc_wire),
		.ID_EX_output_ALUOp(EX_MEM_ALUOp_wire),
		.ID_EX_output_Branch(EX_MEM_Branch_wire),
		.ID_EX_output_MemRead(EX_MEM_MemRead_wire),
		.ID_EX_output_MemWrite(EX_MEM_MemWrite_wire),
		.ID_EX_output_RegWrite(EX_MEM_RegWrite_wire),
		.ID_EX_output_MemToReg(EX_MEM_MemToReg_wire),
		
		
		.ID_EX_funct(EX_MEM_instruction_wire)
	);
	
	EX_MEM EX_MEM_register
	(
		.clk(clk),
		.reset(reset),
		.EX_MEM_Rd(EX_MEM_Rd_wire),
		.EX_MEM_Lower_Forwarding_MUX_out(EX_MEM_Lower_Forwarding_MUX_out_wire),
		.EX_MEM_ALU_result(EX_MEM_ALU_result_wire),
		.EX_MEM_Zero(EX_MEM_Zero_wire),
		.EX_MEM_Adder(EX_MEM_Adder_wire),
		.EX_MEM_Branch(EX_MEM_Branch_wire),
		.EX_MEM_MemRead(EX_MEM_MemRead_wire),
		.EX_MEM_MemWrite(EX_MEM_MemWrite_wire),
		.EX_MEM_RegWrite(EX_MEM_RegWrite_wire),
		.EX_MEM_MemToReg(EX_MEM_MemToReg_wire),
		
		.EX_MEM_output_rd(MEM_WB_rd_wire),
		.EX_MEM_Lower_Forwarding_MUX_output(MEM_WB_Lower_Forwarding_MUX_out_wire),
		.EX_MEM_ALU_result_output(MEM_WB_ALU_result_wire),
		.EX_MEM_output_zero(MEM_WB_zero_wire),
		.EX_MEM_Adder_output(MEM_WB_Adder_wire),
		.EX_MEM_output_Branch(MEM_WB_Branch_wire),
		.EX_MEM_output_MemRead(MEM_WB_MemRead_wire),
		.EX_MEM_output_MemWrite(MEM_WB_MemWrite_wire),
		.EX_MEM_output_RegWrite(MEM_WB_RegWrite_wire),
		.EX_MEM_output_MemToReg(MEM_WB_MemToReg_wire)
	);
	
	MEM_WB MEM_WB_register
	(
		.clk(clk),
		.reset(reset),
		.MEM_WB_Rd(MEM_WB_rd_wire),
		.MEM_WB_ALU_result(MEM_WB_ALU_result_wire),
		.MEM_WB_ReadData(MEM_WB_ReadData_wire),
		.MEM_WB_RegWrite(MEM_WB_RegWrite_wire),
		.MEM_WB_MemToReg(MEM_WB_MemToReg_wire),
		
		.MEM_WB_output_rd(end_rd_wire),
		.MEM_WB_ALU_result_output(end_ALU_result_wire),
		.MEM_WB_ReadData_output(end_ReadData_wire),
		.MEM_WB_output_RegWrite(end_RegWrite_wire),
		.MEM_WB_output_MemToReg(end_MemToReg_wire)
	);

// These are the modules.
	
	Program_Counter PC
	(
		.clk(clk),
		.reset(reset),
		.PC_In(Mux1_out_wire),
		.PC_Out(IF_ID_PC_Out_wire)
	);
	
	Instruction_Memory im
	(
		.inst_address(IF_ID_PC_Out_wire),
		.instruction(IF_ID_Instruction_wire)
	);
	
	instruction_parser ip
	(
		.instruction(ID_EX_instruction_wire),
		.opcode(opcode_wire),
		.rd(ID_EX_rd_wire),
		.fucnt3(),
		.rs1(ID_EX_rs1_wire),
		.rs2(ID_EX_rs2_wire),
		.funct7()
	);
	
	registerFile rf
	(
		.clk(clk),
		.reset(reset),
		.WriteData(end_MUX_2_wire),
		.RS1(ID_EX_rs1_wire),
		.RS2(ID_EX_rs2_wire),
		.RD(MEM_WB_rd_wire),
		.RegWrite(end_RegWrite_wire),
		.ReadData1(ID_EX_ReadData1_wire),
		.ReadData2(ID_EX_ReadData2_wire)
	);
	
	immediate_data imd
	(
		.instruction(ID_EX_instruction_wire),
		.imm_data(ID_EX_imm_data_wire)
	);
	
	Control_Unit cu
	(
		.Opcode(opcode_wire),
		.Branch(ID_EX_Branch_wire),
		.MemRead(ID_EX_MemRead_wire),
		.MemtoReg(ID_EX_MemToReg_wire),
		.ALUOp(ID_EX_ALUOp_wire),
		.MemWrite(ID_EX_MemWrite_wire),
		.ALUSrc(ID_EX_ALUSrc_wire),
		.RegWrite(ID_EX_RegWrite_wire)
	);
	
	ALU_Control ALU_C
	(
		.ALUOp(ID_EX_ALUOp_wire),
		.Funct(EX_MEM_instruction_wire),
		.Operation(EX_MEM_Operation_wire)
	);
	
	Data_memory dm
	(
		.clk(clk),
		.memWrite(MEM_WB_MemWrite_wire),
		.memRead(MEM_WB_MemRead_wire),
		.mem_address(MEM_WB_ALU_result_wire),
		.write_data(MEM_WB_Lower_Forwarding_MUX_out_wire),
		.read_data(MEM_WB_ReadData_wire)
	);

	mux_4_in Upper_Forwarding_MUX
	(
		.a(EX_MEM_ReadData1_wire),
		.b(end_MUX_2_wire),
		.c(MEM_WB_ALU_result_wire),
		.d(64'd0),
		.sel(EX_MEM_Forward_A_wire),
		.data_out(EX_MEM_Upper_Forwarding_MUX_out_wire)
	);
	
	mux_4_in Lower_Forwarding_MUX
	(
		.a(EX_MEM_ReadData2_wire),
		.b(end_MUX_2_wire),
		.c(MEM_WB_ALU_result_wire),
		.d(64'd0),
		.sel(EX_MEM_Forward_B_wire),
		.data_out(EX_MEM_Lower_Forwarding_MUX_out_wire)
	);

	adder ALU_Branch
	(
		.a(EX_MEM_PC_Out_wire),
		.b(EX_MEM_imm_data_wire << 1),
		.out(EX_MEM_Adder_wire)
	);

	multiplexer mux3
	(
		.data_out(EX_MEM_MUX_Offset_wire),
		.a(EX_MEM_Lower_Forwarding_MUX_out_wire), 
		.b(EX_MEM_imm_data_wire),
		.sel(EX_MEM_ALUSrc_wire)
	);
	
	ALU_64_bit ALU_Main
	(
		.a(EX_MEM_Upper_Forwarding_MUX_out_wire),
		.b(EX_MEM_MUX_Offset_wire),
		.ALUOp(EX_MEM_Operation_wire),
		.Result(EX_MEM_ALU_result_wire),
		.zero(EX_MEM_Zero_wire)
	);

	Forwarding_Unit FU
	(
		.ID_EX_Rs1(EX_MEM_Rs1_wire),
		.ID_EX_Rs2(EX_MEM_Rs2_wire),
		.EX_MEM_Rd(MEM_WB_rd_wire),
		.EX_MEM_RegWrite(MEM_WB_RegWrite_wire),
		
		.MEM_WB_Rd(end_rd_wire),
		.MEM_WB_RegWrite(end_RegWrite_wire),
		
		.Forward_A(EX_MEM_Forward_A_wire),
		.Forward_B(EX_MEM_Forward_B_wire)
	);

	adder ALU_PC_4
	(
		.a(IF_ID_PC_Out_wire),
		.b(64'd4),
		.out(Adder_PC_wire)
	);

	multiplexer MUX_Branch
	(
		.a(Adder_PC_wire),
		.b(MEM_WB_Adder_wire),
		.sel(MEM_WB_Branch_wire & MEM_WB_zero_wire),
		.data_out(Mux1_out_wire)
	);
	
	multiplexer End_MUX
	(
		.a(end_ReadData_wire),
		.b(end_ALU_result_wire),
		.sel(end_MemToReg_wire),
		.data_out(end_MUX_2_wire)
	);
	
endmodule
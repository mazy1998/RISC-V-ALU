onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb/clk
add wave -noupdate -format Logic /tb/reset
add wave -noupdate -format Literal /tb/R5/im/instruction
add wave -noupdate -format Literal /tb/R5/PC/PC_Out
add wave -noupdate -format Literal /tb/R5/PC/PC_In
add wave -noupdate -format Literal /tb/R5/ip/rs1
add wave -noupdate -format Literal /tb/R5/ip/rs2
add wave -noupdate -format Literal /tb/R5/ip/rd
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_output_ReadData1
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_output_ReadData2
add wave -noupdate -format Literal /tb/R5/dm/read_data
add wave -noupdate -format Literal /tb/R5/dm/write_data
add wave -noupdate -format Literal /tb/R5/MEM_WB_register/MEM_WB_output_rd
add wave -noupdate -divider ID-Ex
add wave -noupdate -format Literal -radix unsigned /tb/R5/ID_EX_rs1_wire
add wave -noupdate -format Literal -radix unsigned /tb/R5/ID_EX_rs2_wire
add wave -noupdate -format Literal -radix unsigned /tb/R5/ID_EX_rd_wire
add wave -noupdate -divider Ex-Mem
add wave -noupdate -format Literal -radix unsigned /tb/R5/EX_MEM_register/EX_MEM_Rd
add wave -noupdate -divider Mem-WB
add wave -noupdate -format Literal -radix unsigned /tb/R5/end_rd_wire
add wave -noupdate -divider {Forwarding Unit}
add wave -noupdate -format Literal /tb/R5/FU/Forward_A
add wave -noupdate -format Literal /tb/R5/FU/Forward_B
add wave -noupdate -divider {ALU MAin}
add wave -noupdate -format Literal -radix unsigned /tb/R5/ALU_Main/Result
add wave -noupdate -format Literal -radix unsigned /tb/R5/ALU_Main/a
add wave -noupdate -format Literal -radix unsigned /tb/R5/ALU_Main/b
add wave -noupdate -format Literal /tb/R5/ALU_Main/ALUOp
add wave -noupdate -format Logic /tb/R5/ALU_Main/zero
add wave -noupdate -divider {Everything Else}
add wave -noupdate -format Logic /tb/R5/clk
add wave -noupdate -format Logic /tb/R5/reset
add wave -noupdate -format Literal /tb/R5/IF_ID_PC_Out_wire
add wave -noupdate -format Literal /tb/R5/IF_ID_Instruction_wire
add wave -noupdate -format Literal /tb/R5/Adder_PC_wire
add wave -noupdate -format Literal /tb/R5/Mux1_out_wire
add wave -noupdate -format Literal /tb/R5/ID_EX_instruction_wire
add wave -noupdate -format Literal /tb/R5/opcode_wire
add wave -noupdate -format Literal /tb/R5/ID_EX_ReadData1_wire
add wave -noupdate -format Literal /tb/R5/ID_EX_ReadData2_wire
add wave -noupdate -format Literal /tb/R5/ID_EX_imm_data_wire
add wave -noupdate -format Literal /tb/R5/ID_EX_PC_Out_wire
add wave -noupdate -format Logic /tb/R5/ID_EX_ALUSrc_wire
add wave -noupdate -format Literal /tb/R5/ID_EX_ALUOp_wire
add wave -noupdate -format Logic /tb/R5/ID_EX_Branch_wire
add wave -noupdate -format Logic /tb/R5/ID_EX_MemRead_wire
add wave -noupdate -format Logic /tb/R5/ID_EX_MemWrite_wire
add wave -noupdate -format Logic /tb/R5/ID_EX_RegWrite_wire
add wave -noupdate -format Logic /tb/R5/ID_EX_MemToReg_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_instruction_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_Rd_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_Rs2_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_Rs1_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_imm_data_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_ReadData2_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_ReadData1_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_PC_Out_wire
add wave -noupdate -format Logic /tb/R5/EX_MEM_ALUSrc_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_ALUOp_wire
add wave -noupdate -format Logic /tb/R5/EX_MEM_Branch_wire
add wave -noupdate -format Logic /tb/R5/EX_MEM_MemRead_wire
add wave -noupdate -format Logic /tb/R5/EX_MEM_MemWrite_wire
add wave -noupdate -format Logic /tb/R5/EX_MEM_RegWrite_wire
add wave -noupdate -format Logic /tb/R5/EX_MEM_MemToReg_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_Operation_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_Forward_A_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_Forward_B_wire
add wave -noupdate -format Literal /tb/R5/EX_MEM_Adder_wire
add wave -noupdate -format Literal -radix decimal /tb/R5/EX_MEM_MUX_Offset_wire
add wave -noupdate -format Literal -radix unsigned /tb/R5/EX_MEM_Upper_Forwarding_MUX_out_wire
add wave -noupdate -format Literal -radix unsigned /tb/R5/EX_MEM_Lower_Forwarding_MUX_out_wire
add wave -noupdate -format Literal -radix unsigned /tb/R5/MEM_WB_Lower_Forwarding_MUX_out_wire
add wave -noupdate -format Literal -radix unsigned /tb/R5/EX_MEM_ALU_result_wire
add wave -noupdate -format Logic /tb/R5/EX_MEM_Zero_wire
add wave -noupdate -format Literal /tb/R5/MEM_WB_rd_wire
add wave -noupdate -format Logic /tb/R5/MEM_WB_zero_wire
add wave -noupdate -format Literal -radix unsigned /tb/R5/MEM_WB_ALU_result_wire
add wave -noupdate -format Literal /tb/R5/MEM_WB_Adder_wire
add wave -noupdate -format Logic /tb/R5/MEM_WB_Branch_wire
add wave -noupdate -format Logic /tb/R5/MEM_WB_MemRead_wire
add wave -noupdate -format Logic /tb/R5/MEM_WB_MemWrite_wire
add wave -noupdate -format Logic /tb/R5/MEM_WB_RegWrite_wire
add wave -noupdate -format Logic /tb/R5/MEM_WB_MemToReg_wire
add wave -noupdate -format Literal /tb/R5/MEM_WB_ReadData_wire
add wave -noupdate -format Literal /tb/R5/end_ALU_result_wire
add wave -noupdate -format Literal /tb/R5/end_ReadData_wire
add wave -noupdate -format Logic /tb/R5/end_RegWrite_wire
add wave -noupdate -format Logic /tb/R5/end_MemToReg_wire
add wave -noupdate -format Literal /tb/R5/end_MUX_2_wire
add wave -noupdate -format Logic /tb/R5/IF_ID_register/clk
add wave -noupdate -format Logic /tb/R5/IF_ID_register/reset
add wave -noupdate -format Literal /tb/R5/IF_ID_register/IF_ID_PC_Out
add wave -noupdate -format Literal /tb/R5/IF_ID_register/IF_ID_instruction
add wave -noupdate -format Literal /tb/R5/IF_ID_register/IF_ID_out
add wave -noupdate -format Literal /tb/R5/IF_ID_register/IF_ID_instruction_out
add wave -noupdate -format Logic /tb/R5/ID_EX_register/clk
add wave -noupdate -format Logic /tb/R5/ID_EX_register/reset
add wave -noupdate -format Logic /tb/R5/ID_EX_register/ID_EX_ALUSrc
add wave -noupdate -format Logic /tb/R5/ID_EX_register/ID_EX_Branch
add wave -noupdate -format Logic /tb/R5/ID_EX_register/ID_EX_MemRead
add wave -noupdate -format Logic /tb/R5/ID_EX_register/ID_EX_RegWrite
add wave -noupdate -format Logic /tb/R5/ID_EX_register/ID_EX_MemToReg
add wave -noupdate -format Logic /tb/R5/ID_EX_register/ID_EX_MemWrite
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_ALUOp
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_PC_Out
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_ReadData1
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_ReadData2
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_imm_data
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_rs1
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_rs2
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_rd
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_instruction
add wave -noupdate -format Logic /tb/R5/ID_EX_register/ID_EX_output_MemWrite
add wave -noupdate -format Logic /tb/R5/ID_EX_register/ID_EX_output_ALUSrc
add wave -noupdate -format Logic /tb/R5/ID_EX_register/ID_EX_output_Branch
add wave -noupdate -format Logic /tb/R5/ID_EX_register/ID_EX_output_MemRead
add wave -noupdate -format Logic /tb/R5/ID_EX_register/ID_EX_output_RegWrite
add wave -noupdate -format Logic /tb/R5/ID_EX_register/ID_EX_output_MemToReg
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_output_ALUOp
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_a
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_output_imm_data
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_output_rs1
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_output_rs2
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_output_rd
add wave -noupdate -format Literal /tb/R5/ID_EX_register/ID_EX_funct
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/EX_MEM_Branch
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/EX_MEM_RegWrite
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/EX_MEM_MemToReg
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/EX_MEM_MemRead
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/EX_MEM_MemWrite
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/EX_MEM_Zero
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/clk
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/reset
add wave -noupdate -format Literal /tb/R5/EX_MEM_register/EX_MEM_Lower_Forwarding_MUX_out
add wave -noupdate -format Literal /tb/R5/EX_MEM_register/EX_MEM_ALU_result
add wave -noupdate -format Literal /tb/R5/EX_MEM_register/EX_MEM_Adder
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/EX_MEM_output_Branch
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/EX_MEM_output_RegWrite
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/EX_MEM_output_MemToReg
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/EX_MEM_output_MemRead
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/EX_MEM_output_MemWrite
add wave -noupdate -format Logic /tb/R5/EX_MEM_register/EX_MEM_output_zero
add wave -noupdate -format Literal /tb/R5/EX_MEM_register/EX_MEM_Adder_output
add wave -noupdate -format Literal /tb/R5/EX_MEM_register/EX_MEM_Lower_Forwarding_MUX_output
add wave -noupdate -format Literal /tb/R5/EX_MEM_register/EX_MEM_ALU_result_output
add wave -noupdate -format Literal /tb/R5/EX_MEM_register/EX_MEM_output_rd
add wave -noupdate -format Logic /tb/R5/MEM_WB_register/MEM_WB_RegWrite
add wave -noupdate -format Logic /tb/R5/MEM_WB_register/MEM_WB_MemToReg
add wave -noupdate -format Logic /tb/R5/MEM_WB_register/clk
add wave -noupdate -format Logic /tb/R5/MEM_WB_register/reset
add wave -noupdate -format Literal /tb/R5/MEM_WB_register/MEM_WB_Rd
add wave -noupdate -format Literal /tb/R5/MEM_WB_register/MEM_WB_ReadData
add wave -noupdate -format Literal /tb/R5/MEM_WB_register/MEM_WB_ALU_result
add wave -noupdate -format Logic /tb/R5/MEM_WB_register/MEM_WB_output_RegWrite
add wave -noupdate -format Logic /tb/R5/MEM_WB_register/MEM_WB_output_MemToReg
add wave -noupdate -format Literal /tb/R5/MEM_WB_register/MEM_WB_ALU_result_output
add wave -noupdate -format Literal /tb/R5/MEM_WB_register/MEM_WB_ReadData_output
add wave -noupdate -format Logic /tb/R5/PC/clk
add wave -noupdate -format Logic /tb/R5/PC/reset
add wave -noupdate -format Literal /tb/R5/im/inst_address
add wave -noupdate -format Literal /tb/R5/ip/instruction
add wave -noupdate -format Literal /tb/R5/ip/opcode
add wave -noupdate -format Literal /tb/R5/ip/funct7
add wave -noupdate -format Literal /tb/R5/ip/fucnt3
add wave -noupdate -format Literal /tb/R5/rf/WriteData
add wave -noupdate -format Literal /tb/R5/rf/RS1
add wave -noupdate -format Literal /tb/R5/rf/RS2
add wave -noupdate -format Literal /tb/R5/rf/RD
add wave -noupdate -format Logic /tb/R5/rf/RegWrite
add wave -noupdate -format Logic /tb/R5/rf/clk
add wave -noupdate -format Logic /tb/R5/rf/reset
add wave -noupdate -format Literal /tb/R5/rf/ReadData1
add wave -noupdate -format Literal /tb/R5/rf/ReadData2
add wave -noupdate -format Literal /tb/R5/imd/instruction
add wave -noupdate -format Literal /tb/R5/imd/imm_data
add wave -noupdate -format Literal /tb/R5/imd/opcode
add wave -noupdate -format Literal /tb/R5/cu/Opcode
add wave -noupdate -format Literal /tb/R5/cu/ALUOp
add wave -noupdate -format Logic /tb/R5/cu/Branch
add wave -noupdate -format Logic /tb/R5/cu/MemRead
add wave -noupdate -format Logic /tb/R5/cu/MemtoReg
add wave -noupdate -format Logic /tb/R5/cu/MemWrite
add wave -noupdate -format Logic /tb/R5/cu/ALUSrc
add wave -noupdate -format Logic /tb/R5/cu/RegWrite
add wave -noupdate -format Literal /tb/R5/ALU_C/ALUOp
add wave -noupdate -format Literal /tb/R5/ALU_C/Funct
add wave -noupdate -format Literal /tb/R5/ALU_C/Operation
add wave -noupdate -format Logic /tb/R5/dm/clk
add wave -noupdate -format Logic /tb/R5/dm/memWrite
add wave -noupdate -format Logic /tb/R5/dm/memRead
add wave -noupdate -format Literal /tb/R5/dm/mem_address
add wave -noupdate -format Literal /tb/R5/Upper_Forwarding_MUX/a
add wave -noupdate -format Literal /tb/R5/Upper_Forwarding_MUX/b
add wave -noupdate -format Literal /tb/R5/Upper_Forwarding_MUX/c
add wave -noupdate -format Literal /tb/R5/Upper_Forwarding_MUX/d
add wave -noupdate -format Literal /tb/R5/Upper_Forwarding_MUX/sel
add wave -noupdate -format Literal /tb/R5/Upper_Forwarding_MUX/data_out
add wave -noupdate -format Literal /tb/R5/Lower_Forwarding_MUX/a
add wave -noupdate -format Literal /tb/R5/Lower_Forwarding_MUX/b
add wave -noupdate -format Literal /tb/R5/Lower_Forwarding_MUX/c
add wave -noupdate -format Literal /tb/R5/Lower_Forwarding_MUX/d
add wave -noupdate -format Literal /tb/R5/Lower_Forwarding_MUX/sel
add wave -noupdate -format Literal /tb/R5/Lower_Forwarding_MUX/data_out
add wave -noupdate -format Literal /tb/R5/ALU_Branch/a
add wave -noupdate -format Literal /tb/R5/ALU_Branch/b
add wave -noupdate -format Literal /tb/R5/ALU_Branch/out
add wave -noupdate -format Literal -radix unsigned /tb/R5/mux3/data_out
add wave -noupdate -format Literal -radix unsigned /tb/R5/mux3/a
add wave -noupdate -format Literal -radix decimal /tb/R5/mux3/b
add wave -noupdate -format Logic /tb/R5/mux3/sel
add wave -noupdate -format Literal /tb/R5/FU/ID_EX_Rs1
add wave -noupdate -format Literal /tb/R5/FU/ID_EX_Rs2
add wave -noupdate -format Literal /tb/R5/FU/EX_MEM_Rd
add wave -noupdate -format Logic /tb/R5/FU/EX_MEM_RegWrite
add wave -noupdate -format Literal /tb/R5/FU/MEM_WB_Rd
add wave -noupdate -format Logic /tb/R5/FU/MEM_WB_RegWrite
add wave -noupdate -format Literal /tb/R5/ALU_PC_4/a
add wave -noupdate -format Literal /tb/R5/ALU_PC_4/b
add wave -noupdate -format Literal /tb/R5/ALU_PC_4/out
add wave -noupdate -format Literal /tb/R5/MUX_Branch/data_out
add wave -noupdate -format Literal /tb/R5/MUX_Branch/a
add wave -noupdate -format Literal /tb/R5/MUX_Branch/b
add wave -noupdate -format Logic /tb/R5/MUX_Branch/sel
add wave -noupdate -format Literal /tb/R5/End_MUX/data_out
add wave -noupdate -format Literal -radix unsigned /tb/R5/End_MUX/a
add wave -noupdate -format Literal -radix unsigned /tb/R5/End_MUX/b
add wave -noupdate -format Logic /tb/R5/End_MUX/sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {265 ns} 0}
configure wave -namecolwidth 241
configure wave -valuecolwidth 67
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {255 ns} {302 ns}

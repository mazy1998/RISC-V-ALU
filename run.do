vlog adder.v ALU_64_bit.v Control_Unit.v ALU_Control.v Data_memory.v EX_MEM.v Forwarding_Unit.v ID_EX.v IF_ID.v immediate_data.v Instruction_Memory.v instruction_parser.v MEM_WB.v multiplexer.v mux_4_in.v Program_Counter.v registerFile.v RISC_V_Pipelined.v tb.v

#no optimization
vsim -novopt work.tb

#view waves
view wave


#Adding waves
#add wave -r /*

do wave.do

run 300ns

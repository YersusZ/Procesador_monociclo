module Procesador_monociclo(Clk);
	input logic Clk;
	logic [31:0]Out_PC = 32'b0;
	logic [31:0]Out_Instruction;
	logic RUWr;
	logic [2:0]ImmSrc;
	logic AluASrc;
	logic AluBSrc;
	logic [4:0]BrOp;
	logic [3:0]ALUOp;
	logic DMWr;
	logic [2:0]DMCtrl;
	logic [1:0]RUDataWrSrc;					//BUSES DE DATOS
	logic [31:0]rs1;
	logic [31:0]rs2;
	logic NextPCSrc;
	logic [31:0]ImmExt;
	logic [31:0]MuxA;
	logic [31:0]MuxB;
	logic [31:0]Alu_out;
	logic [31:0]DataRd;
	logic [31:0]MuxRUDataWrSrc;
	logic [31:0]Suma = 32'b0;
	logic [31:0]MuxSalto = 32'b0;
	
	always @* begin
		AluASrc = 0;
		AluBSrc = 0;
		NextPCSrc = 0;
		RUDataWrSrc = 2'b00;
		
		if(AluASrc)
			MuxA = Out_PC;
		else        								//MULTIPLEXOR DE LA ENTRADA DEL ALU (A)
			MuxA = rs1;
		
		if(AluBSrc)
			MuxB = ImmExt;
		else										//MULTIPLEXOR DE LA ENTRADA DEL ALU (B)
			MuxB = rs2;
		
		Suma = Out_PC + 4;								//SUMADOR
		
		case(RUDataWrSrc)
			2'b10 : MuxRUDataWrSrc = Suma;
			2'b01 : MuxRUDataWrSrc = DataRd;			//MULTIPLEXOR RUDATAWRSRC
			2'b00 : MuxRUDataWrSrc = Alu_out;	
		endcase
		
		if(NextPCSrc)
			MuxSalto = Alu_out;
		else									//MULTIPLEXOR DE SALTO	
			MuxSalto = Suma;
	end
	
	Data_memory dm(
	.Address(Alu_out),
	.DataWr(rs2),
	.DMWr(DMWr),											//INSTANCIA DEL DATA MEMORY
	.DMCtrl(DMCtrl),
	.DataRd(DataRd)
	);
	
	ALU alu(
	.A(MuxA),
	.B(MuxB),												//INSTANCIA DEL ALU
	.ALUOp(ALUOp),
	.Alu_out(Alu_out)
	);
		Imm_unit iu(
	.ImmIn(Out_Instruction[31:7]),
	.ImmSrc(ImmSrc),										//INSTANCIA DEL IMMEDIATE GENERATOR
	.ImmExt(ImmExt)
	);
	

	Register_unit ru(
	.Clk(Clk),
	.RuDataWr(MuxRUDataWrSrc),
	.Rs1(Out_Instruction[19:15]),
	.Rs2(Out_Instruction[24:20]),						//INSTANCIA DEL REGISTER UNIT
	.Rd(Out_Instruction[11:7]),
	.RuWr(RUWr),
	.RuRs1(rs1),
	.RuRs2(rs2)
	 );
	
	Control_unit cu(
	.OpCode(Out_Instruction[6:0]),
	.Funct3(Out_Instruction[14:12]),
	.Funct7(Out_Instruction[31:25]),
	.RUWr(RUWr),
	.ImmSrc(ImmSrc),
	.AluASrc(AluASrc),
	.AluBSrc(AluBSrc),									//INSTANCIA DEL CONTROL UNIT
	.BrOp(BrOp),
	.ALUOp(ALUOp),
	.DMWr(DMWr),
	.DMCtrl(DMCtrl),
	.RUDataWrSrc(RUDataWrSrc)
	);
	
	
	Instruction_memory im(
	.Address(Out_PC),										//INSTANCIA DEL INSTRUCTION MEMORY
	.Instruction(Out_Instruction)
	);                                   
	
	ProgramCounter pc(
	.in(MuxSalto),
	.clk(Clk),												//INSTANCIA DEL PROGRAM COUNTER
	.out(Out_PC)
	);
	
	Branch_unit bu(
	.In1(rs1),
	.In2(rs2),												//INSTANCIA DEL BRANCH UNIT
	.BrOp(BrOp),
	.NextPCSrc(NextPCSrc)
	);

endmodule
		
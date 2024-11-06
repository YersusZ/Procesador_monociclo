module SystemVerilog1(
    input logic [6:0] OpCode,
    input logic [2:0] Funct3,
    input logic [6:0] Funct7,
    output logic RUWr,
    output logic [2:0] ImmSrc,
    output logic AluASrc,
    output logic AluBSrc,
    output logic [4:0] BrOp,
    output logic [3:0] ALUOp,
    output logic DMWr,
    output logic [2:0] DMCtrl,
    output logic [1:0] RUDataWrSrc
);

    // Inicializamos todas las señales para evitar inferencia de latches
    always_comb begin
        // Valores predeterminados
        RUWr = 0;
        ImmSrc = 3'b000;
        AluASrc = 0;
        AluBSrc = 0;
        BrOp = 5'b00000;
        ALUOp = 4'b0000;
        DMWr = 0;
        DMCtrl = 3'b000;
        RUDataWrSrc = 2'b00;

        case (OpCode)
            7'b0110011: begin  // Tipo R
                RUWr = 1;
                // ImmSrc, AluASrc, AluBSrc ya están en valores predeterminados
            end
            7'b0010011: begin  // Tipo I
                RUWr = 1;
                AluBSrc = 1;
            end
            7'b0000011: begin  // Lectura de memoria tipo I
                RUWr = 1;
                AluBSrc = 1;
                RUDataWrSrc = 2'b01;
            end
            7'b1100111: begin  // Instrucción de salto tipo I (jalr)
                RUWr = 1;
                AluBSrc = 1;
                BrOp = 5'b10000;
                RUDataWrSrc = 2'b10;
            end
            7'b1100011: begin  // Tipo B
                ImmSrc = 3'b101;
                AluASrc = 1;
                AluBSrc = 1;
            end
            7'b0100011: begin  // Tipo S
                ImmSrc = 3'b001;
                AluBSrc = 1;
                DMWr = 1;
            end
            7'b1101111: begin  // Tipo J (jal)
                RUWr = 1;
                ImmSrc = 3'b110;
                AluASrc = 1;
                AluBSrc = 1;
                BrOp = 5'b10000;
                RUDataWrSrc = 2'b10;
            end
            7'b0110111: begin  // Tipo U (lui)
                RUWr = 1;
                ImmSrc = 3'b010;
                AluBSrc = 1;
                ALUOp = 4'b1111;
            end
            7'b0010111: begin  // Tipo U (auipc)
                RUWr = 1;
                ImmSrc = 3'b010;
                AluASrc = 1;
                AluBSrc = 1;
                BrOp = 5'b10000;
                RUDataWrSrc = 2'b10;
            end
        endcase
    end

    always_comb begin
        case ({Funct3, Funct7})
            10'b0000000000: begin
                ALUOp = 4'b0000;  // A + B, add - addi
                BrOp = 5'b01000;  // beq branch equal
            end
            10'b0000100000: ALUOp = 4'b1000;  // A - B, sub
            10'b0010000000: begin
                ALUOp = 4'b0001;  // A << B, sll - slli
                BrOp = 5'b01001;  // bne branch not equal
            end
            10'b0100000000: ALUOp = 4'b0010;  // A < B, slt - slti
            10'b0110000000: ALUOp = 4'b0011;  // A < B unsigned, sltu - sltiu
            10'b1000000000: begin
                ALUOp = 4'b0100;  // A xor B, xor - xori
                BrOp = 5'b01100;  // blt branch less than
            end
            10'b1010000000: begin
                ALUOp = 4'b0101;  // A >> B, srl - srli
                BrOp = 5'b01101;  // bge branch greater equal
            end
            10'b1010100000: ALUOp = 4'b1101;  // A >>> B, sra - srai
            10'b1100000000: ALUOp = 4'b0110;  // A or B, or - ori
            10'b1110000000: ALUOp = 4'b0111;  // A and B, and - andi
            default: begin
                // Ya están establecidos los valores predeterminados
            end
        endcase
    end
endmodule
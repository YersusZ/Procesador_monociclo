module Instruction_memory(Address, Instruction);
	input logic [31:0]Address;
	output logic [31:0]Instruction;
	logic [31:0]Memory[255:0];

    initial begin
        $readmemh("C:/Users/Sebastian/Desktop/Otros/UTP/Arquitectura_de_Computadores/Procesador_monociclo(Quartus2)/Instruction_memory/Instruction_memory.txt", Memory);
    end
	 always_comb begin
		 if (Address % 4 == 0) begin
					Instruction = Memory[Address >> 2];
			  end else begin
					Instruction = 32'hxxxxxxxx; // Valor de instrucción no válido
			  end
	end
endmodule
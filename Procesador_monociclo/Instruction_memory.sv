module Instruction_memory(Address, Instruction);
	input logic [31:0]Address;
	output logic [31:0]Instruction;
	logic [31:0]Memory[255:0];

    initial begin
        $readmemh("C:/Users/Sebastian/Desktop/Otros/UTP/Arquitectura_de_Computadores/Procesador_monociclo(Quartus2)/Procesador_monociclo/Instruction_memory.txt", Memory);
    end
	 always_comb begin
		Instruction[31:0] <= {Memory[Address], Memory[Address+1] , Memory[Address+2], Memory[Address+3]};
	 end
endmodule 
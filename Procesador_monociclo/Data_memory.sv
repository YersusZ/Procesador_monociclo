module Data_memory(Address, DataWr, DMWr, DMCtrl, DataRd);
    input logic [31:0] Address;
    input logic [31:0] DataWr;
    input logic DMWr;
    input logic [2:0] DMCtrl;
    output logic [31:0] DataRd;

    logic [31:0] Memory [0:31];

    always_comb begin
		DataRd = 32'b0;
        case(DMCtrl)
            3'b000: DataRd[31:0] = {{24{Memory[Address >> 2][7]}}, Memory[Address >> 2][7:0]};   // lb: load byte
            3'b001: DataRd[31:0] = {{16{Memory[Address >> 2][15]}}, Memory[Address >> 2][15:0]}; // lh: load halfword
            3'b010: DataRd[31:0] = Memory[Address >> 2][31:0];               							  // lw: load word
            3'b100: DataRd[31:0] = {24'b0, Memory[Address >> 2][7:0]};       							  // lb (U): load byte unsigned
            3'b101: DataRd[31:0] = {16'b0, Memory[Address >> 2][15:0]};      							  // lh (U): load halfword unsigned
            default: DataRd = 32'b0;    
        endcase
    end

    always @(posedge DMWr) begin
        if (DMWr) begin
            case(DMCtrl)
                3'b000: Memory[Address >> 2][7:0] <= DataWr[7:0];         // sb: save byte
                3'b001: Memory[Address >> 2][15:0] <= DataWr[15:0];       // sh: save halfword
                3'b010: Memory[Address >> 2][31:0] <= DataWr[31:0];       // sw: save word
                default: ;
            endcase
        end
    end
endmodule

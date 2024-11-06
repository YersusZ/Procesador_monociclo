library verilog;
use verilog.vl_types.all;
entity Control_unit is
    port(
        OpCode          : in     vl_logic_vector(6 downto 0);
        Funct3          : in     vl_logic_vector(2 downto 0);
        Funct7          : in     vl_logic_vector(6 downto 0);
        RUWr            : out    vl_logic;
        ImmSrc          : out    vl_logic_vector(2 downto 0);
        AluASrc         : out    vl_logic;
        AluBSrc         : out    vl_logic;
        BrOp            : out    vl_logic_vector(4 downto 0);
        ALUOp           : out    vl_logic_vector(3 downto 0);
        DMWr            : out    vl_logic;
        DMCtrl          : out    vl_logic_vector(2 downto 0);
        RUDataWrSrc     : out    vl_logic_vector(1 downto 0)
    );
end Control_unit;

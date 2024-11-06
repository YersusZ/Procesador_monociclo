library verilog;
use verilog.vl_types.all;
entity Control_unit_vlg_check_tst is
    port(
        ALUOp           : in     vl_logic_vector(3 downto 0);
        AluASrc         : in     vl_logic;
        AluBSrc         : in     vl_logic;
        BrOp            : in     vl_logic_vector(4 downto 0);
        DMCtrl          : in     vl_logic_vector(2 downto 0);
        DMWr            : in     vl_logic;
        ImmSrc          : in     vl_logic_vector(2 downto 0);
        RUDataWrSrc     : in     vl_logic_vector(1 downto 0);
        RUWr            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Control_unit_vlg_check_tst;

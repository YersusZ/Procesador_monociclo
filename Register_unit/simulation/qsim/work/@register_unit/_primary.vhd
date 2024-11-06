library verilog;
use verilog.vl_types.all;
entity Register_unit is
    port(
        Rs1             : in     vl_logic_vector(4 downto 0);
        Rs2             : in     vl_logic_vector(4 downto 0);
        Clk             : in     vl_logic;
        Rd              : in     vl_logic_vector(4 downto 0);
        RuWr            : in     vl_logic;
        RuDataWr        : in     vl_logic_vector(31 downto 0);
        RuRs1           : out    vl_logic_vector(31 downto 0);
        RuRs2           : out    vl_logic_vector(31 downto 0)
    );
end Register_unit;

library verilog;
use verilog.vl_types.all;
entity Register_unit_vlg_sample_tst is
    port(
        Clk             : in     vl_logic;
        Rd              : in     vl_logic_vector(4 downto 0);
        Rs1             : in     vl_logic_vector(4 downto 0);
        Rs2             : in     vl_logic_vector(4 downto 0);
        RuDataWr        : in     vl_logic_vector(31 downto 0);
        RuWr            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Register_unit_vlg_sample_tst;

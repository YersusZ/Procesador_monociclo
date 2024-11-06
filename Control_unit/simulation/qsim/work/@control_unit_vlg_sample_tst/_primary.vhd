library verilog;
use verilog.vl_types.all;
entity Control_unit_vlg_sample_tst is
    port(
        Funct3          : in     vl_logic_vector(2 downto 0);
        Funct7          : in     vl_logic_vector(6 downto 0);
        OpCode          : in     vl_logic_vector(6 downto 0);
        sampler_tx      : out    vl_logic
    );
end Control_unit_vlg_sample_tst;

library verilog;
use verilog.vl_types.all;
entity Branch_unit_vlg_sample_tst is
    port(
        BrOp            : in     vl_logic_vector(4 downto 0);
        In1             : in     vl_logic_vector(31 downto 0);
        In2             : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end Branch_unit_vlg_sample_tst;

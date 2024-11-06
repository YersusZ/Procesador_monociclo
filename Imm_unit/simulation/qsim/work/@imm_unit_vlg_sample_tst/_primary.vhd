library verilog;
use verilog.vl_types.all;
entity Imm_unit_vlg_sample_tst is
    port(
        ImmIn           : in     vl_logic_vector(24 downto 0);
        ImmSrc          : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end Imm_unit_vlg_sample_tst;

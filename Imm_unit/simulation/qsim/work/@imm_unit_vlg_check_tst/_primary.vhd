library verilog;
use verilog.vl_types.all;
entity Imm_unit_vlg_check_tst is
    port(
        ImmExt          : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Imm_unit_vlg_check_tst;

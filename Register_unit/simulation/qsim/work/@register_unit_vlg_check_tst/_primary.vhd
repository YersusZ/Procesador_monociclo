library verilog;
use verilog.vl_types.all;
entity Register_unit_vlg_check_tst is
    port(
        RuRs1           : in     vl_logic_vector(31 downto 0);
        RuRs2           : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Register_unit_vlg_check_tst;

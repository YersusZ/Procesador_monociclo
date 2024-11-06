library verilog;
use verilog.vl_types.all;
entity Registro_32bits_vlg_check_tst is
    port(
        Q               : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Registro_32bits_vlg_check_tst;

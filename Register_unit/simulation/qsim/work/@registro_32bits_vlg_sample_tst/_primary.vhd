library verilog;
use verilog.vl_types.all;
entity Registro_32bits_vlg_sample_tst is
    port(
        Clk             : in     vl_logic;
        D               : in     vl_logic_vector(31 downto 0);
        En              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Registro_32bits_vlg_sample_tst;

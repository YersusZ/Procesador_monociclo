library verilog;
use verilog.vl_types.all;
entity ProgramCounter_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        \in\            : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end ProgramCounter_vlg_sample_tst;

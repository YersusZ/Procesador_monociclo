library verilog;
use verilog.vl_types.all;
entity Instruction_memory_vlg_sample_tst is
    port(
        Address         : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end Instruction_memory_vlg_sample_tst;

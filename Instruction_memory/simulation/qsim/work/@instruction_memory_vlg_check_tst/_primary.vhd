library verilog;
use verilog.vl_types.all;
entity Instruction_memory_vlg_check_tst is
    port(
        Instruction     : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Instruction_memory_vlg_check_tst;

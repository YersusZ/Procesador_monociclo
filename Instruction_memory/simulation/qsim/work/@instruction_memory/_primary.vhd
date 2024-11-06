library verilog;
use verilog.vl_types.all;
entity Instruction_memory is
    port(
        Address         : in     vl_logic_vector(31 downto 0);
        Instruction     : out    vl_logic_vector(31 downto 0)
    );
end Instruction_memory;

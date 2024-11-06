library verilog;
use verilog.vl_types.all;
entity ProgramCounter is
    port(
        \in\            : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic
    );
end ProgramCounter;

library verilog;
use verilog.vl_types.all;
entity FlipflopD is
    port(
        D               : in     vl_logic;
        Q               : out    vl_logic;
        Clk             : in     vl_logic;
        En              : in     vl_logic
    );
end FlipflopD;

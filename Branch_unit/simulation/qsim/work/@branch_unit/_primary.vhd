library verilog;
use verilog.vl_types.all;
entity Branch_unit is
    port(
        In1             : in     vl_logic_vector(31 downto 0);
        In2             : in     vl_logic_vector(31 downto 0);
        BrOp            : in     vl_logic_vector(4 downto 0);
        NextPCSrc       : out    vl_logic
    );
end Branch_unit;

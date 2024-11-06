library verilog;
use verilog.vl_types.all;
entity Registro_32bits is
    port(
        D               : in     vl_logic_vector(31 downto 0);
        Q               : out    vl_logic_vector(31 downto 0);
        Clk             : in     vl_logic;
        En              : in     vl_logic
    );
end Registro_32bits;

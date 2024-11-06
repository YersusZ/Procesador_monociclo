library verilog;
use verilog.vl_types.all;
entity Data_memory is
    port(
        Address         : in     vl_logic_vector(31 downto 0);
        DataWr          : in     vl_logic_vector(31 downto 0);
        DMWr            : in     vl_logic;
        DMCtrl          : in     vl_logic_vector(2 downto 0);
        DataRd          : out    vl_logic_vector(31 downto 0)
    );
end Data_memory;

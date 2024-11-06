library verilog;
use verilog.vl_types.all;
entity Data_memory_vlg_sample_tst is
    port(
        Address         : in     vl_logic_vector(31 downto 0);
        DMCtrl          : in     vl_logic_vector(2 downto 0);
        DMWr            : in     vl_logic;
        DataWr          : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end Data_memory_vlg_sample_tst;

library verilog;
use verilog.vl_types.all;
entity program_table is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        load_next       : in     vl_logic;
        \type\          : in     vl_logic_vector(2 downto 0);
        addr            : in     vl_logic_vector(15 downto 0);
        search          : in     vl_logic;
        done            : out    vl_logic;
        result_type     : out    vl_logic_vector(2 downto 0);
        result_addr     : out    vl_logic_vector(15 downto 0)
    );
end program_table;

library verilog;
use verilog.vl_types.all;
entity mem_manager is
    port(
        reset           : in     vl_logic;
        load_reset      : in     vl_logic;
        load_enable     : in     vl_logic;
        load_clk        : in     vl_logic;
        load_data       : in     vl_logic_vector(15 downto 0);
        search_reset    : in     vl_logic;
        search_enable   : in     vl_logic;
        search_clk      : in     vl_logic;
        find            : in     vl_logic_vector(15 downto 0);
        result          : out    vl_logic_vector(15 downto 0);
        done            : out    vl_logic
    );
end mem_manager;

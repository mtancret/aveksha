library verilog;
use verilog.vl_types.all;
entity function_search is
    port(
        find            : in     vl_logic_vector(15 downto 0);
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        result          : out    vl_logic_vector(15 downto 0);
        done            : out    vl_logic;
        read_data       : in     vl_logic_vector(15 downto 0);
        read_addr       : out    vl_logic_vector(9 downto 0);
        read_en         : out    vl_logic;
        read_clk        : out    vl_logic
    );
end function_search;

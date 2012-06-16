library verilog;
use verilog.vl_types.all;
entity function_search is
    port(
        pc_poll_data    : in     vl_logic_vector(15 downto 0);
        search_result   : out    vl_logic_vector(15 downto 0);
        osc48m_out      : in     vl_logic;
        pc_poll_done    : in     vl_logic;
        search_enable   : in     vl_logic;
        search_done     : out    vl_logic
    );
end function_search;

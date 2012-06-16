library verilog;
use verilog.vl_types.all;
entity mem_manager is
    port(
        search_result   : out    vl_logic_vector(15 downto 0);
        pc_poll_data    : in     vl_logic_vector(15 downto 0);
        pld_ctr_c       : in     vl_logic_vector(4 downto 4);
        search_done     : out    vl_logic;
        search_enable   : in     vl_logic;
        pc_poll_done    : in     vl_logic;
        osc48m_out      : in     vl_logic;
        load_enable     : in     vl_logic;
        mode_reset      : in     vl_logic
    );
end mem_manager;

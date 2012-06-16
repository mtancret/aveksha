library verilog;
use verilog.vl_types.all;
entity jtag_controller is
    port(
        func_data       : out    vl_logic_vector(15 downto 0);
        pld_ctr_c       : in     vl_logic_vector(4 downto 4);
        mode            : in     vl_logic_vector(1 downto 0);
        rts_c           : out    vl_logic;
        osc48m_out      : in     vl_logic;
        shift_tck       : out    vl_logic;
        shift_tms       : out    vl_logic;
        shift_tdi       : out    vl_logic;
        mote_tdo_c      : in     vl_logic;
        mode_reset      : in     vl_logic;
        search_enable_2 : out    vl_logic;
        load_enable_2   : out    vl_logic;
        mode_reset_0    : in     vl_logic;
        osc96m          : in     vl_logic
    );
end jtag_controller;

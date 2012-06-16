library verilog;
use verilog.vl_types.all;
entity io_controller is
    port(
        mode            : out    vl_logic_vector(1 downto 0);
        func_data       : in     vl_logic_vector(10 downto 10);
        pld_data_in_1   : in     vl_logic;
        pld_data_in_3   : in     vl_logic;
        pld_data_in_0   : in     vl_logic;
        pld_ctr_c       : in     vl_logic_vector(2 downto 0);
        load_enable_2   : in     vl_logic;
        search_enable_2 : in     vl_logic;
        mode_reset      : out    vl_logic;
        shift_tms       : in     vl_logic;
        mode1_RNI6FQ93  : out    vl_logic;
        mode0_RNIOK8L   : out    vl_logic;
        mode0_RNIUPCG1  : out    vl_logic;
        shift_tck       : in     vl_logic;
        mode1_RNICFK53  : out    vl_logic;
        shift_tdi       : in     vl_logic;
        N_19            : out    vl_logic;
        mode1_RNI16O93  : out    vl_logic;
        mote_tdo_c      : in     vl_logic;
        osc96m          : in     vl_logic;
        mode_reset_0    : out    vl_logic
    );
end io_controller;

library verilog;
use verilog.vl_types.all;
entity jtag_shift is
    port(
        shift_data_out  : out    vl_logic_vector(15 downto 0);
        next_state_0_0  : in     vl_logic;
        shift_data_in_5 : in     vl_logic;
        shift_data_in_0 : in     vl_logic;
        shift_tck       : out    vl_logic;
        pc_poll_enable  : in     vl_logic;
        shift_tms       : out    vl_logic;
        shift_tdi       : out    vl_logic;
        mote_tdo_c      : in     vl_logic;
        N_13            : out    vl_logic;
        N_145           : out    vl_logic;
        shift_mode      : in     vl_logic;
        shift_reset     : in     vl_logic;
        osc96m          : in     vl_logic;
        pc_poll_enable_0: in     vl_logic
    );
end jtag_shift;

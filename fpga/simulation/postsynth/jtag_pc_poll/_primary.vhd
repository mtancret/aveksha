library verilog;
use verilog.vl_types.all;
entity jtag_pc_poll is
    port(
        pc_poll_data    : out    vl_logic_vector(15 downto 0);
        pc_poll_enable_0: in     vl_logic;
        mote_tdo_c      : in     vl_logic;
        shift_tdi       : out    vl_logic;
        shift_tms       : out    vl_logic;
        shift_tck       : out    vl_logic;
        pc_poll_enable  : in     vl_logic;
        mode_reset      : in     vl_logic;
        osc96m          : in     vl_logic;
        pc_poll_done    : out    vl_logic;
        mode_reset_0    : in     vl_logic
    );
end jtag_pc_poll;

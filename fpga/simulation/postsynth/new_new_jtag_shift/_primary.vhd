library verilog;
use verilog.vl_types.all;
entity new_new_jtag_shift is
    port(
        jtag_data_out   : out    vl_logic_vector(15 downto 0);
        jtag_data_in    : in     vl_logic_vector(2 downto 2);
        jtag_reset_1    : in     vl_logic;
        shift_tck       : out    vl_logic;
        jtag_reset      : in     vl_logic;
        shift_tms       : out    vl_logic;
        main_clk        : in     vl_logic;
        shift_tdi       : out    vl_logic;
        jtag_done       : out    vl_logic;
        jtag_enable     : in     vl_logic;
        mote_tdo_c      : in     vl_logic;
        jtag_reset_0    : in     vl_logic;
        jtag_mode       : in     vl_logic;
        jtag_enable_0   : in     vl_logic
    );
end new_new_jtag_shift;

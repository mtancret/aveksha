library verilog;
use verilog.vl_types.all;
entity main is
    port(
        pld_data        : inout  vl_logic_vector(15 downto 0);
        mote_tdi        : out    vl_logic;
        mote_tdo        : in     vl_logic;
        mote_tms        : out    vl_logic;
        mote_tck        : out    vl_logic;
        pld_ctr         : inout  vl_logic_vector(4 downto 0);
        usb_connect     : in     vl_logic;
        osc32k          : out    vl_logic;
        osc6m           : out    vl_logic;
        mcu_osc         : out    vl_logic;
        osc48m          : in     vl_logic
    );
end main;

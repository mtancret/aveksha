library verilog;
use verilog.vl_types.all;
entity clocks is
    port(
        clocks_VCC      : in     vl_logic;
        clocks_GND      : in     vl_logic;
        osc96m_i        : out    vl_logic;
        mcu_osc_c       : out    vl_logic;
        osc6m           : out    vl_logic;
        osc48m_c        : in     vl_logic
    );
end clocks;

library verilog;
use verilog.vl_types.all;
entity clock_manager is
    port(
        osc48m_c        : in     vl_logic;
        osc6m           : out    vl_logic;
        mcu_osc_c       : out    vl_logic;
        osc96m_i        : out    vl_logic;
        clock_manager_GND: in     vl_logic;
        clock_manager_VCC: in     vl_logic;
        osc96m          : in     vl_logic;
        osc48m_out      : out    vl_logic
    );
end clock_manager;

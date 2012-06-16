library verilog;
use verilog.vl_types.all;
entity clock_manager is
    port(
        osc48m          : in     vl_logic;
        osc32k          : out    vl_logic;
        osc6m           : out    vl_logic;
        osc8m           : out    vl_logic;
        osc12m          : out    vl_logic;
        osc24m          : out    vl_logic;
        osc48m_out      : out    vl_logic;
        osc96m          : out    vl_logic;
        reset           : out    vl_logic
    );
end clock_manager;

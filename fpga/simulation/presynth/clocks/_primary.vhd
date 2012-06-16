library verilog;
use verilog.vl_types.all;
entity clocks is
    port(
        POWERDOWN       : in     vl_logic;
        CLKA            : in     vl_logic;
        LOCK            : out    vl_logic;
        GLA             : out    vl_logic;
        GLB             : out    vl_logic;
        GLC             : out    vl_logic
    );
end clocks;

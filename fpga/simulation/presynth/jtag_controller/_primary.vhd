library verilog;
use verilog.vl_types.all;
entity jtag_controller is
    port(
        reset           : in     vl_logic;
        mode            : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        load_clk        : in     vl_logic;
        search_clk      : in     vl_logic;
        jtag_clk        : in     vl_logic;
        buffer_clk      : in     vl_logic;
        tdo             : in     vl_logic;
        data_in         : in     vl_logic_vector(15 downto 0);
        cts             : in     vl_logic;
        tdi             : out    vl_logic;
        tms             : out    vl_logic;
        tck             : out    vl_logic;
        data_out        : out    vl_logic_vector(15 downto 0);
        rts             : out    vl_logic
    );
end jtag_controller;

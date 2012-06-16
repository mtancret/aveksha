library verilog;
use verilog.vl_types.all;
entity io_controller is
    port(
        reset           : in     vl_logic;
        mode_select     : in     vl_logic;
        mode_input      : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        mote_tdo        : in     vl_logic;
        shift_tdi       : in     vl_logic;
        shift_tms       : in     vl_logic;
        shift_tck       : in     vl_logic;
        func_data       : in     vl_logic_vector(15 downto 0);
        pc_data         : in     vl_logic_vector(15 downto 0);
        mote_tdi        : out    vl_logic;
        mote_tms        : out    vl_logic;
        mote_tck        : out    vl_logic;
        mode            : out    vl_logic_vector(1 downto 0);
        mode_reset      : out    vl_logic;
        pld_data        : inout  vl_logic_vector(15 downto 0)
    );
end io_controller;

library verilog;
use verilog.vl_types.all;
entity jtag_shift is
    port(
        data_in         : in     vl_logic_vector(15 downto 0);
        mode            : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        tdo             : in     vl_logic;
        data_out        : out    vl_logic_vector(15 downto 0);
        done            : out    vl_logic;
        tck             : out    vl_logic;
        tms             : out    vl_logic;
        tdi             : out    vl_logic
    );
end jtag_shift;

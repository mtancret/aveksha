library verilog;
use verilog.vl_types.all;
entity jtag_pc_poll is
    port(
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        tdo             : in     vl_logic;
        data            : out    vl_logic_vector(15 downto 0);
        poll_done       : out    vl_logic;
        tdi             : out    vl_logic;
        tms             : out    vl_logic;
        tck             : out    vl_logic
    );
end jtag_pc_poll;

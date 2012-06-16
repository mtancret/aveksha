library verilog;
use verilog.vl_types.all;
entity program_table_mem is
    port(
        WD              : in     vl_logic_vector(15 downto 0);
        RD              : out    vl_logic_vector(15 downto 0);
        WEN             : in     vl_logic;
        REN             : in     vl_logic;
        WADDR           : in     vl_logic_vector(9 downto 0);
        RADDR           : in     vl_logic_vector(9 downto 0);
        WCLK            : in     vl_logic;
        RCLK            : in     vl_logic
    );
end program_table_mem;

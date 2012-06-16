library verilog;
use verilog.vl_types.all;
entity program_table_loader is
    port(
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        clock           : in     vl_logic;
        write_en        : out    vl_logic;
        write_addr      : out    vl_logic_vector(9 downto 0);
        write_clk       : out    vl_logic
    );
end program_table_loader;

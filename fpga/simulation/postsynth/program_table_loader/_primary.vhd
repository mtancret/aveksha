library verilog;
use verilog.vl_types.all;
entity program_table_loader is
    port(
        pld_ctr_c       : in     vl_logic_vector(4 downto 4);
        waddr           : out    vl_logic_vector(9 downto 0);
        write_clk       : out    vl_logic;
        mode_set        : in     vl_logic;
        load_enable     : in     vl_logic
    );
end program_table_loader;

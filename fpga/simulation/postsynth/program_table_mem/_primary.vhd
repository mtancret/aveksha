library verilog;
use verilog.vl_types.all;
entity program_table_mem is
    port(
        pld_data_in     : in     vl_logic_vector(0 downto 0);
        raddr           : in     vl_logic_vector(9 downto 0);
        waddr           : in     vl_logic_vector(9 downto 0);
        rd              : out    vl_logic_vector(15 downto 0);
        ren             : in     vl_logic;
        program_table_mem_VCC: in     vl_logic;
        read_clk        : in     vl_logic;
        write_clk       : in     vl_logic;
        program_table_mem_GND: in     vl_logic
    );
end program_table_mem;

library verilog;
use verilog.vl_types.all;
entity output_buffer is
    port(
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        input_data      : in     vl_logic_vector(15 downto 0);
        load_next       : in     vl_logic;
        cts             : in     vl_logic;
        output_data     : out    vl_logic_vector(15 downto 0);
        rts             : out    vl_logic
    );
end output_buffer;

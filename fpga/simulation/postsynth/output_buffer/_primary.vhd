library verilog;
use verilog.vl_types.all;
entity output_buffer is
    port(
        search_result   : in     vl_logic_vector(15 downto 0);
        func_data       : out    vl_logic_vector(15 downto 0);
        osc48m_out      : in     vl_logic;
        new_result      : in     vl_logic;
        search_done     : in     vl_logic;
        rts_c           : out    vl_logic;
        search_enable   : in     vl_logic;
        mode_reset      : in     vl_logic;
        mode_reset_0    : in     vl_logic
    );
end output_buffer;

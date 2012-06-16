library verilog;
use verilog.vl_types.all;
entity output_buffer_mem is
    port(
        DATA            : in     vl_logic_vector(15 downto 0);
        Q               : out    vl_logic_vector(15 downto 0);
        WE              : in     vl_logic;
        RE              : in     vl_logic;
        WCLOCK          : in     vl_logic;
        RCLOCK          : in     vl_logic;
        FULL            : out    vl_logic;
        EMPTY           : out    vl_logic;
        RESET           : in     vl_logic
    );
end output_buffer_mem;

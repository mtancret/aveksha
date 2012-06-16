library verilog;
use verilog.vl_types.all;
entity mode_selector is
    port(
        mode_input      : in     vl_logic_vector(1 downto 0);
        \select\        : in     vl_logic;
        mode            : out    vl_logic_vector(1 downto 0)
    );
end mode_selector;

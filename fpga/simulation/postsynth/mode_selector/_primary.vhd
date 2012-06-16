library verilog;
use verilog.vl_types.all;
entity mode_selector is
    port(
        pld_ctr_c       : in     vl_logic_vector(2 downto 0);
        mode            : out    vl_logic_vector(1 downto 0)
    );
end mode_selector;

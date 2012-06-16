# Synopsys, Inc. constraint file
# C:\Documents and Settings\Administrator\My Documents\actel\TDB_FPGA\synthesis\main_syn.sdc
# Written on Sun Nov 14 19:37:14 2010
# by Synplify Pro, D-2009.12A Scope Editor

#
# Collections
#

#
# Clocks
#
define_clock   {u0.u0.Core} -name {u0.u0.Core}  -freq 96 -clockgroup default_clkgroup_0
define_clock   {n:mcu_osc} -name {n:mcu_osc}  -freq 8 -clockgroup default_clkgroup_1
define_clock   {n:osc96m} -name {n:osc96m}  -freq 96 -clockgroup default_clkgroup_2
define_clock   {n:u3.u1.u2.read_clk} -name {n:u3.u1.u2.read_clk}  -freq 48 -clockgroup default_clkgroup_3
define_clock   {n:u3.u1.u1.write_clk} -name {n:u3.u1.u1.write_clk}  -freq 48 -clockgroup default_clkgroup_4
define_clock   {n:u3.u2.wclk} -name {n:u3.u2.wclk}  -freq 1 -clockgroup default_clkgroup_5
define_clock   {p:pld_ctr[2]} -name {p:pld_ctr[2]}  -freq 1 -clockgroup default_clkgroup_6
define_clock   {p:pld_ctr[4]} -name {p:pld_ctr[4]}  -freq 1 -clockgroup default_clkgroup_7
define_clock   {n:u3.u2.rclk} -name {n:u3.u2.rclk}  -freq 1 -clockgroup default_clkgroup_8
define_clock   {n:osc48m_out} -name {n:osc48m_out}  -freq 48 -clockgroup default_clkgroup_9
define_clock   {n:u0.osc48m_out} -name {n:u0.osc48m_out}  -freq 48 -clockgroup default_clkgroup_10

#
# Clock to Clock
#

#
# Inputs/Outputs
#
define_input_delay -disable      -default -improve 0.00 -route 0.00
define_output_delay -disable     -default -improve 0.00 -route 0.00
define_input_delay -disable      {mote_tdo} -improve 0.00 -route 0.00
define_input_delay -disable      {usb_connect} -improve 0.00 -route 0.00
define_input_delay -disable      {osc48m} -improve 0.00 -route 0.00
define_output_delay -disable     {mote_tdi} -improve 0.00 -route 0.00
define_output_delay -disable     {mote_tms} -improve 0.00 -route 0.00
define_output_delay -disable     {mote_tck} -improve 0.00 -route 0.00
define_output_delay -disable     {osc32k} -improve 0.00 -route 0.00
define_output_delay -disable     {usb_osc} -improve 0.00 -route 0.00
define_output_delay -disable     {mcu_osc} -improve 0.00 -route 0.00
define_input_delay -disable      {pld_data[15:0]} -improve 0.00 -route 0.00
define_output_delay -disable     {pld_data[15:0]} -improve 0.00 -route 0.00
define_input_delay -disable      {pld_ctr[4:0]} -improve 0.00 -route 0.00

#
# Registers
#

#
# Delay Paths
#

#
# Attributes
#

#
# I/O Standards
#
define_io_standard -disable      -default_input -delay_type input
define_io_standard -disable      -default_output -delay_type output
define_io_standard -disable      -default_bidir -delay_type bidir
define_io_standard -disable      {mote_tdo} -delay_type input
define_io_standard -disable      {usb_connect} -delay_type input
define_io_standard -disable      {osc48m} -delay_type input
define_io_standard -disable      {mote_tdi} -delay_type output
define_io_standard -disable      {mote_tms} -delay_type output
define_io_standard -disable      {mote_tck} -delay_type output
define_io_standard -disable      {osc32k} -delay_type output
define_io_standard -disable      {usb_osc} -delay_type output
define_io_standard -disable      {mcu_osc} -delay_type output
define_io_standard -disable      {pld_data[15:0]} -delay_type bidir
define_io_standard -disable      {pld_ctr[4:0]} -delay_type input

#
# Compile Points
#

#
# Other
#

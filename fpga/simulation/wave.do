onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /main/usb_connect
add wave -noupdate -format Logic /main/osc48m
add wave -noupdate -format Logic /main/mcu_osc
add wave -noupdate -format Logic /main/osc6m
add wave -noupdate -format Logic /main/osc6m_buff
add wave -noupdate -format Logic /main/osc32k
add wave -noupdate -format Logic /main/osc96m
add wave -noupdate -format Literal -radix hexadecimal /main/pld_data
add wave -noupdate -format Literal /main/pld_ctr
add wave -noupdate -format Logic /main/mote_tdo
add wave -noupdate -format Logic /main/mote_tdi
add wave -noupdate -format Logic /main/mote_tms
add wave -noupdate -format Logic /main/mote_tck
add wave -noupdate -format Logic /main/reset
add wave -noupdate -format Logic /main/ready
add wave -noupdate -format Logic /main/done
add wave -noupdate -format Logic /main/poll
add wave -noupdate -format Logic /main/load_next
add wave -noupdate -format Literal -radix hexadecimal /main/jtag_data
add wave -noupdate -format Logic /main/jtag_tck
add wave -noupdate -format Logic /main/jtag_tms
add wave -noupdate -format Logic /main/jtag_tdi
add wave -noupdate -format Literal -radix hexadecimal /main/program_table_data
add wave -noupdate -format Logic /main/jtag_clock
add wave -noupdate -format Logic /main/pc_ready
add wave -noupdate -format Literal -radix hexadecimal /main/program_addr
add wave -noupdate -format Logic /main/u2/clock
add wave -noupdate -format Logic /main/u2/reset
add wave -noupdate -format Logic /main/u2/load_next
add wave -noupdate -format Literal /main/u2/type
add wave -noupdate -format Literal -radix hexadecimal /main/u2/addr
add wave -noupdate -format Logic /main/u2/search
add wave -noupdate -format Logic /main/u2/done
add wave -noupdate -format Literal /main/u2/result_type
add wave -noupdate -format Literal -radix hexadecimal /main/u2/result_addr
add wave -noupdate -format Literal -radix hexadecimal /main/u2/next_state
add wave -noupdate -format Literal -radix hexadecimal /main/u2/wd
add wave -noupdate -format Literal -radix hexadecimal /main/u2/rd
add wave -noupdate -format Logic /main/u2/wen
add wave -noupdate -format Logic /main/u2/ren
add wave -noupdate -format Literal -radix hexadecimal /main/u2/waddr
add wave -noupdate -format Literal -radix hexadecimal /main/u2/raddr
add wave -noupdate -format Logic /main/u2/rwclk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{start jtag} {999634 ps} 1} {{start lookup} {2943431 ps} 1} {{start program} {381745 ps} 1} {{Cursor 5} {408708 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {256 ns}

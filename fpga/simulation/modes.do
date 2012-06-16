restart
force -freeze sim:/main/osc48m 1 0, 0 {10 ns} -r {20 ns}
#force -drive sim:/main/u0/osc48m_out 1 0, 0 {10 ns} -r {20 ns}
force -freeze sim:/main/usb_connect 1 0 ns

# set mode 0 - direct
force -freeze {sim:/main/pld_ctr[0]} 0 0
force -freeze {sim:/main/pld_ctr[1]} 0 0
force -freeze {sim:/main/pld_ctr[2]} 0 0, 1 400 ns, 0 430 ns

# test mode 0
force -drive {sim:/main/pld_data[8]} 0 0, 1 440 ns, 0 460 ns
force -drive {sim:/main/pld_data[9]} 0 0, 1 460 ns, 0 480 ns
force -drive {sim:/main/pld_data[11]} 0 0, 1 480 ns
force -freeze {sim:/main/mote_tdo} 0 0, 1 500 ns, 0 520 ns

# set mode 1 - program
force -freeze {sim:/main/pld_ctr[0]} 1 590 ns
force -freeze {sim:/main/pld_ctr[1]} 0 590 ns
force -freeze {sim:/main/pld_ctr[2]} 1 600 ns, 0 640 ns

# test mode 1
# reset
force -drive {sim:/main/pld_ctr[3]} 0 600 ns, 1 660 ns, 0 680 ns
# done
force -drive sim:/main/pld_data 16#00FF 700 ns, 16#F0F0 800 ns, 16#FF00 900 ns, 16#0 1000 ns 
#load_next
force -freeze {sim:/main/pld_ctr[4]} 0 600 ns, 1 710 ns, 0 730 ns, 1 750 ns, 0 770 ns, 1 810 ns, 0 830 ns, 1 850 ns, 0 870 ns, 1 910 ns, 0 930 ns, 1 950 ns, 0 970 ns

#set mode 2 - pc_poll
force -freeze {sim:/main/pld_ctr[0]} 0 1000 ns
force -freeze {sim:/main/pld_ctr[1]} 1 1000 ns, 0 1040 ns
force -freeze {sim:/main/pld_ctr[2]} 1 1010 ns, 0 1040 ns

# test mode 2
#force -freeze sim:/main/mote_tdo 0 0, 1 2945 ns, 0 3048 ns
#force -freeze sim:/main/pc_poll_ack 0 0, 1 2395 ns, 0 2415 ns
force -freeze {sim:/main/pld_ctr[4]} 1 2600 ns, 0 2640 ns, 1 2700 ns, 0 2740 ns
restart
force -freeze sim:/main/osc48m 1 0, 0 {10 ns} -r {20 ns}
force -freeze sim:/main/usb_connect 1 2000 ns
# reset
force -freeze {sim:/main/pld_ctr[0]} 0 0, 1 400 ns, 0 420 ns
# done
force -freeze {sim:/main/pld_ctr[2]} 0 0, 1 400 ns, 0 720 ns
force -freeze sim:/main/pld_data 16#00FF 430 ns, 16#F0F0 550 ns, 16#FF00 670 ns, 16#0 720 ns 
#load_next
force -freeze {sim:/main/pld_ctr[4]} 0 0, 1 440 ns, 0 500 ns, 1 560 ns, 0 620 ns, 1 680 ns, 0 720 ns


# poll
force -freeze {sim:/main/pld_ctr[3]} 0 0, 1 1000 ns
# shift in 0x01FE
#force -freeze sim:/main/mote_tdo 0 0, 1 2330 ns, 0 2830 ns
# shift in 0xFFFF
force -freeze sim:/main/mote_tdo 0 0, 1 1850 ns, 0 2830 ns

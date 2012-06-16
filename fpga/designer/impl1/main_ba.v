`timescale 1 ns/100 ps
// Version: 9.0 9.0.0.15
// File used only for Simulation


module PLLBA(
       CLKA,
       EXTFB,
       POWERDOWN,
       GLA,
       LOCK,
       GLB,
       YB,
       GLC,
       YC,
       OADIV0,
       OADIV1,
       OADIV2,
       OADIV3,
       OADIV4,
       OAMUX0,
       OAMUX1,
       OAMUX2,
       DLYGLA0,
       DLYGLA1,
       DLYGLA2,
       DLYGLA3,
       DLYGLA4,
       OBDIV0,
       OBDIV1,
       OBDIV2,
       OBDIV3,
       OBDIV4,
       OBMUX0,
       OBMUX1,
       OBMUX2,
       DLYYB0,
       DLYYB1,
       DLYYB2,
       DLYYB3,
       DLYYB4,
       DLYGLB0,
       DLYGLB1,
       DLYGLB2,
       DLYGLB3,
       DLYGLB4,
       OCDIV0,
       OCDIV1,
       OCDIV2,
       OCDIV3,
       OCDIV4,
       OCMUX0,
       OCMUX1,
       OCMUX2,
       DLYYC0,
       DLYYC1,
       DLYYC2,
       DLYYC3,
       DLYYC4,
       DLYGLC0,
       DLYGLC1,
       DLYGLC2,
       DLYGLC3,
       DLYGLC4,
       FINDIV0,
       FINDIV1,
       FINDIV2,
       FINDIV3,
       FINDIV4,
       FINDIV5,
       FINDIV6,
       FBDIV0,
       FBDIV1,
       FBDIV2,
       FBDIV3,
       FBDIV4,
       FBDIV5,
       FBDIV6,
       FBDLY0,
       FBDLY1,
       FBDLY2,
       FBDLY3,
       FBDLY4,
       FBSEL0,
       FBSEL1,
       XDLYSEL,
       VCOSEL0,
       VCOSEL1,
       VCOSEL2
    );
input  CLKA;
input  EXTFB;
input  POWERDOWN;
output GLA;
output LOCK;
output GLB;
output YB;
output GLC;
output YC;
input  OADIV0;
input  OADIV1;
input  OADIV2;
input  OADIV3;
input  OADIV4;
input  OAMUX0;
input  OAMUX1;
input  OAMUX2;
input  DLYGLA0;
input  DLYGLA1;
input  DLYGLA2;
input  DLYGLA3;
input  DLYGLA4;
input  OBDIV0;
input  OBDIV1;
input  OBDIV2;
input  OBDIV3;
input  OBDIV4;
input  OBMUX0;
input  OBMUX1;
input  OBMUX2;
input  DLYYB0;
input  DLYYB1;
input  DLYYB2;
input  DLYYB3;
input  DLYYB4;
input  DLYGLB0;
input  DLYGLB1;
input  DLYGLB2;
input  DLYGLB3;
input  DLYGLB4;
input  OCDIV0;
input  OCDIV1;
input  OCDIV2;
input  OCDIV3;
input  OCDIV4;
input  OCMUX0;
input  OCMUX1;
input  OCMUX2;
input  DLYYC0;
input  DLYYC1;
input  DLYYC2;
input  DLYYC3;
input  DLYYC4;
input  DLYGLC0;
input  DLYGLC1;
input  DLYGLC2;
input  DLYGLC3;
input  DLYGLC4;
input  FINDIV0;
input  FINDIV1;
input  FINDIV2;
input  FINDIV3;
input  FINDIV4;
input  FINDIV5;
input  FINDIV6;
input  FBDIV0;
input  FBDIV1;
input  FBDIV2;
input  FBDIV3;
input  FBDIV4;
input  FBDIV5;
input  FBDIV6;
input  FBDLY0;
input  FBDLY1;
input  FBDLY2;
input  FBDLY3;
input  FBDLY4;
input  FBSEL0;
input  FBSEL1;
input  XDLYSEL;
input  VCOSEL0;
input  VCOSEL1;
input  VCOSEL2;

    wire GND, SDOUT, FB, EXTFBDLY, GLADLY, LOCKDLY, GLBDLY, YBDLY, 
        GLCDLY, YCDLY, VCODLY;
    wire GND_power_net1;
    assign GND = GND_power_net1;
    
    PLL_SDF #( .VCOFREQUENCY(48.000000) )  pll_sdf_0 (.CLKA(CLKA), 
        .EXTFB(EXTFBDLY), .POWERDOWN(POWERDOWN), .GLAOUT(GLADLY), 
        .LOCKOUT(LOCKDLY), .GLBOUT(GLBDLY), .YBOUT(YBDLY), .GLCOUT(
        GLCDLY), .YCOUT(YCDLY), .OADIV0(OADIV0), .OADIV1(OADIV1), 
        .OADIV2(OADIV2), .OADIV3(OADIV3), .OADIV4(OADIV4), .OAMUX0(
        OAMUX0), .OAMUX1(OAMUX1), .OAMUX2(OAMUX2), .DLYGLA0(DLYGLA0), 
        .DLYGLA1(DLYGLA1), .DLYGLA2(DLYGLA2), .DLYGLA3(DLYGLA3), 
        .DLYGLA4(DLYGLA4), .OBDIV0(OBDIV0), .OBDIV1(OBDIV1), .OBDIV2(
        OBDIV2), .OBDIV3(OBDIV3), .OBDIV4(OBDIV4), .OBMUX0(OBMUX0), 
        .OBMUX1(OBMUX1), .OBMUX2(OBMUX2), .DLYYB0(DLYYB0), .DLYYB1(
        DLYYB1), .DLYYB2(DLYYB2), .DLYYB3(DLYYB3), .DLYYB4(DLYYB4), 
        .DLYGLB0(DLYGLB0), .DLYGLB1(DLYGLB1), .DLYGLB2(DLYGLB2), 
        .DLYGLB3(DLYGLB3), .DLYGLB4(DLYGLB4), .OCDIV0(OCDIV0), .OCDIV1(
        OCDIV1), .OCDIV2(OCDIV2), .OCDIV3(OCDIV3), .OCDIV4(OCDIV4), 
        .OCMUX0(OCMUX0), .OCMUX1(OCMUX1), .OCMUX2(OCMUX2), .DLYYC0(
        DLYYC0), .DLYYC1(DLYYC1), .DLYYC2(DLYYC2), .DLYYC3(DLYYC3), 
        .DLYYC4(DLYYC4), .DLYGLC0(DLYGLC0), .DLYGLC1(DLYGLC1), 
        .DLYGLC2(DLYGLC2), .DLYGLC3(DLYGLC3), .DLYGLC4(DLYGLC4), 
        .FINDIV0(FINDIV0), .FINDIV1(FINDIV1), .FINDIV2(FINDIV2), 
        .FINDIV3(FINDIV3), .FINDIV4(FINDIV4), .FINDIV5(FINDIV5), 
        .FINDIV6(FINDIV6), .FBDIV0(FBDIV0), .FBDIV1(FBDIV1), .FBDIV2(
        FBDIV2), .FBDIV3(FBDIV3), .FBDIV4(FBDIV4), .FBDIV5(FBDIV5), 
        .FBDIV6(FBDIV6), .FBDLY0(FBDLY0), .FBDLY1(FBDLY1), .FBDLY2(
        FBDLY2), .FBDLY3(FBDLY3), .FBDLY4(FBDLY4), .FBSEL0(FBSEL0), 
        .FBSEL1(FBSEL1), .XDLYSEL(XDLYSEL), .VCOSEL0(VCOSEL0), 
        .VCOSEL1(VCOSEL1), .VCOSEL2(VCOSEL2), .INTFB(FB), .VCOOUT(
        VCODLY));
    PLL_DLY_SDF #( .VCOFREQUENCY(48.000000) )  pll_dly_sdf_0 (.GLA(GLA)
        , .LOCK(LOCK), .GLB(GLB), .YB(YB), .GLC(GLC), .YC(YC), .GLAIN(
        GLADLY), .LOCKIN(LOCKDLY), .GLBIN(GLBDLY), .YBIN(YBDLY), 
        .GLCIN(GLCDLY), .YCIN(YCDLY), .EXTFBOUT(EXTFBDLY), .EXTFBIN(
        EXTFB), .VCOIN(VCODLY), .PLLOUT(FB));
    GND GND_power_inst1 (.Y(GND_power_net1));
    
endmodule


module main(
       pld_data,
       mote_tdi,
       mote_tdo,
       mote_tms,
       mote_tck,
       pld_ctr,
       usb_connect,
       osc32k,
       osc6m,
       mcu_osc,
       osc48m
    );
inout  [15:0] pld_data;
output mote_tdi;
input  mote_tdo;
output mote_tms;
output mote_tck;
inout  [4:0] pld_ctr;
input  usb_connect;
output osc32k;
output osc6m;
output mcu_osc;
input  osc48m;

    wire osc6m_buff, osc96m, \jtag_data[10] , \jtag_data[12] , 
        \jtag_data[13] , \jtag_data[14] , \jtag_data[15] , pc_ready, 
        jtag_tdi, jtag_tms, jtag_tck, \program_addr[0] , 
        \program_addr[1] , \program_addr[2] , \program_addr[3] , 
        \program_addr[4] , \program_addr[5] , \program_addr[6] , 
        \program_addr[7] , \program_addr[8] , \program_addr[9] , 
        \program_addr[10] , \program_addr[11] , \program_addr[12] , 
        \program_addr[13] , \program_addr[14] , \program_addr[15] , 
        \program_table_data[0] , \program_table_data[1] , 
        \program_table_data[2] , \program_table_data[3] , 
        \program_table_data[4] , \program_table_data[5] , 
        \program_table_data[6] , \program_table_data[7] , 
        \program_table_data[8] , \program_table_data[9] , 
        \program_table_data[10] , \program_table_data[11] , 
        \program_table_data[12] , \program_table_data[13] , 
        \program_table_data[14] , \program_table_data[15] , 
        \pld_data_pad_RNO[10]_net_1 , \pld_data_pad_RNO_0[10]_net_1 , 
        mote_tck_iv, mote_tms_iv, \pld_data_in[0] , \pld_data_in[1] , 
        \pld_data_in[2] , \pld_data_in[3] , \pld_data_in[4] , 
        \pld_data_in[5] , \pld_data_in[6] , \pld_data_in[7] , 
        \pld_data_in[8] , \pld_data_in[9] , \pld_data_in[10] , 
        \pld_data_in[11] , \pld_data_in[12] , \pld_data_in[13] , 
        \pld_data_in[14] , \pld_data_in[15] , mote_tdo_c, 
        \pld_ctr_c[0] , ready_c, \pld_ctr_c[2] , \pld_ctr_c[3] , 
        \pld_ctr_c[4] , usb_connect_c, osc6m_c, mcu_osc_c, osc48m_c, 
        un1_pld_data, jtag_tms_i_m, jtag_tdi_i_m, jtag_tck_i_m, 
        un3_pld_data_i, mote_tdi_iv_i_0, \pld_ctr_c_0[3] , 
        \u1/jtag_reset_0_net_1 , \u1/next_state[0]_net_1 , 
        \u1/next_state_i[0] , \u1/data_1_sqmuxa , \u1/N_70 , 
        \u1/jtag_data[0] , \u1/jtag_data[1] , \u1/jtag_data[2] , 
        \u1/jtag_data[3] , \u1/jtag_data[4] , \u1/jtag_data[5] , 
        \u1/jtag_data[6] , \u1/jtag_data[7] , \u1/jtag_data[8] , 
        \u1/jtag_data[9] , \u1/jtag_data[11] , \u1/next_state_ns[0] , 
        \u1/jtag_done , \u1/next_state[1]_net_1 , \u1/N_83_i , 
        \u1/jtag_enable_net_1 , \u1/jtag_reset_net_1 , 
        \u1/jtag_mode_net_1 , \u1/jtag_data_out[0] , 
        \u1/jtag_data_out[1] , \u1/jtag_data_out[2] , 
        \u1/jtag_data_out[3] , \u1/jtag_data_out[4] , 
        \u1/jtag_data_out[5] , \u1/jtag_data_out[6] , 
        \u1/jtag_data_out[7] , \u1/jtag_data_out[8] , 
        \u1/jtag_data_out[9] , \u1/jtag_data_out[10] , 
        \u1/jtag_data_out[11] , \u1/jtag_data_out[12] , 
        \u1/jtag_data_out[13] , \u1/jtag_data_out[14] , 
        \u1/jtag_data_out[15] , \u1/u0/next_state_0[5] , 
        \u1/u0/next_state_ns[5] , \u1/u0/tck_89_i_0 , 
        \u1/u0/next_state_d[42] , \u1/u0/data_out_35_0_0[11] , 
        \u1/u0/N_413 , \u1/u0/N_288_i , \u1/u0/N_421 , 
        \u1/u0/data_out_35_0_1_0[10] , \u1/u0/data_out_35_0_a2_0[12] , 
        \u1/u0/N_296 , \u1/u0/data_out_35_0_0[4] , \u1/u0/N_360 , 
        \u1/u0/N_305 , \u1/u0/N_398 , \u1/u0/data_out_35_0_0[2] , 
        \u1/u0/N_362 , \u1/u0/data_out_35_0_0[0] , \u1/u0/N_381_i , 
        \u1/u0/N_382 , \u1/u0/N_417 , \u1/u0/data_out_35_0_1_0[5] , 
        \u1/u0/next_state_d[40] , \u1/u0/tdi_18k_0_a2_i_0 , 
        \u1/u0/N_376 , \u1/u0/un1_tck55_1_0_2 , \u1/u0/N_369 , 
        \u1/u0/N_366 , \u1/u0/N_368 , \u1/u0/un1_tck55_1_0_1 , 
        \u1/u0/un1_tck55_1_0_a4_0_0 , \u1/u0/N_314_i , \u1/u0/N_367 , 
        \u1/u0/un1_next_state_5_i_3 , \u1/u0/N_371 , 
        \u1/u0/un1_next_state_5_i_0 , \u1/u0/N_370 , 
        \u1/u0/un1_next_state_5_i_2 , 
        \u1/u0/un1_next_state_5_i_a4_2_0 , \u1/u0/N_372 , 
        \u1/u0/next_state[3] , \u1/u0/N_439 , 
        \u1/u0/next_state_ns_0_4[0] , 
        \u1/u0/next_state_ns_0_a3_3_1[0] , \u1/u0/N_475 , 
        \u1/u0/N_453 , \u1/u0/next_state_ns_0_2[0] , 
        \u1/u0/next_state_ns_0_a3_0_0[0] , 
        \u1/u0/next_state_ns_0_a3_2_0[0] , 
        \u1/u0/next_state_ns_0_1[0] , \u1/u0/N_451 , \u1/u0/N_456 , 
        \u1/u0/N_457_i , \u1/u0/un1_tck55_1_0_o2_1_0 , 
        \u1/u0/next_state_ns_i_0[3] , \u1/u0/N_443 , 
        \u1/u0/un1_tck55_1_0_a4_3_0 , \u1/u0/next_state_ns_i_0[1] , 
        \u1/u0/next_state_ns_i_a3_0[1] , \u1/u0/N_437_i_i_0 , 
        \u1/u0/N_438 , \u1/u0/N_387 , 
        \u1/u0/next_state_ns_i_a3_1_1[3] , 
        \u1/u0/un1_tck55_1_0_a4_1_0 , \u1/u0/next_state[4] , 
        \u1/u0/tdo_m_5_0 , \u1/u0/N_373_1 , \u1/u0/N_392 , 
        \u1/u0/data_out_24_m_0[3] , \u1/u0/data_out_24[3] , 
        \u1/u0/data_out_21_m_1[4] , \u1/u0/data_out_21[4] , 
        \u1/u0/N_476 , \u1/u0/tdo_m_3_0 , \u1/u0/data_out_27_m_1[2] , 
        \u1/u0/data_out_27[2] , \u1/u0/N_388 , \u1/u0/tdo_m_1_0 , 
        \u1/u0/N_386 , \u1/u0/N_442 , \u1/u0/next_state[0] , 
        \u1/u0/next_state_ns_0_a3_0[4] , \u1/u0/next_state[2] , 
        \u1/u0/next_state_ns_0_a3_1[5] , 
        \u1/u0/next_state_ns_0_a3_5_2[0] , \u1/u0/next_state[1] , 
        \u1/u0/next_state_ns_i_a3_1_0[1] , \u1/u0/N_69_1 , 
        \u1/u0/N_299 , \u1/u0/next_state_d[22] , \u1/u0/N_295 , 
        \u1/u0/tdo_m_3_i , \u1/u0/N_385 , \u1/u0/next_state_ns[0] , 
        \u1/u0/next_state_ns[2] , \u1/u0/N_463 , \u1/u0/N_462 , 
        \u1/u0/N_461 , \u1/u0/N_294 , \u1/u0/N_445_i , \u1/u0/N_73_1 , 
        \u1/u0/N_290 , \u1/u0/N_298 , \u1/u0/N_363 , \u1/u0/N_430 , 
        \u1/u0/N_460 , \u1/u0/N_459 , \u1/u0/N_433 , \u1/u0/N_76_1 , 
        \u1/u0/N_292 , \u1/u0/N_397 , \u1/u0/N_380 , \u1/u0/N_379 , 
        \u1/u0/N_408 , \u1/u0/N_322_i , \u1/u0/N_72 , \u1/u0/N_359 , 
        \u1/u0/N_285 , \u1/u0/N_74 , \u1/u0/N_66 , \u1/u0/N_361 , 
        \u1/u0/tck_RNO_net_1 , \u1/u0/tck_RNO_0_net_1 , 
        \u1/u0/tdo_m_5 , \u1/u0/tdo_m_1 , \u1/u0/data_out_24_m[3] , 
        \u1/u0/un1_tck55_1 , \u1/u0/N_364 , \u1/u0/tdo_m_6_0 , 
        \u1/u0/data_out_18_i[5] , \u1/u0/data_out_18_m[5] , 
        \u1/u0/next_state_d[30] , \u1/u0/data_out_35[5] , 
        \u1/u0/data_out_RNO_0[5]_net_1 , \u1/u0/tdo_m_0 , 
        \u1/u0/data_out_35[9] , \u1/u0/N_418 , \u1/u0/N_420 , 
        \u1/u0/next_state_ns[4] , \u1/u0/next_state[5] , 
        \u1/u0/data_out_30[1] , \u1/u0/data_out_30_m[1] , 
        \u1/u0/next_state_d[38] , \u1/u0/data_out_35[1] , \u1/u0/N_64 , 
        \u1/u0/data_out_m[2] , \u1/u0/data_out_35[2] , 
        \u1/u0/data_out_35[3] , \u1/u0/data_out_m[4] , 
        \u1/u0/data_out_35[4] , \u1/u0/data_out_35[10] , \u1/u0/N_73 , 
        \u1/u0/tdo_m_2 , \u1/u0/next_state_d[18] , 
        \u1/u0/data_out_35[11] , \u1/u0/data_out_35[14] , \u1/u0/N_77 , 
        \u1/u0/N_390 , \u1/u0/N_419 , \u1/u0/N_471 , \u1/u0/N_383 , 
        \u1/u0/N_441 , \u1/u0/N_477_i , \u1/u0/next_state_d_i[26] , 
        \u1/u0/data_out_35[15] , \u1/u0/data_out_m[15] , 
        \u1/u0/data_out_35[13] , \u1/u0/data_out_m[13] , 
        \u1/u0/data_out_RNO_0[7]_net_1 , \u1/u0/N_391 , 
        \u1/u0/data_out_35[7] , \u1/u0/data_out_12_m[7] , 
        \u1/u0/data_out_12_i[7] , \u1/u0/data_out_35[0] , 
        \u1/u0/data_out_33[0] , \u1/u0/data_out_m[0] , 
        \u1/u0/data_out_35[8] , \u1/u0/next_state_d[24] , 
        \u1/u0/data_out_m[8] , \u1/u0/next_state_d[28] , \u1/u0/N_75 , 
        \u1/u0/data_out_35[12] , \u1/u0/N_414 , \u1/u0/data_out_35[6] , 
        \u1/u0/data_out_15[6] , \u1/u0/data_out_m_i[6] , \u1/u0/tms_2 , 
        \u2/WEBP , \u2/N_172 , \u2/WEAP , \u2/N_156 , \u2/rwclk_net_1 , 
        \u2/rwclk_i , \u2/next_state_ns_0_0[0] , 
        \u2/next_state[0]_net_1 , \u2/next_state[1]_net_1 , 
        \u2/next_state_ns_i_a3_0_0[1] , \u2/next_state_ns_0_a3_1_0[0] , 
        \u2/un1_raddr_1_sqmuxa_0_a3_0 , \u2/raddr[0]_net_1 , 
        \u2/raddr[1]_net_1 , \u2/raddr_n2_0_i_0 , \u2/raddr[2]_net_1 , 
        \u2/next_state_ns_i_o3_0[1] , \u2/waddre , \u2/N_31_i_0 , 
        \u2/N_37 , \u2/raddr[7]_net_1 , \u2/ren_2_sqmuxa , \u2/N_29 , 
        \u2/N_44 , \u2/N_27 , \u2/N_35 , \u2/raddr[5]_net_1 , 
        \u2/N_11 , \u2/N_34 , \u2/raddr[4]_net_1 , \u2/N_9 , \u2/N_33 , 
        \u2/raddr[3]_net_1 , \u2/N_192 , \u2/N_191 , 
        \u2/next_state_ns[0] , \u2/next_state16 , \u2/wd_5[0] , 
        \u2/wd_5[2] , \u2/wd_5[3] , \u2/wd_5[4] , \u2/wd_5[8] , 
        \u2/wd_5[9] , \u2/wd_5[10] , \u2/wd_5[12] , \u2/wd_5[14] , 
        \u2/result_addr_6[0] , \u2/rd[0] , \u2/next_state_i[0] , 
        \u2/result_addr_6[1] , \u2/rd[1] , \u2/result_addr_6[2] , 
        \u2/rd[2] , \u2/result_addr_6[3] , \u2/rd[3] , 
        \u2/result_addr_6[4] , \u2/rd[4] , \u2/result_addr_6[5] , 
        \u2/rd[5] , \u2/result_addr_6[6] , \u2/rd[6] , 
        \u2/result_addr_6[7] , \u2/rd[7] , \u2/result_addr_6[8] , 
        \u2/rd[8] , \u2/result_addr_6[9] , \u2/rd[9] , 
        \u2/result_addr_6[11] , \u2/rd[11] , \u2/result_addr_6[12] , 
        \u2/rd[12] , \u2/result_addr_6[13] , \u2/rd[13] , 
        \u2/result_addr_6[14] , \u2/rd[14] , \u2/result_addr_6[15] , 
        \u2/rd[15] , \u2/wd_5[5] , \u2/wd_5[1] , 
        \u2/next_state_RNO[1]_net_1 , \u2/N_185 , \u2/raddre , 
        \u2/raddr_n0 , \u2/raddr[6]_net_1 , \u2/un1_ren_2_sqmuxa , 
        \u2/done_1_sqmuxa , \u2/rwclk_4 , \u2/wd_5[7] , \u2/wd_5[13] , 
        \u2/wd_5[15] , \u2/waddr_n7 , \u2/waddr[6]_net_1 , 
        \u2/waddr_c5 , \u2/waddr[7]_net_1 , \u2/waddr_n6 , 
        \u2/waddr_n5 , \u2/waddr_c4 , \u2/waddr[5]_net_1 , 
        \u2/waddr_n4 , \u2/waddr[3]_net_1 , \u2/waddr_c2 , 
        \u2/waddr[4]_net_1 , \u2/waddr_n3 , \u2/waddr_n2 , 
        \u2/waddr[0]_net_1 , \u2/waddr[1]_net_1 , \u2/waddr[2]_net_1 , 
        \u2/waddr_RNO[0]_net_1 , \u2/waddr_n1 , 
        \u2/un1_raddr_1_sqmuxa , \u2/N_168 , \u2/wd_5[11] , 
        \u2/result_addr_6[10] , \u2/rd[10] , \u2/wd_5[6] , 
        \u2/wd[0]_net_1 , \u2/wd[1]_net_1 , \u2/wd[2]_net_1 , 
        \u2/wd[3]_net_1 , \u2/wd[4]_net_1 , \u2/wd[5]_net_1 , 
        \u2/wd[6]_net_1 , \u2/wd[7]_net_1 , \u2/wd[8]_net_1 , 
        \u2/wd[9]_net_1 , \u2/wd[10]_net_1 , \u2/wd[11]_net_1 , 
        \u2/wd[12]_net_1 , \u2/wd[13]_net_1 , \u2/wd[14]_net_1 , 
        \u2/wd[15]_net_1 , \u2/I_115 , \u2/DWACT_COMP0_E[1] , 
        \u2/DWACT_COMP0_E[2] , \u2/DWACT_COMP0_E[0] , 
        \u2/DWACT_CMPLE_PO2_DWACT_COMP0_E[1] , 
        \u2/DWACT_CMPLE_PO2_DWACT_COMP0_E[2] , 
        \u2/DWACT_CMPLE_PO2_DWACT_COMP0_E[0] , \u2/N_21 , \u2/N_20 , 
        \u2/N_19 , \u2/N_16 , \u2/N_18 , \u2/N_17 , \u2/N_15 , 
        \u2/N_12 , \u2/N_13 , \u2/N_14 , \u2/ACT_LT4_E[3] , 
        \u2/ACT_LT4_E[6] , \u2/ACT_LT4_E[10] , \u2/ACT_LT4_E[7] , 
        \u2/ACT_LT4_E[8] , \u2/ACT_LT4_E[5] , \u2/ACT_LT4_E[0] , 
        \u2/ACT_LT4_E[1] , \u2/ACT_LT4_E[2] , 
        \u2/DWACT_BL_EQUAL_0_DWACT_ANDTREE_E[0] , 
        \u2/DWACT_BL_EQUAL_0_E[0] , \u2/DWACT_BL_EQUAL_0_E[1] , 
        \u2/DWACT_BL_EQUAL_0_E[2] , 
        \u2/DWACT_CMPLE_PO0_DWACT_COMP0_E[1] , 
        \u2/DWACT_CMPLE_PO0_DWACT_COMP0_E[2] , 
        \u2/DWACT_CMPLE_PO0_DWACT_COMP0_E[0] , \u2/ACT_LT4_E_0[3] , 
        \u2/ACT_LT4_E_0[6] , \u2/ACT_LT4_E_0[10] , \u2/ACT_LT4_E_0[7] , 
        \u2/ACT_LT4_E_0[8] , \u2/ACT_LT4_E_0[5] , \u2/ACT_LT4_E_0[0] , 
        \u2/ACT_LT4_E_0[1] , \u2/ACT_LT4_E_0[2] , \u2/ACT_LT3_E[3] , 
        \u2/ACT_LT3_E[4] , \u2/ACT_LT3_E[5] , \u2/ACT_LT3_E[0] , 
        \u2/ACT_LT3_E[1] , \u2/ACT_LT3_E[2] , 
        \u2/DWACT_BL_EQUAL_0_E_0[2] , \u2/DWACT_BL_EQUAL_0_E_0[1] , 
        \u2/DWACT_BL_EQUAL_0_E_0[0] , \u2/DWACT_BL_EQUAL_0_E[6] , 
        \u2/DWACT_BL_EQUAL_0_DWACT_ANDTREE_E[1] , 
        \u2/DWACT_BL_EQUAL_0_DWACT_ANDTREE_E_0[0] , 
        \u2/DWACT_BL_EQUAL_0_E_0[3] , \u2/DWACT_BL_EQUAL_0_E[4] , 
        \u2/DWACT_BL_EQUAL_0_E[5] , \u2/DWACT_BL_EQUAL_0_E_1[0] , 
        \u2/DWACT_BL_EQUAL_0_E_1[1] , \u2/DWACT_BL_EQUAL_0_E_1[2] , 
        \u2/u0/un1_rd_1_13 , \u2/u0/un1_rd_1_5 , \u2/u0/un1_rd_1_4 , 
        \u2/u0/un1_rd_1_11 , \u2/u0/un1_rd_1_12 , \u2/u0/un1_rd_1_1 , 
        \u2/u0/un1_rd_1_0 , \u2/u0/un1_rd_1_9 , \u2/u0/un1_rd_1_7 , 
        \u2/u0/un1_rd_1_3 , GND, VCC, \pld_ctr_pad[1]/U0/NET1 , 
        \pld_ctr_pad[1]/U0/NET2 , \pld_data_pad[5]/U0/NET1 , 
        \pld_data_pad[5]/U0/NET2 , \pld_data_pad[5]/U0/NET3 , 
        \pld_data_pad[14]/U0/NET1 , \pld_data_pad[14]/U0/NET2 , 
        \pld_data_pad[14]/U0/NET3 , \pld_ctr_pad[3]/U0/NET1 , 
        \pld_data_pad[0]/U0/NET1 , \pld_data_pad[0]/U0/NET2 , 
        \pld_data_pad[0]/U0/NET3 , \osc6m_pad/U0/NET1 , 
        \osc6m_pad/U0/NET2 , \pld_data_pad[8]/U0/NET1 , 
        \pld_data_pad[8]/U0/NET2 , \pld_data_pad[8]/U0/NET3 , 
        \pld_data_pad[11]/U0/NET1 , \pld_data_pad[11]/U0/NET2 , 
        \pld_data_pad[11]/U0/NET3 , \pld_data_pad[15]/U0/NET1 , 
        \pld_data_pad[15]/U0/NET2 , \pld_data_pad[15]/U0/NET3 , 
        \mote_tms_pad/U0/NET1 , \mote_tms_pad/U0/NET2 , 
        \mote_tdo_pad/U0/NET1 , \pld_data_pad[10]/U0/NET1 , 
        \pld_data_pad[10]/U0/NET2 , \pld_data_pad[10]/U0/NET3 , 
        \pld_data_pad[9]/U0/NET1 , \pld_data_pad[9]/U0/NET2 , 
        \pld_data_pad[9]/U0/NET3 , \mote_tdi_pad/U0/NET1 , 
        \mote_tdi_pad/U0/NET2 , \pld_data_pad[4]/U0/NET1 , 
        \pld_data_pad[4]/U0/NET2 , \pld_data_pad[4]/U0/NET3 , 
        \osc32k_pad/U0/NET1 , \osc32k_pad/U0/NET2 , 
        \pld_data_pad[7]/U0/NET1 , \pld_data_pad[7]/U0/NET2 , 
        \pld_data_pad[7]/U0/NET3 , \pld_data_pad[2]/U0/NET1 , 
        \pld_data_pad[2]/U0/NET2 , \pld_data_pad[2]/U0/NET3 , 
        \usb_connect_pad/U0/NET1 , \pld_data_pad[13]/U0/NET1 , 
        \pld_data_pad[13]/U0/NET2 , \pld_data_pad[13]/U0/NET3 , 
        \pld_ctr_pad[4]/U0/NET1 , \osc48m_pad/U0/NET1 , 
        \pld_data_pad[6]/U0/NET1 , \pld_data_pad[6]/U0/NET2 , 
        \pld_data_pad[6]/U0/NET3 , \pld_ctr_pad[0]/U0/NET1 , 
        \mcu_osc_pad/U0/NET1 , \mcu_osc_pad/U0/NET2 , 
        \pld_ctr_pad[2]/U0/NET1 , \pld_data_pad[12]/U0/NET1 , 
        \pld_data_pad[12]/U0/NET2 , \pld_data_pad[12]/U0/NET3 , 
        \pld_data_pad[1]/U0/NET1 , \pld_data_pad[1]/U0/NET2 , 
        \pld_data_pad[1]/U0/NET3 , \mote_tck_pad/U0/NET1 , 
        \mote_tck_pad/U0/NET2 , \pld_data_pad[3]/U0/NET1 , 
        \pld_data_pad[3]/U0/NET2 , \pld_data_pad[3]/U0/NET3 , 
        \u1/u0/tdi/Y , \u1/u0/next_state[3]/Y , 
        \u1/u0/next_state[0]/Y , \u1/u0/data_out[7]/Y , 
        \u1/u0/data_out[15]/Y , \u1/u0/next_state[2]/Y , 
        \u1/u0/data_out[2]/Y , \u1/u0/data_out[11]/Y , 
        \u1/u0/data_out[10]/Y , \u1/u0/data_out[6]/Y , 
        \u1/u0/data_out[0]/Y , \u1/u0/data_out[8]/Y , 
        \u1/u0/next_state[1]/Y , \u1/u0/data_out[5]/Y , 
        \u1/u0/data_out[13]/Y , \u1/u0/data_out[12]/Y , 
        \u1/u0/next_state[4]/Y , \u1/u0/data_out[4]/Y , 
        \u1/u0/next_state[5]/Y , \u1/u0/data_out[3]/Y , 
        \u1/u0/data_out[1]/Y , \u1/u0/next_state_0[5]/Y , 
        \u1/u0/data_out[9]/Y , \u1/u0/done/Y , \u1/u0/data_out[14]/Y , 
        \u1/u0/tms/Y , AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    XOR2 \u1/next_state_RNIFD51[1]  (.A(\u1/next_state[1]_net_1 ), .B(
        \u1/next_state[0]_net_1 ), .Y(\u1/N_83_i ));
    NOR2B \u1/u0/next_state_RNIFCQC_3[1]  (.A(\u1/u0/next_state[2] ), 
        .B(\u1/u0/next_state[1] ), .Y(\u1/u0/N_388 ));
    OR2 \u1/u0/next_state_RNIEGDJ3[4]  (.A(\u1/u0/N_390 ), .B(
        \u1/u0/N_290 ), .Y(\u1/u0/N_305 ));
    OR3A \u1/u0/next_state_RNO_7[0]  (.A(
        \u1/u0/next_state_ns_0_a3_5_2[0] ), .B(\u1/u0/next_state[4] ), 
        .C(\u1/u0/next_state[2] ), .Y(\u1/u0/N_457_i ));
    DFI1E1C1 \u2/ren  (.D(pc_ready), .CLK(osc96m), .E(\u2/N_172 ), 
        .CLR(\pld_ctr_c[0] ), .QN(\u2/WEBP ));
    OR3A \u1/u0/next_state_RNIJ5F61[0]  (.A(\u1/u0/N_392 ), .B(
        \u1/u0/N_475 ), .C(\u1/u0/N_296 ), .Y(\u1/u0/next_state_d[28] )
        );
    DFN1E0C1 \u2/waddr[7]  (.D(\u2/waddr_n7 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/waddre ), .Q(\u2/waddr[7]_net_1 ));
    IOPAD_BI_U \pld_data_pad[12]/U0/U0  (.D(\pld_data_pad[12]/U0/NET1 )
        , .E(\pld_data_pad[12]/U0/NET2 ), .Y(
        \pld_data_pad[12]/U0/NET3 ), .PAD(pld_data[12]));
    IOIN_IB \pld_ctr_pad[2]/U0/U1  (.YIN(\pld_ctr_pad[2]/U0/NET1 ), .Y(
        \pld_ctr_c[2] ));
    IOIN_IB \osc48m_pad/U0/U1  (.YIN(\osc48m_pad/U0/NET1 ), .Y(
        osc48m_c));
    AX1C \u2/waddr_RNO[2]  (.A(\u2/waddr[0]_net_1 ), .B(
        \u2/waddr[1]_net_1 ), .C(\u2/waddr[2]_net_1 ), .Y(
        \u2/waddr_n2 ));
    OA1A \u2/un1_addr_0_I_98  (.A(\program_addr[3] ), .B(\u2/rd[3] ), 
        .C(\u2/N_13 ), .Y(\u2/N_17 ));
    OR3C \u1/u0/next_state_RNIMHUV[3]  (.A(\u1/jtag_enable_net_1 ), .B(
        \u1/u0/next_state[3] ), .C(\u1/u0/N_408 ), .Y(\u1/u0/N_369 ));
    IOTRI_OB_EB \mote_tdi_pad/U0/U1  (.D(mote_tdi_iv_i_0), .E(VCC), 
        .DOUT(\mote_tdi_pad/U0/NET1 ), .EOUT(\mote_tdi_pad/U0/NET2 ));
    MX2 \u1/u0/next_state[1]/U0  (.A(\u1/u0/next_state[1] ), .B(
        \u1/u0/N_430 ), .S(\u1/jtag_enable_net_1 ), .Y(
        \u1/u0/next_state[1]/Y ));
    OR2A \u2/un1_addr_0_I_28  (.A(\u2/rd[14] ), .B(\program_addr[14] ), 
        .Y(\u2/ACT_LT3_E[1] ));
    DFN1E1C1 \u2/result_addr[4]  (.D(\u2/result_addr_6[4] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[4] ));
    XOR2 \u2/waddr_RNO[5]  (.A(\u2/waddr_c4 ), .B(\u2/waddr[5]_net_1 ), 
        .Y(\u2/waddr_n5 ));
    IOPAD_IN \osc48m_pad/U0/U0  (.PAD(osc48m), .Y(\osc48m_pad/U0/NET1 )
        );
    IOPAD_BI_U \pld_data_pad[10]/U0/U0  (.D(\pld_data_pad[10]/U0/NET1 )
        , .E(\pld_data_pad[10]/U0/NET2 ), .Y(
        \pld_data_pad[10]/U0/NET3 ), .PAD(pld_data[10]));
    DFN1E1C1 \u2/result_addr[8]  (.D(\u2/result_addr_6[8] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[8] ));
    AO1B \u1/u0/data_out_RNO[11]  (.A(\u1/u0/N_74 ), .B(
        \u1/jtag_data_out[11] ), .C(\u1/u0/tdo_m_2 ), .Y(
        \u1/u0/data_out_35[11] ));
    NOR2B \u2/result_addr_RNO[6]  (.A(\u2/rd[6] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[6] ));
    OR2A \u1/u0/next_state_RNIFCQC_1[1]  (.A(\u1/u0/next_state[2] ), 
        .B(\u1/u0/next_state[1] ), .Y(\u1/u0/N_391 ));
    IOPAD_BI_U \pld_data_pad[9]/U0/U0  (.D(\pld_data_pad[9]/U0/NET1 ), 
        .E(\pld_data_pad[9]/U0/NET2 ), .Y(\pld_data_pad[9]/U0/NET3 ), 
        .PAD(pld_data[9]));
    NOR2B \u1/u0/next_state_RNIFCQC_0[0]  (.A(\u1/u0/next_state[3] ), 
        .B(\u1/u0/next_state[0] ), .Y(\u1/u0/N_386 ));
    DFN1E1C1 \u2/raddr[6]  (.D(\u2/N_29 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/raddre ), .Q(\u2/raddr[6]_net_1 ));
    OR3A \u1/u0/next_state_RNINDLJ7[5]  (.A(\u1/u0/N_382 ), .B(
        \u1/u0/N_292 ), .C(\u1/u0/N_295 ), .Y(\u1/u0/N_76_1 ));
    AO1B \u1/u0/data_out_RNO_0[8]  (.A(\u1/u0/next_state_d[28] ), .B(
        \u1/u0/N_69_1 ), .C(\u1/jtag_data_out[8] ), .Y(
        \u1/u0/data_out_m[8] ));
    AOI1A \u2/un1_addr_0_I_82  (.A(\program_addr[7] ), .B(\u2/rd[7] ), 
        .C(\u2/ACT_LT4_E[5] ), .Y(\u2/ACT_LT4_E[6] ));
    DFN1C1 \u1/u0/data_out[8]/U1  (.D(\u1/u0/data_out[8]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_net_1 ), .Q(\u1/jtag_data_out[8] )
        );
    NOR2 \u2/u0/program_table_mem_R0C0_RNIA2E6_4  (.A(\u2/rd[14] ), .B(
        \u2/rd[15] ), .Y(\u2/u0/un1_rd_1_7 ));
    MX2 \u1/data_RNIV3VC[6]  (.A(\u1/jtag_data[6] ), .B(
        \pld_data_in[6] ), .S(un1_pld_data), .Y(\program_addr[6] ));
    XNOR2 \u2/un1_addr_0_I_3  (.A(\program_addr[15] ), .B(\u2/rd[15] ), 
        .Y(\u2/DWACT_BL_EQUAL_0_E[6] ));
    AOI1 \u2/next_state_RNO_0[1]  (.A(\u2/next_state_ns_i_o3_0[1] ), 
        .B(pc_ready), .C(\u2/next_state[1]_net_1 ), .Y(\u2/N_185 ));
    AO1B \u1/u0/data_out_RNO[13]  (.A(\u1/u0/tdo_m_6_0 ), .B(
        \u1/u0/N_418 ), .C(\u1/u0/data_out_m[13] ), .Y(
        \u1/u0/data_out_35[13] ));
    NOR2B \u2/result_addr_RNO[5]  (.A(\u2/rd[5] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[5] ));
    IOTRI_OB_EB \osc6m_pad/U0/U1  (.D(osc6m_c), .E(VCC), .DOUT(
        \osc6m_pad/U0/NET1 ), .EOUT(\osc6m_pad/U0/NET2 ));
    OR3C \u2/raddr_RNI1M3D1[6]  (.A(\u2/N_35 ), .B(\u2/raddr[5]_net_1 )
        , .C(\u2/raddr[6]_net_1 ), .Y(\u2/N_37 ));
    MX2 \pld_data_pad_RNINSI9[15]  (.A(\jtag_data[15] ), .B(
        \pld_data_in[15] ), .S(un1_pld_data), .Y(\program_addr[15] ));
    OR2 \u1/u0/next_state_RNIFCQC_2[1]  (.A(\u1/u0/next_state[2] ), .B(
        \u1/u0/next_state[1] ), .Y(\u1/u0/N_476 ));
    AO1C \u1/u0/data_out_RNO[6]  (.A(\u1/u0/next_state_d[28] ), .B(
        \u1/u0/data_out_15[6] ), .C(\u1/u0/data_out_m_i[6] ), .Y(
        \u1/u0/data_out_35[6] ));
    NOR2B \u2/result_addr_RNO[3]  (.A(\u2/rd[3] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[3] ));
    PLLBA \u0/u0/Core  (.CLKA(osc48m_c), .EXTFB(GND), .POWERDOWN(VCC), 
        .GLA(osc6m_buff), .LOCK(), .GLB(mcu_osc_c), .YB(), .GLC(osc96m)
        , .YC(), .OADIV0(VCC), .OADIV1(VCC), .OADIV2(VCC), .OADIV3(GND)
        , .OADIV4(GND), .OAMUX0(GND), .OAMUX1(GND), .OAMUX2(VCC), 
        .DLYGLA0(GND), .DLYGLA1(GND), .DLYGLA2(GND), .DLYGLA3(GND), 
        .DLYGLA4(GND), .OBDIV0(VCC), .OBDIV1(GND), .OBDIV2(VCC), 
        .OBDIV3(GND), .OBDIV4(GND), .OBMUX0(GND), .OBMUX1(VCC), 
        .OBMUX2(GND), .DLYYB0(GND), .DLYYB1(GND), .DLYYB2(GND), 
        .DLYYB3(GND), .DLYYB4(GND), .DLYGLB0(GND), .DLYGLB1(GND), 
        .DLYGLB2(GND), .DLYGLB3(GND), .DLYGLB4(GND), .OCDIV0(GND), 
        .OCDIV1(GND), .OCDIV2(GND), .OCDIV3(GND), .OCDIV4(GND), 
        .OCMUX0(GND), .OCMUX1(VCC), .OCMUX2(GND), .DLYYC0(GND), 
        .DLYYC1(GND), .DLYYC2(GND), .DLYYC3(GND), .DLYYC4(GND), 
        .DLYGLC0(GND), .DLYGLC1(GND), .DLYGLC2(GND), .DLYGLC3(GND), 
        .DLYGLC4(GND), .FINDIV0(GND), .FINDIV1(GND), .FINDIV2(GND), 
        .FINDIV3(VCC), .FINDIV4(GND), .FINDIV5(GND), .FINDIV6(GND), 
        .FBDIV0(GND), .FBDIV1(GND), .FBDIV2(GND), .FBDIV3(VCC), 
        .FBDIV4(GND), .FBDIV5(GND), .FBDIV6(GND), .FBDLY0(GND), 
        .FBDLY1(GND), .FBDLY2(GND), .FBDLY3(GND), .FBDLY4(GND), 
        .FBSEL0(VCC), .FBSEL1(GND), .XDLYSEL(GND), .VCOSEL0(GND), 
        .VCOSEL1(VCC), .VCOSEL2(GND));
    NOR2B \u2/result_addr_RNO[11]  (.A(\u2/rd[11] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[11] ));
    MX2 \u1/data_RNIFCI9[11]  (.A(\u1/jtag_data[11] ), .B(
        \pld_data_in[11] ), .S(un1_pld_data), .Y(\program_addr[11] ));
    AO1A \u1/u0/data_out_RNO_0[10]  (.A(\u1/u0/N_476 ), .B(
        \u1/u0/N_413 ), .C(\u1/u0/N_73_1 ), .Y(\u1/u0/N_73 ));
    AND2A \u2/un1_addr_0_I_78  (.A(\u2/rd[6] ), .B(\program_addr[6] ), 
        .Y(\u2/ACT_LT4_E[2] ));
    IOPAD_IN_U \mote_tdo_pad/U0/U0  (.PAD(mote_tdo), .Y(
        \mote_tdo_pad/U0/NET1 ));
    DFN1C1 \u2/next_state[1]  (.D(\u2/next_state_RNO[1]_net_1 ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .Q(\u2/next_state[1]_net_1 ));
    NOR3C \u2/next_state_RNI6LISL[1]  (.A(\u2/next_state16 ), .B(
        \u2/next_state_ns_i_a3_0_0[1] ), .C(\u2/next_state[1]_net_1 ), 
        .Y(\u2/done_1_sqmuxa ));
    XNOR2 \u1/u0/next_state_RNIHCQC[2]  (.A(\u1/u0/next_state[3] ), .B(
        \u1/u0/next_state[2] ), .Y(\u1/u0/N_437_i_i_0 ));
    DFN1E1C1 \u2/raddr[0]  (.D(\u2/raddr_n0 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/raddre ), .Q(\u2/raddr[0]_net_1 ));
    NOR3B \u1/u0/next_state_RNI8V101_0[4]  (.A(\u1/u0/N_386 ), .B(
        \u1/u0/N_388 ), .C(\u1/u0/next_state[4] ), .Y(\u1/u0/N_420 ));
    NOR3B \u2/raddr_RNO[6]  (.A(\u2/ren_2_sqmuxa ), .B(\u2/N_37 ), .C(
        \u2/N_44 ), .Y(\u2/N_29 ));
    OA1 \u2/wd_RNO[12]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[12] ), .Y(\u2/wd_5[12] ));
    DFN1E1C1 \u2/result_addr[12]  (.D(\u2/result_addr_6[12] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[12] ));
    AX1C \u2/waddr_RNO[4]  (.A(\u2/waddr[3]_net_1 ), .B(\u2/waddr_c2 ), 
        .C(\u2/waddr[4]_net_1 ), .Y(\u2/waddr_n4 ));
    IOPAD_TRI \mote_tdi_pad/U0/U0  (.D(\mote_tdi_pad/U0/NET1 ), .E(
        \mote_tdi_pad/U0/NET2 ), .PAD(mote_tdi));
    OAI1 \u1/u0/data_out_RNO_0[15]  (.A(\u1/u0/N_76_1 ), .B(
        \u1/u0/N_418 ), .C(\u1/jtag_data_out[15] ), .Y(
        \u1/u0/data_out_m[15] ));
    XNOR2 \u2/un1_addr_0_I_4  (.A(\program_addr[11] ), .B(\u2/rd[11] ), 
        .Y(\u2/DWACT_BL_EQUAL_0_E_1[2] ));
    OR3B \u1/u0/next_state_RNO_5[0]  (.A(\u1/u0/next_state[2] ), .B(
        \u1/u0/N_445_i ), .C(\u1/u0/next_state[4] ), .Y(\u1/u0/N_451 ));
    IOPAD_IN \pld_ctr_pad[3]/U0/U0  (.PAD(pld_ctr[3]), .Y(
        \pld_ctr_pad[3]/U0/NET1 ));
    IOPAD_TRI \osc32k_pad/U0/U0  (.D(\osc32k_pad/U0/NET1 ), .E(
        \osc32k_pad/U0/NET2 ), .PAD(osc32k));
    NOR2A \u2/raddr_RNO[2]  (.A(\u2/ren_2_sqmuxa ), .B(
        \u2/raddr_n2_0_i_0 ), .Y(\u2/N_192 ));
    MX2 \u1/u0/data_out[15]/U0  (.A(\u1/jtag_data_out[15] ), .B(
        \u1/u0/data_out_35[15] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[15]/Y ));
    DFN1E1C1 \u2/result_addr[11]  (.D(\u2/result_addr_6[11] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[11] ));
    DFN1E1C1 \u2/result_addr[14]  (.D(\u2/result_addr_6[14] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[14] ));
    IOTRI_OB_EB \osc32k_pad/U0/U1  (.D(VCC), .E(VCC), .DOUT(
        \osc32k_pad/U0/NET1 ), .EOUT(\osc32k_pad/U0/NET2 ));
    OA1 \u1/u0/next_state_RNITH9J1[4]  (.A(\u1/u0/N_397 ), .B(
        \u1/u0/N_419 ), .C(\u1/u0/N_471 ), .Y(\u1/u0/N_390 ));
    IOBI_IB_OB_EB \pld_data_pad[15]/U0/U1  (.D(
        \program_table_data[15] ), .E(\pld_ctr_c_0[3] ), .YIN(
        \pld_data_pad[15]/U0/NET3 ), .DOUT(\pld_data_pad[15]/U0/NET1 ), 
        .EOUT(\pld_data_pad[15]/U0/NET2 ), .Y(\pld_data_in[15] ));
    NOR3B \u1/u0/next_state_RNO_11[0]  (.A(\u1/u0/next_state[1] ), .B(
        \u1/u0/next_state[3] ), .C(jtag_tck), .Y(
        \u1/u0/next_state_ns_0_a3_5_2[0] ));
    IOPAD_BI_U \pld_data_pad[3]/U0/U0  (.D(\pld_data_pad[3]/U0/NET1 ), 
        .E(\pld_data_pad[3]/U0/NET2 ), .Y(\pld_data_pad[3]/U0/NET3 ), 
        .PAD(pld_data[3]));
    MX2 \pld_data_pad_RNIHGI9[12]  (.A(\jtag_data[12] ), .B(
        \pld_data_in[12] ), .S(un1_pld_data), .Y(\program_addr[12] ));
    MX2 \u1/u0/data_out[13]/U0  (.A(\u1/jtag_data_out[13] ), .B(
        \u1/u0/data_out_35[13] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[13]/Y ));
    NOR2 \u1/u0/next_state_RNIUI7J[5]  (.A(\u1/u0/next_state[5] ), .B(
        \u1/u0/N_471 ), .Y(\u1/u0/N_294 ));
    OA1A \u1/u0/next_state_RNITAUC2[4]  (.A(
        \u1/u0/data_out_35_0_a2_0[12] ), .B(\u1/u0/N_296 ), .C(
        \u1/u0/N_421 ), .Y(\u1/u0/data_out_35_0_1_0[10] ));
    NOR3A \u1/u0/next_state_RNI8V101_1[4]  (.A(\u1/u0/N_386 ), .B(
        \u1/u0/next_state[4] ), .C(\u1/u0/N_476 ), .Y(\u1/u0/N_418 ));
    NOR3A \u1/u0/next_state_RNO_0[3]  (.A(\u1/u0/next_state[3] ), .B(
        \u1/jtag_mode_net_1 ), .C(\u1/u0/next_state_0[5] ), .Y(
        \u1/u0/next_state_ns_i_a3_1_1[3] ));
    NOR3C \u1/u0/next_state_RNI5BE74[0]  (.A(\u1/u0/N_369 ), .B(
        \u1/u0/N_366 ), .C(\u1/u0/N_368 ), .Y(\u1/u0/un1_tck55_1_0_2 ));
    MX2C \u1/u0/next_state_RNO_1[3]  (.A(\u1/u0/next_state[3] ), .B(
        \u1/u0/N_475 ), .S(\u1/u0/N_443 ), .Y(
        \u1/u0/next_state_ns_i_0[3] ));
    AO1 \u2/un1_addr_0_I_115  (.A(\u2/DWACT_COMP0_E[1] ), .B(
        \u2/DWACT_COMP0_E[2] ), .C(\u2/DWACT_COMP0_E[0] ), .Y(
        \u2/I_115 ));
    OR3B \u1/u0/tdi_RNO_4  (.A(\u1/u0/N_387 ), .B(\u1/u0/N_373_1 ), .C(
        \u1/u0/N_288_i ), .Y(\u1/u0/N_371 ));
    NOR2A \u2/un1_addr_0_I_95  (.A(\u2/rd[0] ), .B(\program_addr[0] ), 
        .Y(\u2/N_14 ));
    DFN1E1 \u1/data[2]  (.D(\u1/jtag_data_out[2] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\u1/jtag_data[2] ));
    IOIN_IB \pld_ctr_pad[4]/U0/U1  (.YIN(\pld_ctr_pad[4]/U0/NET1 ), .Y(
        \pld_ctr_c[4] ));
    OR2A \u1/u0/next_state_RNIDCQC[1]  (.A(\u1/u0/next_state[1] ), .B(
        \u1/u0/next_state[0] ), .Y(\u1/u0/N_441 ));
    OA1 \u2/wd_RNO[1]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[1] ), .Y(\u2/wd_5[1] ));
    NOR2A \u2/un1_addr_0_I_47  (.A(\program_addr[11] ), .B(\u2/rd[11] )
        , .Y(\u2/ACT_LT4_E_0[7] ));
    OR2A \u1/u0/next_state_RNO_4[1]  (.A(\u1/u0/next_state[2] ), .B(
        \u1/u0/next_state[3] ), .Y(\u1/u0/next_state_ns_i_a3_1_0[1] ));
    DFN1E0C1 \u2/wd[7]  (.D(\u2/wd_5[7] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[7]_net_1 ));
    IOTRI_OB_EB \pld_ctr_pad[1]/U0/U1  (.D(ready_c), .E(VCC), .DOUT(
        \pld_ctr_pad[1]/U0/NET1 ), .EOUT(\pld_ctr_pad[1]/U0/NET2 ));
    AOI1B \u1/u0/tdi_RNO_0  (.A(\u1/u0/un1_next_state_5_i_3 ), .B(
        \u1/u0/un1_next_state_5_i_2 ), .C(\u1/jtag_enable_net_1 ), .Y(
        \u1/u0/N_477_i ));
    DFN1E0C1 \u2/wd[6]  (.D(\u2/wd_5[6] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[6]_net_1 ));
    DFN1E1C1 \u2/done  (.D(\u2/done_1_sqmuxa ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/un1_ren_2_sqmuxa ), .Q(ready_c));
    AO1A \u2/next_state_RNIIJU7[0]  (.A(\pld_ctr_c[4] ), .B(pc_ready), 
        .C(\u2/next_state_i[0] ), .Y(\u2/N_156 ));
    NOR2B \u1/u0/next_state_RNIPI7J[4]  (.A(\u1/u0/next_state[4] ), .B(
        \u1/u0/N_386 ), .Y(\u1/u0/data_out_35_0_a2_0[12] ));
    MX2 \u1/u0/tdi/U0  (.A(jtag_tdi), .B(\u1/u0/N_285 ), .S(
        \u1/u0/N_477_i ), .Y(\u1/u0/tdi/Y ));
    DFN1E1C1 \u2/raddr[4]  (.D(\u2/N_11 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/raddre ), .Q(\u2/raddr[4]_net_1 ));
    OA1 \u2/wd_RNO[3]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[3] ), .Y(\u2/wd_5[3] ));
    NOR3C \u1/u0/data_out_RNO_0[2]  (.A(\u1/u0/data_out_27[2] ), .B(
        \u1/u0/next_state_0[5] ), .C(\u1/u0/N_388 ), .Y(
        \u1/u0/data_out_27_m_1[2] ));
    DFN1E1C1 \u2/raddr[2]  (.D(\u2/N_192 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/raddre ), .Q(\u2/raddr[2]_net_1 ));
    MX2 \u1/u0/data_out[0]/U0  (.A(\u1/jtag_data_out[0] ), .B(
        \u1/u0/data_out_35[0] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[0]/Y ));
    IOPAD_IN_U \pld_ctr_pad[2]/U0/U0  (.PAD(pld_ctr[2]), .Y(
        \pld_ctr_pad[2]/U0/NET1 ));
    NOR2 \u1/u0/next_state_RNILI7J_0[0]  (.A(\u1/u0/next_state[0] ), 
        .B(\u1/u0/N_288_i ), .Y(\u1/u0/N_397 ));
    DFN1E1 \u1/data[6]  (.D(\u1/jtag_data_out[6] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\u1/jtag_data[6] ));
    NOR2A \u2/un1_addr_0_I_83  (.A(\program_addr[7] ), .B(\u2/rd[7] ), 
        .Y(\u2/ACT_LT4_E[7] ));
    OR2A \u2/next_state_RNIIJU7_1[0]  (.A(\u2/N_172 ), .B(pc_ready), 
        .Y(\u2/ren_2_sqmuxa ));
    NOR3 \u1/u0/next_state_RNI8V101_2[4]  (.A(\u1/u0/N_385 ), .B(
        \u1/u0/next_state[4] ), .C(\u1/u0/N_296 ), .Y(\u1/u0/N_363 ));
    NOR2B \u1/u0/next_state_RNIO43D[0]  (.A(\u1/u0/next_state[0] ), .B(
        \u1/jtag_mode_net_1 ), .Y(\u1/u0/N_442 ));
    XNOR2 \u2/un1_addr_0_I_1  (.A(\program_addr[9] ), .B(\u2/rd[9] ), 
        .Y(\u2/DWACT_BL_EQUAL_0_E_1[0] ));
    DFN1C1 \u2/next_state[0]  (.D(\u2/next_state_ns[0] ), .CLK(osc96m), 
        .CLR(\pld_ctr_c[0] ), .Q(\u2/next_state[0]_net_1 ));
    OR2A \u1/u0/next_state_RNILNOP2[4]  (.A(\u1/u0/N_381_i ), .B(
        \u1/u0/N_292 ), .Y(\u1/u0/N_299 ));
    NOR2 \u2/u0/program_table_mem_R0C0_RNIA2E6_3  (.A(\u2/rd[10] ), .B(
        \u2/rd[11] ), .Y(\u2/u0/un1_rd_1_5 ));
    MX2B \u1/u0/next_state_RNO_0[0]  (.A(
        \u1/u0/next_state_ns_0_a3_0_0[0] ), .B(
        \u1/u0/next_state_ns_0_a3_2_0[0] ), .S(\u1/u0/N_439 ), .Y(
        \u1/u0/next_state_ns_0_2[0] ));
    MX2 \u1/u0/data_out_RNO_2[2]  (.A(\u1/jtag_data_out[2] ), .B(
        mote_tdo_c), .S(\u1/jtag_mode_net_1 ), .Y(
        \u1/u0/data_out_27[2] ));
    DFN1E1C1 \u2/result_addr[13]  (.D(\u2/result_addr_6[13] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[13] ));
    DFN1E1C1 \u2/result_addr[3]  (.D(\u2/result_addr_6[3] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[3] ));
    DFN1E1C1 \u1/next_state[1]  (.D(\u1/N_83_i ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\pld_ctr_c[3] ), .Q(
        \u1/next_state[1]_net_1 ));
    OR2 \pld_ctr_pad_RNIH56[3]  (.A(un1_pld_data), .B(\pld_ctr_c_0[3] )
        , .Y(un3_pld_data_i));
    AND3 \u2/un1_addr_0_I_22  (.A(\u2/DWACT_BL_EQUAL_0_E_0[2] ), .B(
        \u2/DWACT_BL_EQUAL_0_E_0[1] ), .C(\u2/DWACT_BL_EQUAL_0_E_0[0] )
        , .Y(\u2/DWACT_CMPLE_PO0_DWACT_COMP0_E[1] ));
    DFN1E0C1 \u2/wd[13]  (.D(\u2/wd_5[13] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[13]_net_1 ));
    BUFF \pld_ctr_pad_RNIR12[3]  (.A(\pld_ctr_c[3] ), .Y(
        \pld_ctr_c_0[3] ));
    OA1B \u1/u0/next_state_RNI8OMP1[0]  (.A(\u1/u0/N_397 ), .B(
        \u1/u0/N_419 ), .C(\u1/u0/N_294 ), .Y(\u1/u0/N_383 ));
    IOPAD_BI_U \pld_data_pad[14]/U0/U0  (.D(\pld_data_pad[14]/U0/NET1 )
        , .E(\pld_data_pad[14]/U0/NET2 ), .Y(
        \pld_data_pad[14]/U0/NET3 ), .PAD(pld_data[14]));
    XA1 \u2/raddr_RNO[5]  (.A(\u2/N_35 ), .B(\u2/raddr[5]_net_1 ), .C(
        \u2/ren_2_sqmuxa ), .Y(\u2/N_27 ));
    NOR2A \u1/u0/next_state_RNIFCQC_1[0]  (.A(\u1/u0/next_state[0] ), 
        .B(\u1/u0/next_state[3] ), .Y(\u1/u0/N_387 ));
    MX2 \pld_data_pad_RNILOI9[14]  (.A(\jtag_data[14] ), .B(
        \pld_data_in[14] ), .S(un1_pld_data), .Y(\program_addr[14] ));
    IOPAD_BI_U \pld_data_pad[8]/U0/U0  (.D(\pld_data_pad[8]/U0/NET1 ), 
        .E(\pld_data_pad[8]/U0/NET2 ), .Y(\pld_data_pad[8]/U0/NET3 ), 
        .PAD(pld_data[8]));
    NOR2A \u1/u0/data_out_RNO_2[12]  (.A(mote_tdo_c), .B(\u1/u0/N_476 )
        , .Y(\u1/u0/tdo_m_3_0 ));
    DFN1E0C1 \u2/wd[2]  (.D(\u2/wd_5[2] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[2]_net_1 ));
    IOTRI_OB_EB \mcu_osc_pad/U0/U1  (.D(mcu_osc_c), .E(VCC), .DOUT(
        \mcu_osc_pad/U0/NET1 ), .EOUT(\mcu_osc_pad/U0/NET2 ));
    NOR2 \u2/u0/program_table_mem_R0C0_RNIA2E6_0  (.A(\u2/rd[2] ), .B(
        \u2/rd[3] ), .Y(\u2/u0/un1_rd_1_1 ));
    MX2 \u1/u0/data_out[4]/U0  (.A(\u1/jtag_data_out[4] ), .B(
        \u1/u0/data_out_35[4] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[4]/Y ));
    OA1B mote_tms_pad_RNO (.A(\pld_data_in[8] ), .B(un3_pld_data_i), 
        .C(jtag_tms_i_m), .Y(mote_tms_iv));
    OR3A \u1/u0/tdi_RNO_8  (.A(\u1/u0/N_408 ), .B(
        \u1/u0/next_state[0] ), .C(\u1/jtag_mode_net_1 ), .Y(
        \u1/u0/N_372 ));
    DFN1C1 \u1/u0/data_out[1]/U1  (.D(\u1/u0/data_out[1]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[1] ));
    MX2C \u1/u0/data_out_RNO_2[7]  (.A(\u1/jtag_data_out[7] ), .B(
        mote_tdo_c), .S(\u1/jtag_mode_net_1 ), .Y(
        \u1/u0/data_out_12_i[7] ));
    NOR2A \u1/u0/next_state_RNILI7J[0]  (.A(\u1/u0/next_state[0] ), .B(
        \u1/u0/N_296 ), .Y(\u1/u0/N_419 ));
    NOR2B \u2/wd_RNO[13]  (.A(\program_addr[13] ), .B(\pld_ctr_c[4] ), 
        .Y(\u2/wd_5[13] ));
    NOR2 \u2/u0/program_table_mem_R0C0_RNIA2E6_2  (.A(\u2/rd[6] ), .B(
        \u2/rd[7] ), .Y(\u2/u0/un1_rd_1_3 ));
    AOI1B \u1/u0/next_state_0_RNIFEMJ2[5]  (.A(
        \u1/u0/un1_tck55_1_0_a4_0_0 ), .B(\u1/u0/N_314_i ), .C(
        \u1/u0/N_367 ), .Y(\u1/u0/un1_tck55_1_0_1 ));
    NOR2A \u1/u0/next_state_0_RNIAN8D[5]  (.A(\u1/jtag_enable_net_1 ), 
        .B(\u1/u0/next_state_0[5] ), .Y(\u1/u0/un1_tck55_1_0_a4_3_0 ));
    OR3A \u1/u0/next_state_RNIJ5F61_0[0]  (.A(\u1/u0/N_387 ), .B(
        \u1/u0/N_475 ), .C(\u1/u0/N_288_i ), .Y(\u1/u0/N_417 ));
    OA1 \u2/wd_RNO[14]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[14] ), .Y(\u2/wd_5[14] ));
    OR2B \u2/next_state_RNIHD51[0]  (.A(\u2/next_state[0]_net_1 ), .B(
        \u2/next_state[1]_net_1 ), .Y(\u2/un1_raddr_1_sqmuxa_0_a3_0 ));
    DFN1E1 \u1/data[1]  (.D(\u1/jtag_data_out[1] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\u1/jtag_data[1] ));
    DFN1C1 \u1/u0/data_out[4]/U1  (.D(\u1/u0/data_out[4]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[4] ));
    DFN1E1C1 \u2/raddr[7]  (.D(\u2/N_31_i_0 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/raddre ), .Q(\u2/raddr[7]_net_1 ));
    AO1B \u1/u0/data_out_RNO[0]  (.A(\u1/u0/next_state_d[40] ), .B(
        \u1/u0/data_out_33[0] ), .C(\u1/u0/data_out_m[0] ), .Y(
        \u1/u0/data_out_35[0] ));
    DFN1E0C1 \u2/waddr[6]  (.D(\u2/waddr_n6 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/waddre ), .Q(\u2/waddr[6]_net_1 ));
    MX2 \u1/u0/data_out_RNO_4[3]  (.A(\u1/jtag_data_out[3] ), .B(
        mote_tdo_c), .S(\u1/jtag_mode_net_1 ), .Y(
        \u1/u0/data_out_24[3] ));
    IOBI_IB_OB_EB \pld_data_pad[6]/U0/U1  (.D(\program_table_data[6] ), 
        .E(\pld_ctr_c[3] ), .YIN(\pld_data_pad[6]/U0/NET3 ), .DOUT(
        \pld_data_pad[6]/U0/NET1 ), .EOUT(\pld_data_pad[6]/U0/NET2 ), 
        .Y(\pld_data_in[6] ));
    OR2A \u2/un1_addr_0_I_84  (.A(\program_addr[8] ), .B(\u2/rd[8] ), 
        .Y(\u2/ACT_LT4_E[8] ));
    OA1A \u1/u0/next_state_RNO_2[0]  (.A(
        \u1/u0/next_state_ns_0_a3_3_1[0] ), .B(\u1/u0/N_475 ), .C(
        \u1/u0/N_453 ), .Y(\u1/u0/next_state_ns_0_4[0] ));
    MX2 \u1/data_RNI18VC[7]  (.A(\u1/jtag_data[7] ), .B(
        \pld_data_in[7] ), .S(un1_pld_data), .Y(\program_addr[7] ));
    MX2 \pld_data_pad_RNO[10]  (.A(mote_tdo_c), .B(
        \program_table_data[10] ), .S(\pld_ctr_c_0[3] ), .Y(
        \pld_data_pad_RNO[10]_net_1 ));
    AO1C \u1/u0/data_out_RNO_1[4]  (.A(\u1/u0/N_298 ), .B(
        \u1/u0/data_out_35_0_0[4] ), .C(\u1/jtag_data_out[4] ), .Y(
        \u1/u0/data_out_m[4] ));
    AO1 \u1/u0/next_state_RNO[4]  (.A(\u1/u0/next_state_ns_0_a3_0[4] ), 
        .B(\u1/u0/N_438 ), .C(\u1/u0/next_state[4] ), .Y(
        \u1/u0/next_state_ns[4] ));
    DFN1C1 \u1/u0/tms/U1  (.D(\u1/u0/tms/Y ), .CLK(osc96m), .CLR(
        \u1/jtag_reset_net_1 ), .Q(jtag_tms));
    OA1 \u2/wd_RNO[4]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[4] ), .Y(\u2/wd_5[4] ));
    OR3A \u1/u0/data_out_RNO_1[12]  (.A(\u1/u0/tdo_m_3_0 ), .B(
        \u1/u0/N_385 ), .C(\u1/u0/N_475 ), .Y(\u1/u0/tdo_m_3_i ));
    DFN1C1 \u1/u0/next_state[0]/U1  (.D(\u1/u0/next_state[0]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_net_1 ), .Q(\u1/u0/next_state[0] )
        );
    DFN1E0C1 \u2/wd[9]  (.D(\u2/wd_5[9] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[9]_net_1 ));
    NOR3B \u1/u0/data_out_RNO_0[4]  (.A(\u1/u0/data_out_21[4] ), .B(
        \u1/u0/next_state_0[5] ), .C(\u1/u0/N_476 ), .Y(
        \u1/u0/data_out_21_m_1[4] ));
    OR3A \u1/u0/data_out_RNO_0[11]  (.A(\u1/u0/data_out_35_0_0[11] ), 
        .B(\u1/u0/N_290 ), .C(\u1/u0/N_298 ), .Y(\u1/u0/N_74 ));
    DFN1C1 \u2/waddr[0]  (.D(\u2/waddr_RNO[0]_net_1 ), .CLK(osc96m), 
        .CLR(\pld_ctr_c[0] ), .Q(\u2/waddr[0]_net_1 ));
    OR2 \u1/u0/data_out_RNO_1[5]  (.A(\u1/u0/next_state_d[30] ), .B(
        \u1/u0/data_out_18_i[5] ), .Y(\u1/u0/data_out_18_m[5] ));
    MX2 \u1/data_RNITVUC[5]  (.A(\u1/jtag_data[5] ), .B(
        \pld_data_in[5] ), .S(un1_pld_data), .Y(\program_addr[5] ));
    OA1 \u2/wd_RNO[6]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[6] ), .Y(\u2/wd_5[6] ));
    MX2 \u1/u0/next_state[4]/U0  (.A(\u1/u0/next_state[4] ), .B(
        \u1/u0/next_state_ns[4] ), .S(\u1/jtag_enable_net_1 ), .Y(
        \u1/u0/next_state[4]/Y ));
    AND3 \u2/un1_addr_0_I_8  (.A(\u2/DWACT_BL_EQUAL_0_E_1[0] ), .B(
        \u2/DWACT_BL_EQUAL_0_E_1[1] ), .C(\u2/DWACT_BL_EQUAL_0_E_1[2] )
        , .Y(\u2/DWACT_BL_EQUAL_0_DWACT_ANDTREE_E_0[0] ));
    OR3A \u1/u0/next_state_RNIKVU69[4]  (.A(
        \u1/u0/data_out_35_0_1_0[10] ), .B(\u1/u0/N_290 ), .C(
        \u1/u0/N_298 ), .Y(\u1/u0/N_73_1 ));
    NOR3B \u1/u0/data_out_RNO_2[9]  (.A(\u1/u0/N_392 ), .B(
        \u1/u0/N_288_i ), .C(\u1/u0/N_475 ), .Y(\u1/u0/N_359 ));
    OR2B \u1/u0/data_out_RNO_1[9]  (.A(\u1/u0/next_state_d[22] ), .B(
        mote_tdo_c), .Y(\u1/u0/tdo_m_0 ));
    AOI1A \u2/un1_addr_0_I_46  (.A(\program_addr[11] ), .B(\u2/rd[11] )
        , .C(\u2/ACT_LT4_E_0[5] ), .Y(\u2/ACT_LT4_E_0[6] ));
    NOR2A mote_tck_pad_RNO_0 (.A(\pld_ctr_c_0[3] ), .B(jtag_tck), .Y(
        jtag_tck_i_m));
    DFN1E1P1 \u1/jtag_reset_0  (.D(\u1/next_state[0]_net_1 ), .CLK(
        osc96m), .PRE(\pld_ctr_c[0] ), .E(\pld_ctr_c[3] ), .Q(
        \u1/jtag_reset_0_net_1 ));
    AO1C \u1/u0/data_out_RNO[7]  (.A(\u1/u0/data_out_RNO_0[7]_net_1 ), 
        .B(\u1/jtag_data_out[7] ), .C(\u1/u0/data_out_12_m[7] ), .Y(
        \u1/u0/data_out_35[7] ));
    NOR3C \u2/waddr_RNIENAJ[2]  (.A(\u2/waddr[0]_net_1 ), .B(
        \u2/waddr[1]_net_1 ), .C(\u2/waddr[2]_net_1 ), .Y(
        \u2/waddr_c2 ));
    NOR2B \u1/u0/tdi_RNO_7  (.A(\u1/u0/N_373_1 ), .B(\u1/u0/N_392 ), 
        .Y(\u1/u0/un1_next_state_5_i_a4_2_0 ));
    MX2 \u1/u0/data_out[10]/U0  (.A(\u1/jtag_data_out[10] ), .B(
        \u1/u0/data_out_35[10] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[10]/Y ));
    IOPAD_IN \pld_ctr_pad[4]/U0/U0  (.PAD(pld_ctr[4]), .Y(
        \pld_ctr_pad[4]/U0/NET1 ));
    NOR2A \u1/next_state_RNO[0]  (.A(\u1/jtag_done ), .B(
        \u1/next_state[0]_net_1 ), .Y(\u1/next_state_ns[0] ));
    IOPAD_TRI_U \pld_ctr_pad[1]/U0/U0  (.D(\pld_ctr_pad[1]/U0/NET1 ), 
        .E(\pld_ctr_pad[1]/U0/NET2 ), .PAD(pld_ctr[1]));
    DFN1E0C1 \u2/wd[10]  (.D(\u2/wd_5[10] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[10]_net_1 ));
    NOR2B \u2/result_addr_RNO[10]  (.A(\u2/rd[10] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[10] ));
    DFN1E1C1 \u1/next_state[0]  (.D(\u1/next_state_ns[0] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\pld_ctr_c[3] ), .Q(
        \u1/next_state[0]_net_1 ));
    OR2 \u1/u0/next_state_RNO_3[0]  (.A(\u1/u0/N_476 ), .B(
        \u1/u0/N_442 ), .Y(\u1/u0/next_state_ns_0_a3_0_0[0] ));
    IOPAD_BI_U \pld_data_pad[1]/U0/U0  (.D(\pld_data_pad[1]/U0/NET1 ), 
        .E(\pld_data_pad[1]/U0/NET2 ), .Y(\pld_data_pad[1]/U0/NET3 ), 
        .PAD(pld_data[1]));
    NOR2A \u2/next_state_RNITK97[0]  (.A(\u2/next_state[0]_net_1 ), .B(
        pc_ready), .Y(\u2/next_state_ns_i_a3_0_0[1] ));
    DFN1E1 \u1/data[11]  (.D(\u1/jtag_data_out[11] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\u1/jtag_data[11] ));
    DFN1C1 \u2/rwclk  (.D(\u2/rwclk_4 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .Q(\u2/rwclk_i ));
    IOPAD_TRI \mote_tck_pad/U0/U0  (.D(\mote_tck_pad/U0/NET1 ), .E(
        \mote_tck_pad/U0/NET2 ), .PAD(mote_tck));
    MX2 \u1/u0/next_state[0]/U0  (.A(\u1/u0/next_state[0] ), .B(
        \u1/u0/next_state_ns[0] ), .S(\u1/jtag_enable_net_1 ), .Y(
        \u1/u0/next_state[0]/Y ));
    OR2A \u2/un1_addr_0_I_31  (.A(\u2/rd[15] ), .B(\program_addr[15] ), 
        .Y(\u2/ACT_LT3_E[4] ));
    AO1B \u1/u0/data_out_RNO[9]  (.A(\u1/u0/N_72 ), .B(
        \u1/jtag_data_out[9] ), .C(\u1/u0/tdo_m_0 ), .Y(
        \u1/u0/data_out_35[9] ));
    OR2A \u2/un1_addr_0_I_93  (.A(\u2/rd[1] ), .B(\program_addr[1] ), 
        .Y(\u2/N_12 ));
    NOR3 \u1/u0/next_state_RNI1K2Q7[1]  (.A(\u1/u0/N_299 ), .B(
        \u1/u0/next_state_d[22] ), .C(\u1/u0/N_295 ), .Y(
        \u1/u0/N_69_1 ));
    NOR2A \u1/u0/next_state_0_RNIJGP7[5]  (.A(mote_tdo_c), .B(
        \u1/u0/next_state_0[5] ), .Y(\u1/u0/tdo_m_6_0 ));
    XAI1A \u1/u0/next_state_RNI9GT61[0]  (.A(\u1/u0/N_296 ), .B(
        \u1/u0/next_state[0] ), .C(\u1/u0/un1_tck55_1_0_a4_1_0 ), .Y(
        \u1/u0/N_366 ));
    OR2A mote_tdi_pad_RNO_0 (.A(\pld_ctr_c_0[3] ), .B(jtag_tdi), .Y(
        jtag_tdi_i_m));
    XOR2 \u1/u0/next_state_RNO_10[0]  (.A(\u1/u0/next_state[3] ), .B(
        \u1/u0/next_state[1] ), .Y(\u1/u0/N_445_i ));
    IOBI_IB_OB_EB \pld_data_pad[9]/U0/U1  (.D(\program_table_data[9] ), 
        .E(\pld_ctr_c[3] ), .YIN(\pld_data_pad[9]/U0/NET3 ), .DOUT(
        \pld_data_pad[9]/U0/NET1 ), .EOUT(\pld_data_pad[9]/U0/NET2 ), 
        .Y(\pld_data_in[9] ));
    MX2 \u1/u0/data_out[1]/U0  (.A(\u1/jtag_data_out[1] ), .B(
        \u1/u0/data_out_35[1] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[1]/Y ));
    ULSICC_INT INT_ULSICC_INSTANCE_0 (.USTDBY(GND), .LPENA(GND));
    OR3A \u1/u0/tdi_RNO_9  (.A(\u1/u0/N_408 ), .B(\u1/u0/N_385 ), .C(
        \u1/jtag_mode_net_1 ), .Y(\u1/u0/N_376 ));
    OR3B \u1/u0/next_state_RNI7UOC1[5]  (.A(\u1/jtag_enable_net_1 ), 
        .B(\u1/u0/N_397 ), .C(\u1/u0/N_294 ), .Y(\u1/u0/N_367 ));
    DFN1E1C1 \u2/result_addr[9]  (.D(\u2/result_addr_6[9] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[9] ));
    AOI1B \u1/u0/next_state_RNO_0[4]  (.A(\u1/u0/next_state[2] ), .B(
        \u1/jtag_mode_net_1 ), .C(\u1/u0/next_state[3] ), .Y(
        \u1/u0/next_state_ns_0_a3_0[4] ));
    NOR3C \u2/raddr_RNIVMAJ[2]  (.A(\u2/raddr[0]_net_1 ), .B(
        \u2/raddr[1]_net_1 ), .C(\u2/raddr[2]_net_1 ), .Y(\u2/N_33 ));
    DFN1C1 \u1/u0/next_state_0[5]/U1  (.D(\u1/u0/next_state_0[5]/Y ), 
        .CLK(osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/u0/next_state_0[5] ));
    MX2 \u1/u0/tms/U0  (.A(jtag_tms), .B(\u1/u0/tms_2 ), .S(
        \u1/jtag_enable_net_1 ), .Y(\u1/u0/tms/Y ));
    DFN1E0C1 \u2/wd[8]  (.D(\u2/wd_5[8] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[8]_net_1 ));
    AOI1A \u2/un1_addr_0_I_30  (.A(\u2/ACT_LT3_E[0] ), .B(
        \u2/ACT_LT3_E[1] ), .C(\u2/ACT_LT3_E[2] ), .Y(
        \u2/ACT_LT3_E[3] ));
    DFN1C1 \u1/u0/data_out[12]/U1  (.D(\u1/u0/data_out[12]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[12] ));
    NOR3A \u1/u0/data_out_RNO_3[4]  (.A(\u1/u0/N_360 ), .B(
        \u1/u0/N_305 ), .C(\u1/u0/N_398 ), .Y(
        \u1/u0/data_out_35_0_0[4] ));
    DFN1E1 \u1/data[9]  (.D(\u1/jtag_data_out[9] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\u1/jtag_data[9] ));
    OR2 \u1/u0/data_out_RNO_1[7]  (.A(\u1/u0/next_state_d_i[26] ), .B(
        \u1/u0/data_out_12_i[7] ), .Y(\u1/u0/data_out_12_m[7] ));
    XA1 \u2/raddr_RNO[1]  (.A(\u2/raddr[0]_net_1 ), .B(
        \u2/raddr[1]_net_1 ), .C(\u2/ren_2_sqmuxa ), .Y(\u2/N_191 ));
    OR3B \u1/u0/data_out_RNO_1[3]  (.A(\u1/u0/N_387 ), .B(
        \u1/u0/data_out_24_m_0[3] ), .C(\u1/u0/N_296 ), .Y(
        \u1/u0/data_out_24_m[3] ));
    DFN1C1 \u1/u0/data_out[11]/U1  (.D(\u1/u0/data_out[11]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[11] ));
    OR2A \u2/un1_addr_0_I_41  (.A(\u2/rd[10] ), .B(\program_addr[10] ), 
        .Y(\u2/ACT_LT4_E_0[1] ));
    DFN1E0C1 \u2/waddr[1]  (.D(\u2/waddr_n1 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/waddre ), .Q(\u2/waddr[1]_net_1 ));
    OR3C \u1/u0/next_state_RNO[2]  (.A(\u1/u0/N_463 ), .B(
        \u1/u0/N_462 ), .C(\u1/u0/N_461 ), .Y(\u1/u0/next_state_ns[2] )
        );
    NOR2B \u2/result_addr_RNO[9]  (.A(\u2/rd[9] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[9] ));
    OAI1 \u2/next_state_RNIJ8QTL[0]  (.A(\u2/next_state16 ), .B(
        \u2/un1_raddr_1_sqmuxa_0_a3_0 ), .C(\u2/N_168 ), .Y(
        \u2/un1_raddr_1_sqmuxa ));
    DFN1C1 \u1/u0/data_out[3]/U1  (.D(\u1/u0/data_out[3]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[3] ));
    CLKIO \pld_ctr_pad[0]/U0/U1  (.A(\pld_ctr_pad[0]/U0/NET1 ), .Y(
        \pld_ctr_c[0] ));
    DFN1C1 \u1/u0/done/U1  (.D(\u1/u0/done/Y ), .CLK(osc96m), .CLR(
        \u1/jtag_reset_net_1 ), .Q(\u1/jtag_done ));
    NOR2B \u2/waddr_RNI5FL61[5]  (.A(\u2/waddr_c4 ), .B(
        \u2/waddr[5]_net_1 ), .Y(\u2/waddr_c5 ));
    NOR2B \u1/u0/next_state_RNO_4[0]  (.A(jtag_tck), .B(
        \u1/u0/next_state[0] ), .Y(\u1/u0/next_state_ns_0_a3_2_0[0] ));
    NOR3A \u1/u0/data_out_RNO_2[14]  (.A(mote_tdo_c), .B(
        \u1/u0/next_state[4] ), .C(\u1/u0/next_state_0[5] ), .Y(
        \u1/u0/tdo_m_5_0 ));
    DFN1E1C1 \u2/result_addr[0]  (.D(\u2/result_addr_6[0] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[0] ));
    AOI1B \u1/u0/tdi_RNO_5  (.A(\u1/u0/next_state_0[5] ), .B(
        \u1/u0/next_state[3] ), .C(\u1/u0/N_439 ), .Y(
        \u1/u0/un1_next_state_5_i_0 ));
    OA1 \u1/u0/tdi_RNO  (.A(\u1/jtag_mode_net_1 ), .B(\u1/u0/N_421 ), 
        .C(\u1/u0/tdi_18k_0_a2_i_0 ), .Y(\u1/u0/N_285 ));
    NOR3A \u1/u0/data_out_RNO_3[2]  (.A(\u1/u0/N_362 ), .B(
        \u1/u0/N_305 ), .C(\u1/u0/N_398 ), .Y(
        \u1/u0/data_out_35_0_0[2] ));
    NOR2A \u2/un1_addr_0_I_40  (.A(\u2/rd[9] ), .B(\program_addr[9] ), 
        .Y(\u2/ACT_LT4_E_0[0] ));
    OR3A \u1/u0/next_state_RNIJ5F61_1[0]  (.A(\u1/u0/N_387 ), .B(
        \u1/u0/N_475 ), .C(\u1/u0/N_476 ), .Y(\u1/u0/next_state_d[30] )
        );
    DFN1E0C1 \u2/wd[5]  (.D(\u2/wd_5[5] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[5]_net_1 ));
    OR3B \u1/u0/tdi_RNO_6  (.A(\u1/u0/next_state_0[5] ), .B(
        \u1/u0/N_322_i ), .C(\u1/jtag_mode_net_1 ), .Y(\u1/u0/N_370 ));
    AO1 \u1/u0/next_state_RNIJ5F61[5]  (.A(
        \u1/u0/next_state_ns_0_a3_1[5] ), .B(\u1/u0/N_438 ), .C(
        \u1/u0/next_state[5] ), .Y(\u1/u0/next_state_ns[5] ));
    OR3B \u1/u0/data_out_RNO_4[4]  (.A(\u1/u0/next_state[5] ), .B(
        \u1/u0/N_388 ), .C(\u1/u0/next_state[0] ), .Y(\u1/u0/N_360 ));
    NOR3C \u1/u0/next_state_RNO_1[0]  (.A(\u1/u0/N_451 ), .B(
        \u1/u0/N_456 ), .C(\u1/u0/N_457_i ), .Y(
        \u1/u0/next_state_ns_0_1[0] ));
    MX2 \u1/u0/data_out[3]/U0  (.A(\u1/jtag_data_out[3] ), .B(
        \u1/u0/data_out_35[3] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[3]/Y ));
    OA1 \u2/wd_RNO[2]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[2] ), .Y(\u2/wd_5[2] ));
    NOR3A \u1/u0/next_state_RNIJ5F61_2[0]  (.A(\u1/u0/N_386 ), .B(
        \u1/u0/N_475 ), .C(\u1/u0/N_296 ), .Y(\u1/u0/next_state_d[18] )
        );
    OR2A \u2/un1_addr_0_I_94  (.A(\program_addr[2] ), .B(\u2/rd[2] ), 
        .Y(\u2/N_13 ));
    NOR3C \u2/u0/program_table_mem_R0C0_RNI89OP  (.A(
        \u2/u0/un1_rd_1_1 ), .B(\u2/u0/un1_rd_1_0 ), .C(
        \u2/u0/un1_rd_1_9 ), .Y(\u2/u0/un1_rd_1_12 ));
    XNOR2 \u2/waddr_RNO[0]  (.A(\u2/waddre ), .B(\u2/waddr[0]_net_1 ), 
        .Y(\u2/waddr_RNO[0]_net_1 ));
    AO1B \u1/u0/data_out_RNO[14]  (.A(\u1/u0/N_77 ), .B(
        \u1/jtag_data_out[14] ), .C(\u1/u0/tdo_m_5 ), .Y(
        \u1/u0/data_out_35[14] ));
    XNOR2 \u2/un1_addr_0_I_5  (.A(\program_addr[13] ), .B(\u2/rd[13] ), 
        .Y(\u2/DWACT_BL_EQUAL_0_E[4] ));
    MX2 \u1/u0/next_state[3]/U0  (.A(\u1/u0/next_state[3] ), .B(
        \u1/u0/N_433 ), .S(\u1/jtag_enable_net_1 ), .Y(
        \u1/u0/next_state[3]/Y ));
    NOR3C \u2/u0/program_table_mem_R0C0_RNI89OP_0  (.A(
        \u2/u0/un1_rd_1_5 ), .B(\u2/u0/un1_rd_1_4 ), .C(
        \u2/u0/un1_rd_1_11 ), .Y(\u2/u0/un1_rd_1_13 ));
    IOPAD_BI_U \pld_data_pad[7]/U0/U0  (.D(\pld_data_pad[7]/U0/NET1 ), 
        .E(\pld_data_pad[7]/U0/NET2 ), .Y(\pld_data_pad[7]/U0/NET3 ), 
        .PAD(pld_data[7]));
    RAM512X18 \u2/u0/program_table_mem_R0C0  (.RADDR8(AFLSDF_GND), 
        .RADDR7(\u2/raddr[7]_net_1 ), .RADDR6(\u2/raddr[6]_net_1 ), 
        .RADDR5(\u2/raddr[5]_net_1 ), .RADDR4(\u2/raddr[4]_net_1 ), 
        .RADDR3(\u2/raddr[3]_net_1 ), .RADDR2(\u2/raddr[2]_net_1 ), 
        .RADDR1(\u2/raddr[1]_net_1 ), .RADDR0(\u2/raddr[0]_net_1 ), 
        .WADDR8(AFLSDF_GND), .WADDR7(\u2/waddr[7]_net_1 ), .WADDR6(
        \u2/waddr[6]_net_1 ), .WADDR5(\u2/waddr[5]_net_1 ), .WADDR4(
        \u2/waddr[4]_net_1 ), .WADDR3(\u2/waddr[3]_net_1 ), .WADDR2(
        \u2/waddr[2]_net_1 ), .WADDR1(\u2/waddr[1]_net_1 ), .WADDR0(
        \u2/waddr[0]_net_1 ), .WD17(GND), .WD16(GND), .WD15(
        \u2/wd[15]_net_1 ), .WD14(\u2/wd[14]_net_1 ), .WD13(
        \u2/wd[13]_net_1 ), .WD12(\u2/wd[12]_net_1 ), .WD11(
        \u2/wd[11]_net_1 ), .WD10(\u2/wd[10]_net_1 ), .WD9(
        \u2/wd[9]_net_1 ), .WD8(\u2/wd[8]_net_1 ), .WD7(
        \u2/wd[7]_net_1 ), .WD6(\u2/wd[6]_net_1 ), .WD5(
        \u2/wd[5]_net_1 ), .WD4(\u2/wd[4]_net_1 ), .WD3(
        \u2/wd[3]_net_1 ), .WD2(\u2/wd[2]_net_1 ), .WD1(
        \u2/wd[1]_net_1 ), .WD0(\u2/wd[0]_net_1 ), .RW0(GND), .RW1(VCC)
        , .WW0(GND), .WW1(VCC), .PIPE(GND), .REN(\u2/WEBP ), .WEN(
        \u2/WEAP ), .RCLK(\u2/rwclk_net_1 ), .WCLK(\u2/rwclk_net_1 ), 
        .RESET(VCC), .RD17(), .RD16(), .RD15(\u2/rd[15] ), .RD14(
        \u2/rd[14] ), .RD13(\u2/rd[13] ), .RD12(\u2/rd[12] ), .RD11(
        \u2/rd[11] ), .RD10(\u2/rd[10] ), .RD9(\u2/rd[9] ), .RD8(
        \u2/rd[8] ), .RD7(\u2/rd[7] ), .RD6(\u2/rd[6] ), .RD5(
        \u2/rd[5] ), .RD4(\u2/rd[4] ), .RD3(\u2/rd[3] ), .RD2(
        \u2/rd[2] ), .RD1(\u2/rd[1] ), .RD0(\u2/rd[0] ));
    NOR3A \u1/u0/data_out_RNO_0[5]  (.A(\u1/u0/next_state_d_i[26] ), 
        .B(\u1/u0/N_295 ), .C(\u1/u0/data_out_35_0_1_0[5] ), .Y(
        \u1/u0/data_out_RNO_0[5]_net_1 ));
    AOI1A \u2/un1_addr_0_I_49  (.A(\u2/ACT_LT4_E_0[7] ), .B(
        \u2/ACT_LT4_E_0[8] ), .C(\u2/ACT_LT4_E_0[5] ), .Y(
        \u2/ACT_LT4_E_0[10] ));
    NOR2B \u1/next_state_RNIFD51_0[1]  (.A(\u1/next_state[1]_net_1 ), 
        .B(\u1/next_state[0]_net_1 ), .Y(\u1/N_70 ));
    OR3A \u1/u0/next_state_RNI8V101[4]  (.A(\u1/u0/N_386 ), .B(
        \u1/u0/next_state[4] ), .C(\u1/u0/N_288_i ), .Y(
        \u1/u0/N_381_i ));
    IOBI_IB_OB_EB \pld_data_pad[3]/U0/U1  (.D(\program_table_data[3] ), 
        .E(\pld_ctr_c[3] ), .YIN(\pld_data_pad[3]/U0/NET3 ), .DOUT(
        \pld_data_pad[3]/U0/NET1 ), .EOUT(\pld_data_pad[3]/U0/NET2 ), 
        .Y(\pld_data_in[3] ));
    AO1C \u1/u0/data_out_RNO[5]  (.A(\u1/u0/data_out_RNO_0[5]_net_1 ), 
        .B(\u1/jtag_data_out[5] ), .C(\u1/u0/data_out_18_m[5] ), .Y(
        \u1/u0/data_out_35[5] ));
    OA1 mote_tdi_pad_RNO (.A(\pld_data_in[9] ), .B(un3_pld_data_i), .C(
        jtag_tdi_i_m), .Y(mote_tdi_iv_i_0));
    AO1B \u1/u0/data_out_RNO[1]  (.A(\u1/u0/N_64 ), .B(
        \u1/jtag_data_out[1] ), .C(\u1/u0/data_out_30_m[1] ), .Y(
        \u1/u0/data_out_35[1] ));
    OR2A \u1/u0/next_state_RNIDOMP1[5]  (.A(\u1/u0/N_417 ), .B(
        \u1/u0/next_state_d[40] ), .Y(\u1/u0/N_292 ));
    DFN1E0C1 \u2/wd[12]  (.D(\u2/wd_5[12] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[12]_net_1 ));
    NOR3B \u1/u0/next_state_RNO_2[1]  (.A(\u1/u0/N_437_i_i_0 ), .B(
        \u1/u0/next_state[0] ), .C(\u1/u0/N_475 ), .Y(\u1/u0/N_459 ));
    IOBI_IB_OB_EB \pld_data_pad[11]/U0/U1  (.D(
        \program_table_data[11] ), .E(\pld_ctr_c_0[3] ), .YIN(
        \pld_data_pad[11]/U0/NET3 ), .DOUT(\pld_data_pad[11]/U0/NET1 ), 
        .EOUT(\pld_data_pad[11]/U0/NET2 ), .Y(\pld_data_in[11] ));
    OR3A \u1/u0/data_out_RNO_1[14]  (.A(\u1/u0/tdo_m_5_0 ), .B(
        \u1/u0/N_385 ), .C(\u1/u0/N_296 ), .Y(\u1/u0/tdo_m_5 ));
    AND3 \u2/un1_addr_0_I_9  (.A(\u2/DWACT_BL_EQUAL_0_E_0[3] ), .B(
        \u2/DWACT_BL_EQUAL_0_E[4] ), .C(\u2/DWACT_BL_EQUAL_0_E[5] ), 
        .Y(\u2/DWACT_BL_EQUAL_0_DWACT_ANDTREE_E[1] ));
    OR2A \u1/u0/next_state_RNIDV101[5]  (.A(\u1/u0/N_439 ), .B(
        \u1/u0/next_state_d[40] ), .Y(\u1/u0/un1_tck55_1_0_o2_1_0 ));
    NOR2B \u2/raddr_RNIE6701[4]  (.A(\u2/raddr[4]_net_1 ), .B(
        \u2/N_34 ), .Y(\u2/N_35 ));
    XNOR2 \u2/un1_addr_0_I_2  (.A(\program_addr[10] ), .B(\u2/rd[10] ), 
        .Y(\u2/DWACT_BL_EQUAL_0_E_1[1] ));
    OR2A \u2/done_RNO  (.A(\u2/ren_2_sqmuxa ), .B(\u2/done_1_sqmuxa ), 
        .Y(\u2/un1_ren_2_sqmuxa ));
    OA1 \u2/wd_RNO[11]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[11] ), .Y(\u2/wd_5[11] ));
    DFN1E0C1 \u2/waddr[4]  (.D(\u2/waddr_n4 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/waddre ), .Q(\u2/waddr[4]_net_1 ));
    MX2 \u1/u0/data_out_RNO_0[6]  (.A(\u1/jtag_data_out[6] ), .B(
        mote_tdo_c), .S(\u1/jtag_mode_net_1 ), .Y(
        \u1/u0/data_out_15[6] ));
    MX2 \u1/data_RNIRRUC[4]  (.A(\u1/jtag_data[4] ), .B(
        \pld_data_in[4] ), .S(un1_pld_data), .Y(\program_addr[4] ));
    MX2 \u1/u0/data_out[11]/U0  (.A(\u1/jtag_data_out[11] ), .B(
        \u1/u0/data_out_35[11] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[11]/Y ));
    NOR2 \u1/u0/tck_RNO_0  (.A(\u1/u0/N_298 ), .B(\u1/u0/N_295 ), .Y(
        \u1/u0/tck_RNO_0_net_1 ));
    OR3A \u2/next_state_RNIDJ71[0]  (.A(\u2/next_state[0]_net_1 ), .B(
        \pld_ctr_c[4] ), .C(\u2/next_state[1]_net_1 ), .Y(\u2/waddre ));
    AO1B \u1/u0/data_out_RNO[12]  (.A(\u1/u0/N_75 ), .B(
        \u1/jtag_data_out[12] ), .C(\u1/u0/tdo_m_3_i ), .Y(
        \u1/u0/data_out_35[12] ));
    NOR2B \u2/raddr_RNIMUOP[3]  (.A(\u2/raddr[3]_net_1 ), .B(\u2/N_33 )
        , .Y(\u2/N_34 ));
    AO1D \u1/u0/next_state_RNO_0[1]  (.A(
        \u1/u0/next_state_ns_i_a3_0[1] ), .B(\u1/u0/N_437_i_i_0 ), .C(
        \u1/u0/N_438 ), .Y(\u1/u0/next_state_ns_i_0[1] ));
    AO1 \u2/un1_addr_0_I_57  (.A(\u2/DWACT_CMPLE_PO0_DWACT_COMP0_E[1] )
        , .B(\u2/DWACT_CMPLE_PO0_DWACT_COMP0_E[2] ), .C(
        \u2/DWACT_CMPLE_PO0_DWACT_COMP0_E[0] ), .Y(
        \u2/DWACT_COMP0_E[0] ));
    NOR2B \u1/u0/data_out_RNO_2[10]  (.A(mote_tdo_c), .B(\u1/u0/N_388 )
        , .Y(\u1/u0/tdo_m_1_0 ));
    NOR2 \u2/next_state_RNO_1[1]  (.A(\pld_ctr_c[4] ), .B(
        \u2/next_state[0]_net_1 ), .Y(\u2/next_state_ns_i_o3_0[1] ));
    AOI1A \u2/un1_addr_0_I_86  (.A(\u2/ACT_LT4_E[3] ), .B(
        \u2/ACT_LT4_E[6] ), .C(\u2/ACT_LT4_E[10] ), .Y(
        \u2/DWACT_CMPLE_PO2_DWACT_COMP0_E[0] ));
    XNOR2 \u2/un1_addr_0_I_62  (.A(\program_addr[5] ), .B(\u2/rd[5] ), 
        .Y(\u2/DWACT_BL_EQUAL_0_E[0] ));
    NOR2B \u2/result_addr_RNO[13]  (.A(\u2/rd[13] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[13] ));
    DFN1C1 \u1/u0/next_state[4]/U1  (.D(\u1/u0/next_state[4]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_net_1 ), .Q(\u1/u0/next_state[4] )
        );
    NOR2B osc6m_pad_RNO (.A(usb_connect_c), .B(osc6m_buff), .Y(osc6m_c)
        );
    IOBI_IB_OB_EB \pld_data_pad[13]/U0/U1  (.D(
        \program_table_data[13] ), .E(\pld_ctr_c_0[3] ), .YIN(
        \pld_data_pad[13]/U0/NET3 ), .DOUT(\pld_data_pad[13]/U0/NET1 ), 
        .EOUT(\pld_data_pad[13]/U0/NET2 ), .Y(\pld_data_in[13] ));
    AND3 \u2/un1_addr_0_I_10  (.A(\u2/DWACT_BL_EQUAL_0_E[6] ), .B(
        \u2/DWACT_BL_EQUAL_0_DWACT_ANDTREE_E[1] ), .C(
        \u2/DWACT_BL_EQUAL_0_DWACT_ANDTREE_E_0[0] ), .Y(
        \u2/DWACT_COMP0_E[1] ));
    DFN1E1 \u1/data[5]  (.D(\u1/jtag_data_out[5] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\u1/jtag_data[5] ));
    IOPAD_BI_U \pld_data_pad[15]/U0/U0  (.D(\pld_data_pad[15]/U0/NET1 )
        , .E(\pld_data_pad[15]/U0/NET2 ), .Y(
        \pld_data_pad[15]/U0/NET3 ), .PAD(pld_data[15]));
    XOR2 \u2/rwclk_RNO  (.A(\u2/next_state[1]_net_1 ), .B(
        \u2/next_state[0]_net_1 ), .Y(\u2/rwclk_4 ));
    NOR3C \u1/u0/next_state_RNIRI7J[1]  (.A(\u1/u0/next_state[3] ), .B(
        \u1/u0/next_state[5] ), .C(\u1/u0/next_state[1] ), .Y(
        \u1/u0/next_state_d[42] ));
    MX2 \u1/data_RNILFUC[1]  (.A(\u1/jtag_data[1] ), .B(
        \pld_data_in[1] ), .S(un1_pld_data), .Y(\program_addr[1] ));
    DFN1E0C1 \u2/wd[0]  (.D(\u2/wd_5[0] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[0]_net_1 ));
    NOR3A \u1/u0/next_state_RNIRI7J[2]  (.A(\u1/u0/next_state[4] ), .B(
        \u1/u0/next_state[2] ), .C(\u1/u0/next_state[3] ), .Y(
        \u1/u0/next_state_ns_0_a3_1[5] ));
    XNOR2 \u2/un1_addr_0_I_7  (.A(\program_addr[12] ), .B(\u2/rd[12] ), 
        .Y(\u2/DWACT_BL_EQUAL_0_E_0[3] ));
    AO1C \u2/un1_addr_0_I_97  (.A(\u2/rd[1] ), .B(\program_addr[1] ), 
        .C(\u2/N_14 ), .Y(\u2/N_16 ));
    NOR2A mote_tms_pad_RNO_0 (.A(\pld_ctr_c_0[3] ), .B(jtag_tms), .Y(
        jtag_tms_i_m));
    IOPAD_BI_U \pld_data_pad[4]/U0/U0  (.D(\pld_data_pad[4]/U0/NET1 ), 
        .E(\pld_data_pad[4]/U0/NET2 ), .Y(\pld_data_pad[4]/U0/NET3 ), 
        .PAD(pld_data[4]));
    NOR2A \u2/un1_addr_0_I_27  (.A(\u2/rd[13] ), .B(\program_addr[13] )
        , .Y(\u2/ACT_LT3_E[0] ));
    AO1B \u1/u0/data_out_RNO[15]  (.A(\u1/u0/tdo_m_6_0 ), .B(
        \u1/u0/N_420 ), .C(\u1/u0/data_out_m[15] ), .Y(
        \u1/u0/data_out_35[15] ));
    DFN1E1P1 \u1/jtag_reset  (.D(\u1/next_state[0]_net_1 ), .CLK(
        osc96m), .PRE(\pld_ctr_c[0] ), .E(\pld_ctr_c[3] ), .Q(
        \u1/jtag_reset_net_1 ));
    DFN1C1 \u1/u0/data_out[10]/U1  (.D(\u1/u0/data_out[10]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[10] ));
    IOPAD_IN \usb_connect_pad/U0/U0  (.PAD(usb_connect), .Y(
        \usb_connect_pad/U0/NET1 ));
    DFN1E0C1 \u2/waddr[5]  (.D(\u2/waddr_n5 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/waddre ), .Q(\u2/waddr[5]_net_1 ));
    NOR2B \u2/result_addr_RNO[14]  (.A(\u2/rd[14] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[14] ));
    XNOR2 \u2/un1_addr_0_I_19  (.A(\program_addr[13] ), .B(\u2/rd[13] )
        , .Y(\u2/DWACT_BL_EQUAL_0_E_0[0] ));
    AO1B \u1/u0/data_out_RNO[10]  (.A(\u1/u0/N_73 ), .B(
        \u1/jtag_data_out[10] ), .C(\u1/u0/tdo_m_1 ), .Y(
        \u1/u0/data_out_35[10] ));
    MX2 \pld_data_pad_RNID8I9[10]  (.A(\jtag_data[10] ), .B(
        \pld_data_in[10] ), .S(un1_pld_data), .Y(\program_addr[10] ));
    OR2A \u1/u0/next_state_RNILCQC[5]  (.A(\u1/u0/next_state[4] ), .B(
        \u1/u0/next_state[5] ), .Y(\u1/u0/N_475 ));
    NOR3A \u2/u0/program_table_mem_R0C0_RNIK4SC_0  (.A(
        \u2/u0/un1_rd_1_7 ), .B(\u2/rd[13] ), .C(\u2/rd[12] ), .Y(
        \u2/u0/un1_rd_1_11 ));
    OR3A \u1/u0/data_out_RNO_1[10]  (.A(\u1/u0/tdo_m_1_0 ), .B(
        \u1/u0/N_385 ), .C(\u1/u0/N_475 ), .Y(\u1/u0/tdo_m_1 ));
    MX2 \u1/data_RNINJUC[2]  (.A(\u1/jtag_data[2] ), .B(
        \pld_data_in[2] ), .S(un1_pld_data), .Y(\program_addr[2] ));
    AO1C \u1/u0/data_out_RNO_1[2]  (.A(\u1/u0/N_298 ), .B(
        \u1/u0/data_out_35_0_0[2] ), .C(\u1/jtag_data_out[2] ), .Y(
        \u1/u0/data_out_m[2] ));
    IOBI_IB_OB_EB \pld_data_pad[8]/U0/U1  (.D(\program_table_data[8] ), 
        .E(\pld_ctr_c[3] ), .YIN(\pld_data_pad[8]/U0/NET3 ), .DOUT(
        \pld_data_pad[8]/U0/NET1 ), .EOUT(\pld_data_pad[8]/U0/NET2 ), 
        .Y(\pld_data_in[8] ));
    DFN1E0C1 \u2/waddr[2]  (.D(\u2/waddr_n2 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/waddre ), .Q(\u2/waddr[2]_net_1 ));
    NOR3B \u1/u0/next_state_RNO_1[1]  (.A(\u1/u0/next_state_0[5] ), .B(
        \u1/u0/next_state[0] ), .C(\u1/u0/next_state_ns_i_a3_1_0[1] ), 
        .Y(\u1/u0/N_460 ));
    DFN1C1 \u1/u0/next_state[3]/U1  (.D(\u1/u0/next_state[3]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_net_1 ), .Q(\u1/u0/next_state[3] )
        );
    OAI1 \u1/u0/next_state_RNIKTQC2[5]  (.A(\u1/u0/next_state_d[18] ), 
        .B(\u1/u0/un1_tck55_1_0_o2_1_0 ), .C(\u1/jtag_enable_net_1 ), 
        .Y(\u1/u0/N_364 ));
    IOPAD_BI_U \pld_data_pad[5]/U0/U0  (.D(\pld_data_pad[5]/U0/NET1 ), 
        .E(\pld_data_pad[5]/U0/NET2 ), .Y(\pld_data_pad[5]/U0/NET3 ), 
        .PAD(pld_data[5]));
    OR2A \u1/u0/next_state_RNIFCQC_0[1]  (.A(\u1/u0/next_state[1] ), 
        .B(\u1/u0/next_state[2] ), .Y(\u1/u0/N_296 ));
    MX2 \u1/data_RNI5GVC[9]  (.A(\u1/jtag_data[9] ), .B(
        \pld_data_in[9] ), .S(un1_pld_data), .Y(\program_addr[9] ));
    IOPAD_IN_U \pld_ctr_pad[0]/U0/U0  (.PAD(pld_ctr[0]), .Y(
        \pld_ctr_pad[0]/U0/NET1 ));
    DFN1E1C1 \u1/jtag_mode  (.D(\u1/N_83_i ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\pld_ctr_c[3] ), .Q(\u1/jtag_mode_net_1 ));
    IOPAD_BI_U \pld_data_pad[0]/U0/U0  (.D(\pld_data_pad[0]/U0/NET1 ), 
        .E(\pld_data_pad[0]/U0/NET2 ), .Y(\pld_data_pad[0]/U0/NET3 ), 
        .PAD(pld_data[0]));
    AO1B \u1/u0/data_out_RNO[4]  (.A(\u1/u0/data_out_21_m_1[4] ), .B(
        \u1/u0/N_392 ), .C(\u1/u0/data_out_m[4] ), .Y(
        \u1/u0/data_out_35[4] ));
    OR2A \u2/un1_addr_0_I_77  (.A(\u2/rd[6] ), .B(\program_addr[6] ), 
        .Y(\u2/ACT_LT4_E[1] ));
    IOPAD_TRI \mcu_osc_pad/U0/U0  (.D(\mcu_osc_pad/U0/NET1 ), .E(
        \mcu_osc_pad/U0/NET2 ), .PAD(mcu_osc));
    DFI1E0C1 \u2/wen  (.D(\pld_ctr_c[4] ), .CLK(osc96m), .E(\u2/N_156 )
        , .CLR(\pld_ctr_c[0] ), .QN(\u2/WEAP ));
    NOR2A \u2/un1_addr_0_I_81  (.A(\u2/rd[8] ), .B(\program_addr[8] ), 
        .Y(\u2/ACT_LT4_E[5] ));
    MX2 \u1/u0/data_out[5]/U0  (.A(\u1/jtag_data_out[5] ), .B(
        \u1/u0/data_out_35[5] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[5]/Y ));
    OR2A \u1/u0/next_state_RNIFCQC[0]  (.A(\u1/u0/next_state[3] ), .B(
        \u1/u0/next_state[0] ), .Y(\u1/u0/N_385 ));
    AO1B \u1/u0/data_out_RNO[2]  (.A(\u1/u0/data_out_27_m_1[2] ), .B(
        \u1/u0/N_392 ), .C(\u1/u0/data_out_m[2] ), .Y(
        \u1/u0/data_out_35[2] ));
    NOR2B \u2/result_addr_RNO[0]  (.A(\u2/rd[0] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[0] ));
    AO1 \u1/u0/next_state_RNO_2[2]  (.A(\u1/u0/N_439 ), .B(
        \u1/u0/N_294 ), .C(\u1/u0/N_441 ), .Y(\u1/u0/N_461 ));
    MX2 \u1/u0/next_state[5]/U0  (.A(\u1/u0/next_state[5] ), .B(
        \u1/u0/next_state_ns[5] ), .S(\u1/jtag_enable_net_1 ), .Y(
        \u1/u0/next_state[5]/Y ));
    MX2 \u1/u0/data_out[7]/U0  (.A(\u1/jtag_data_out[7] ), .B(
        \u1/u0/data_out_35[7] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[7]/Y ));
    NOR2 \u2/u0/program_table_mem_R0C0_RNIA2E6_1  (.A(\u2/rd[8] ), .B(
        \u2/rd[9] ), .Y(\u2/u0/un1_rd_1_4 ));
    IOTRI_OB_EB \mote_tck_pad/U0/U1  (.D(mote_tck_iv), .E(VCC), .DOUT(
        \mote_tck_pad/U0/NET1 ), .EOUT(\mote_tck_pad/U0/NET2 ));
    NOR3A \u1/u0/next_state_RNIJ5F61[1]  (.A(\u1/u0/N_386 ), .B(
        \u1/u0/N_475 ), .C(\u1/u0/N_391 ), .Y(\u1/u0/next_state_d[22] )
        );
    AO1B \u1/u0/data_out_RNO[3]  (.A(\u1/u0/N_66 ), .B(
        \u1/jtag_data_out[3] ), .C(\u1/u0/data_out_24_m[3] ), .Y(
        \u1/u0/data_out_35[3] ));
    NOR3B \u1/next_state_RNI2591[1]  (.A(\pld_ctr_c_0[3] ), .B(
        \u1/N_70 ), .C(\pld_ctr_c[0] ), .Y(\u1/data_1_sqmuxa ));
    DFN1C1 \u1/u0/data_out[14]/U1  (.D(\u1/u0/data_out[14]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[14] ));
    DFN1E1C1 \u2/result_addr[6]  (.D(\u2/result_addr_6[6] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[6] ));
    DFN1P1 \u1/u0/tdi/U1  (.D(\u1/u0/tdi/Y ), .CLK(osc96m), .PRE(
        \u1/jtag_reset_net_1 ), .Q(jtag_tdi));
    AOI1 \u2/raddr_RNO_0[6]  (.A(\u2/raddr[5]_net_1 ), .B(\u2/N_35 ), 
        .C(\u2/raddr[6]_net_1 ), .Y(\u2/N_44 ));
    DFN1E0C1 \u2/wd[15]  (.D(\u2/wd_5[15] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[15]_net_1 ));
    MX2 \u1/data_RNIPNUC[3]  (.A(\u1/jtag_data[3] ), .B(
        \pld_data_in[3] ), .S(un1_pld_data), .Y(\program_addr[3] ));
    OR2 \u2/next_state_RNIHD51_0[0]  (.A(\u2/next_state[1]_net_1 ), .B(
        \u2/next_state[0]_net_1 ), .Y(\u2/next_state_i[0] ));
    AO1C \u1/u0/data_out_RNO_1[0]  (.A(\u1/u0/N_295 ), .B(
        \u1/u0/data_out_35_0_0[0] ), .C(\u1/jtag_data_out[0] ), .Y(
        \u1/u0/data_out_m[0] ));
    OR2A \u1/u0/next_state_RNO_3[1]  (.A(\u1/u0/next_state[0] ), .B(
        \u1/u0/next_state[4] ), .Y(\u1/u0/next_state_ns_i_a3_0[1] ));
    OR3B \u1/u0/next_state_RNIJGDJ3[4]  (.A(\u1/u0/N_381_i ), .B(
        \u1/u0/N_382 ), .C(\u1/u0/next_state_d[40] ), .Y(
        \u1/u0/data_out_35_0_1_0[5] ));
    AO1C \u1/u0/data_out_RNO_1[6]  (.A(\u1/u0/next_state_d[24] ), .B(
        \u1/u0/N_69_1 ), .C(\u1/jtag_data_out[6] ), .Y(
        \u1/u0/data_out_m_i[6] ));
    IOBI_IB_OB_EB \pld_data_pad[12]/U0/U1  (.D(
        \program_table_data[12] ), .E(\pld_ctr_c_0[3] ), .YIN(
        \pld_data_pad[12]/U0/NET3 ), .DOUT(\pld_data_pad[12]/U0/NET1 ), 
        .EOUT(\pld_data_pad[12]/U0/NET2 ), .Y(\pld_data_in[12] ));
    IOPAD_TRI \mote_tms_pad/U0/U0  (.D(\mote_tms_pad/U0/NET1 ), .E(
        \mote_tms_pad/U0/NET2 ), .PAD(mote_tms));
    XNOR2 \u2/un1_addr_0_I_63  (.A(\program_addr[6] ), .B(\u2/rd[6] ), 
        .Y(\u2/DWACT_BL_EQUAL_0_E[1] ));
    OA1 \u2/un1_addr_0_I_103  (.A(\u2/N_21 ), .B(\u2/N_20 ), .C(
        \u2/N_19 ), .Y(\u2/DWACT_CMPLE_PO2_DWACT_COMP0_E[2] ));
    NOR3A \u1/u0/next_state_RNO_8[0]  (.A(\u1/u0/N_288_i ), .B(
        \u1/u0/next_state[3] ), .C(jtag_tck), .Y(
        \u1/u0/next_state_ns_0_a3_3_1[0] ));
    DFN1E1 \u1/data[0]  (.D(\u1/jtag_data_out[0] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\u1/jtag_data[0] ));
    OR3 \u1/u0/data_out_RNO_0[1]  (.A(\u1/u0/N_298 ), .B(\u1/u0/N_383 )
        , .C(\u1/u0/N_363 ), .Y(\u1/u0/N_64 ));
    OR2B \u1/u0/next_state_RNIUOKP[0]  (.A(\u1/u0/N_392 ), .B(
        \u1/u0/N_288_i ), .Y(\u1/u0/N_380 ));
    DFN1C1 \u1/u0/data_out[13]/U1  (.D(\u1/u0/data_out[13]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[13] ));
    XA1 \u2/raddr_RNO[4]  (.A(\u2/N_34 ), .B(\u2/raddr[4]_net_1 ), .C(
        \u2/ren_2_sqmuxa ), .Y(\u2/N_11 ));
    DFN1E0C1 \u2/wd[4]  (.D(\u2/wd_5[4] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[4]_net_1 ));
    IOPAD_BI_U \pld_data_pad[2]/U0/U0  (.D(\pld_data_pad[2]/U0/NET1 ), 
        .E(\pld_data_pad[2]/U0/NET2 ), .Y(\pld_data_pad[2]/U0/NET3 ), 
        .PAD(pld_data[2]));
    IOBI_IB_OB_EB \pld_data_pad[1]/U0/U1  (.D(\program_table_data[1] ), 
        .E(\pld_ctr_c_0[3] ), .YIN(\pld_data_pad[1]/U0/NET3 ), .DOUT(
        \pld_data_pad[1]/U0/NET1 ), .EOUT(\pld_data_pad[1]/U0/NET2 ), 
        .Y(\pld_data_in[1] ));
    DFN1E1 \u1/data[10]  (.D(\u1/jtag_data_out[10] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\jtag_data[10] ));
    AOI1 \u2/next_state_RNO[1]  (.A(\u2/next_state_ns_i_a3_0_0[1] ), 
        .B(\u2/next_state16 ), .C(\u2/N_185 ), .Y(
        \u2/next_state_RNO[1]_net_1 ));
    NOR2B \u1/u0/next_state_RNIJCQC_0[4]  (.A(\u1/u0/next_state[4] ), 
        .B(\u1/u0/next_state[3] ), .Y(\u1/u0/N_471 ));
    IOBI_IB_OB_EB \pld_data_pad[10]/U0/U1  (.D(
        \pld_data_pad_RNO[10]_net_1 ), .E(
        \pld_data_pad_RNO_0[10]_net_1 ), .YIN(
        \pld_data_pad[10]/U0/NET3 ), .DOUT(\pld_data_pad[10]/U0/NET1 ), 
        .EOUT(\pld_data_pad[10]/U0/NET2 ), .Y(\pld_data_in[10] ));
    NOR2 \u1/u0/next_state_RNIT43D[5]  (.A(\u1/u0/next_state[5] ), .B(
        \u1/jtag_mode_net_1 ), .Y(\u1/u0/N_373_1 ));
    IOIN_IB \mote_tdo_pad/U0/U1  (.YIN(\mote_tdo_pad/U0/NET1 ), .Y(
        mote_tdo_c));
    DFN1E1C1 \u1/ready  (.D(\u1/N_70 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\pld_ctr_c[3] ), .Q(pc_ready));
    MX2 \u1/u0/data_out_RNO_2[4]  (.A(\u1/jtag_data_out[4] ), .B(
        mote_tdo_c), .S(\u1/jtag_mode_net_1 ), .Y(
        \u1/u0/data_out_21[4] ));
    OR2A \u2/un1_addr_0_I_96  (.A(\u2/rd[4] ), .B(\program_addr[4] ), 
        .Y(\u2/N_15 ));
    OR2A \u2/un1_addr_0_I_48  (.A(\program_addr[12] ), .B(\u2/rd[12] ), 
        .Y(\u2/ACT_LT4_E_0[8] ));
    OR3B \u1/u0/next_state_RNI6MSP4[4]  (.A(\u1/u0/N_381_i ), .B(
        \u1/u0/N_382 ), .C(\u1/u0/N_292 ), .Y(\u1/u0/N_298 ));
    NOR2B \u2/result_addr_RNO[1]  (.A(\u2/rd[1] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[1] ));
    MX2 \u1/u0/data_out[6]/U0  (.A(\u1/jtag_data_out[6] ), .B(
        \u1/u0/data_out_35[6] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[6]/Y ));
    NOR3 \u1/u0/next_state_RNO[1]  (.A(\u1/u0/next_state_ns_i_0[1] ), 
        .B(\u1/u0/N_460 ), .C(\u1/u0/N_459 ), .Y(\u1/u0/N_430 ));
    MX2 \u1/data_RNI3CVC[8]  (.A(\u1/jtag_data[8] ), .B(
        \pld_data_in[8] ), .S(un1_pld_data), .Y(\program_addr[8] ));
    NOR2A \u2/raddr_RNO[0]  (.A(\u2/ren_2_sqmuxa ), .B(
        \u2/raddr[0]_net_1 ), .Y(\u2/raddr_n0 ));
    OA1A \u1/u0/data_out_RNO_2[11]  (.A(\u1/u0/N_413 ), .B(
        \u1/u0/N_288_i ), .C(\u1/u0/N_421 ), .Y(
        \u1/u0/data_out_35_0_0[11] ));
    AO1B \u1/u0/data_out_RNO[8]  (.A(\u1/u0/next_state_d[24] ), .B(
        mote_tdo_c), .C(\u1/u0/data_out_m[8] ), .Y(
        \u1/u0/data_out_35[8] ));
    DFN1C1 \u1/u0/next_state[2]/U1  (.D(\u1/u0/next_state[2]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_net_1 ), .Q(\u1/u0/next_state[2] )
        );
    XNOR2 \u2/un1_addr_0_I_64  (.A(\program_addr[7] ), .B(\u2/rd[7] ), 
        .Y(\u2/DWACT_BL_EQUAL_0_E[2] ));
    DFN1E0C1 \u2/wd[14]  (.D(\u2/wd_5[14] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[14]_net_1 ));
    DFN1C1 \u1/u0/next_state[1]/U1  (.D(\u1/u0/next_state[1]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_net_1 ), .Q(\u1/u0/next_state[1] )
        );
    NOR2B \u1/u0/next_state_RNI354J[0]  (.A(\u1/jtag_enable_net_1 ), 
        .B(\u1/u0/N_387 ), .Y(\u1/u0/un1_tck55_1_0_a4_0_0 ));
    DFN1E1C1 \u2/raddr[1]  (.D(\u2/N_191 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/raddre ), .Q(\u2/raddr[1]_net_1 ));
    XOR2 \u2/waddr_RNO[6]  (.A(\u2/waddr_c5 ), .B(\u2/waddr[6]_net_1 ), 
        .Y(\u2/waddr_n6 ));
    NOR2A \u2/un1_addr_0_I_76  (.A(\u2/rd[5] ), .B(\program_addr[5] ), 
        .Y(\u2/ACT_LT4_E[0] ));
    MX2 \u1/u0/next_state_0[5]/U0  (.A(\u1/u0/next_state_0[5] ), .B(
        \u1/u0/next_state_ns[5] ), .S(\u1/jtag_enable_net_1 ), .Y(
        \u1/u0/next_state_0[5]/Y ));
    OA1C \u1/u0/tck_RNO  (.A(\u1/jtag_enable_net_1 ), .B(
        \u1/u0/tck_RNO_0_net_1 ), .C(\u1/u0/tck_89_i_0 ), .Y(
        \u1/u0/tck_RNO_net_1 ));
    NOR2 \u1/u0/next_state_RNIPI7J_1[4]  (.A(\u1/u0/next_state[4] ), 
        .B(\u1/u0/N_391 ), .Y(\u1/u0/N_408 ));
    OAI1 \u1/u0/data_out_RNO_0[13]  (.A(\u1/u0/N_76_1 ), .B(
        \u1/u0/N_420 ), .C(\u1/jtag_data_out[13] ), .Y(
        \u1/u0/data_out_m[13] ));
    AXO6 \u1/u0/tck_RNO_1  (.A(\u1/u0/next_state_d[42] ), .B(jtag_tck), 
        .C(\u1/jtag_enable_net_1 ), .Y(\u1/u0/tck_89_i_0 ));
    NOR2B \u2/wd_RNO[15]  (.A(\program_addr[15] ), .B(\pld_ctr_c[4] ), 
        .Y(\u2/wd_5[15] ));
    NOR3A \u1/u0/next_state_0_RNIKTLJ[5]  (.A(\u1/jtag_enable_net_1 ), 
        .B(\u1/u0/next_state[4] ), .C(\u1/u0/next_state_0[5] ), .Y(
        \u1/u0/un1_tck55_1_0_a4_1_0 ));
    OR2B \u1/u0/data_out_RNO_1[11]  (.A(\u1/u0/next_state_d[18] ), .B(
        mote_tdo_c), .Y(\u1/u0/tdo_m_2 ));
    XNOR2 \u2/un1_addr_0_I_6  (.A(\program_addr[14] ), .B(\u2/rd[14] ), 
        .Y(\u2/DWACT_BL_EQUAL_0_E[5] ));
    DFN1E1 \u1/data[8]  (.D(\u1/jtag_data_out[8] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\u1/jtag_data[8] ));
    NOR2B \u2/result_addr_RNO[8]  (.A(\u2/rd[8] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[8] ));
    DFN1E0C1 \u2/wd[11]  (.D(\u2/wd_5[11] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[11]_net_1 ));
    AOI1A \u2/un1_addr_0_I_50  (.A(\u2/ACT_LT4_E_0[3] ), .B(
        \u2/ACT_LT4_E_0[6] ), .C(\u2/ACT_LT4_E_0[10] ), .Y(
        \u2/DWACT_CMPLE_PO0_DWACT_COMP0_E[2] ));
    XNOR2 \u2/un1_addr_0_I_21  (.A(\program_addr[15] ), .B(\u2/rd[15] )
        , .Y(\u2/DWACT_BL_EQUAL_0_E_0[2] ));
    NOR3A \u1/u0/next_state_RNIJ5F61_0[1]  (.A(\u1/u0/N_392 ), .B(
        \u1/u0/N_475 ), .C(\u1/u0/N_391 ), .Y(\u1/u0/next_state_d[24] )
        );
    IOBI_IB_OB_EB \pld_data_pad[7]/U0/U1  (.D(\program_table_data[7] ), 
        .E(\pld_ctr_c[3] ), .YIN(\pld_data_pad[7]/U0/NET3 ), .DOUT(
        \pld_data_pad[7]/U0/NET1 ), .EOUT(\pld_data_pad[7]/U0/NET2 ), 
        .Y(\pld_data_in[7] ));
    OA1B mote_tck_pad_RNO (.A(\pld_data_in[11] ), .B(un3_pld_data_i), 
        .C(jtag_tck_i_m), .Y(mote_tck_iv));
    AX1C \u2/waddr_RNO[7]  (.A(\u2/waddr[6]_net_1 ), .B(\u2/waddr_c5 ), 
        .C(\u2/waddr[7]_net_1 ), .Y(\u2/waddr_n7 ));
    DFN1C1 \u1/u0/data_out[6]/U1  (.D(\u1/u0/data_out[6]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[6] ));
    XNOR2 \u2/un1_addr_0_I_20  (.A(\program_addr[14] ), .B(\u2/rd[14] )
        , .Y(\u2/DWACT_BL_EQUAL_0_E_0[1] ));
    OR3B \u1/u0/next_state_RNIJ5F61_1[1]  (.A(\u1/u0/N_387 ), .B(
        \u1/u0/N_388 ), .C(\u1/u0/N_475 ), .Y(
        \u1/u0/next_state_d_i[26] ));
    AO1 \u2/un1_addr_0_I_110  (.A(
        \u2/DWACT_CMPLE_PO2_DWACT_COMP0_E[1] ), .B(
        \u2/DWACT_CMPLE_PO2_DWACT_COMP0_E[2] ), .C(
        \u2/DWACT_CMPLE_PO2_DWACT_COMP0_E[0] ), .Y(
        \u2/DWACT_COMP0_E[2] ));
    MX2 \u1/u0/data_out[14]/U0  (.A(\u1/jtag_data_out[14] ), .B(
        \u1/u0/data_out_35[14] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[14]/Y ));
    DFN1C1 \u1/u0/data_out[7]/U1  (.D(\u1/u0/data_out[7]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_net_1 ), .Q(\u1/jtag_data_out[7] )
        );
    NOR2A \u2/un1_addr_0_I_45  (.A(\u2/rd[12] ), .B(\program_addr[12] )
        , .Y(\u2/ACT_LT4_E_0[5] ));
    NOR2B \u2/next_state_RNO_0[0]  (.A(\u2/next_state[1]_net_1 ), .B(
        pc_ready), .Y(\u2/next_state_ns_0_a3_1_0[0] ));
    OA1 \u2/wd_RNO[0]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[0] ), .Y(\u2/wd_5[0] ));
    DFN1E1 \u1/data[7]  (.D(\u1/jtag_data_out[7] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\u1/jtag_data[7] ));
    MX2 \pld_data_pad_RNIJKI9[13]  (.A(\jtag_data[13] ), .B(
        \pld_data_in[13] ), .S(un1_pld_data), .Y(\program_addr[13] ));
    OA1 \u2/wd_RNO[10]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[10] ), .Y(\u2/wd_5[10] ));
    NOR2 \u2/next_state_RNIDJ71_0[0]  (.A(\u2/next_state_i[0] ), .B(
        \pld_ctr_c[4] ), .Y(\u2/N_172 ));
    MX2A \u2/next_state_RNO_1[0]  (.A(\pld_ctr_c[4] ), .B(
        \u2/next_state[0]_net_1 ), .S(\u2/next_state[1]_net_1 ), .Y(
        \u2/next_state_ns_0_0[0] ));
    DFN1E1C1 \u2/result_addr[1]  (.D(\u2/result_addr_6[1] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[1] ));
    DFN1E1C1 \u2/result_addr[7]  (.D(\u2/result_addr_6[7] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[7] ));
    NOR2B \u1/u0/next_state_RNILI7J[2]  (.A(\u1/u0/next_state[2] ), .B(
        \u1/u0/N_438 ), .Y(\u1/u0/N_443 ));
    NOR2A \u1/u0/next_state_RNIPI7J_0[4]  (.A(\u1/u0/next_state[4] ), 
        .B(\u1/u0/N_385 ), .Y(\u1/u0/N_413 ));
    OA1 \u2/wd_RNO[5]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[5] ), .Y(\u2/wd_5[5] ));
    OR2A \u1/u0/next_state_RNIUOKP[1]  (.A(\u1/u0/N_386 ), .B(
        \u1/u0/N_391 ), .Y(\u1/u0/N_379 ));
    AO1C \u2/un1_addr_0_I_99  (.A(\program_addr[2] ), .B(\u2/rd[2] ), 
        .C(\u2/N_12 ), .Y(\u2/N_18 ));
    XA1A \u2/raddr_RNO[7]  (.A(\u2/N_37 ), .B(\u2/raddr[7]_net_1 ), .C(
        \u2/ren_2_sqmuxa ), .Y(\u2/N_31_i_0 ));
    XA1A \u2/un1_addr_0_I_67  (.A(\program_addr[8] ), .B(\u2/rd[8] ), 
        .C(\u2/DWACT_BL_EQUAL_0_DWACT_ANDTREE_E[0] ), .Y(
        \u2/DWACT_CMPLE_PO2_DWACT_COMP0_E[1] ));
    AND2A \u2/un1_addr_0_I_29  (.A(\u2/rd[14] ), .B(\program_addr[14] )
        , .Y(\u2/ACT_LT3_E[2] ));
    OR2 \u1/u0/next_state_RNIHU302[4]  (.A(\u1/u0/next_state_d[38] ), 
        .B(\u1/u0/N_363 ), .Y(\u1/u0/N_290 ));
    OR2A \u2/un1_addr_0_I_100  (.A(\program_addr[4] ), .B(\u2/rd[4] ), 
        .Y(\u2/N_19 ));
    AO1 \u1/u0/data_out_RNO_0[12]  (.A(\u1/u0/N_413 ), .B(
        \u1/u0/N_388 ), .C(\u1/u0/N_73_1 ), .Y(\u1/u0/N_75 ));
    NOR2B \u2/wd_RNO[7]  (.A(\program_addr[7] ), .B(\pld_ctr_c[4] ), 
        .Y(\u2/wd_5[7] ));
    AND2A \u2/un1_addr_0_I_32  (.A(\u2/rd[15] ), .B(\program_addr[15] )
        , .Y(\u2/ACT_LT3_E[5] ));
    NOR2 \u1/u0/next_state_RNIDCQC_0[1]  (.A(\u1/u0/next_state[1] ), 
        .B(\u1/u0/next_state[0] ), .Y(\u1/u0/N_438 ));
    AX1E \u2/raddr_RNO_0[2]  (.A(\u2/raddr[0]_net_1 ), .B(
        \u2/raddr[1]_net_1 ), .C(\u2/raddr[2]_net_1 ), .Y(
        \u2/raddr_n2_0_i_0 ));
    NOR2B \u1/u0/data_out_RNO_2[3]  (.A(\u1/u0/next_state[5] ), .B(
        \u1/u0/N_397 ), .Y(\u1/u0/N_361 ));
    DFN1E1C1 \u2/result_addr[15]  (.D(\u2/result_addr_6[15] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[15] ));
    OR3A \u1/u0/next_state_RNO_0[2]  (.A(\u1/u0/N_442 ), .B(
        \u1/u0/next_state[1] ), .C(\u1/u0/N_439 ), .Y(\u1/u0/N_463 ));
    NOR3C \u1/u0/data_out_RNO_2[0]  (.A(\u1/u0/N_381_i ), .B(
        \u1/u0/N_382 ), .C(\u1/u0/N_417 ), .Y(
        \u1/u0/data_out_35_0_0[0] ));
    NOR2B \u1/u0/data_out_RNO_3[3]  (.A(\u1/u0/next_state_0[5] ), .B(
        \u1/u0/data_out_24[3] ), .Y(\u1/u0/data_out_24_m_0[3] ));
    XNOR2 \u1/u0/next_state_0_RNI5BPJ[5]  (.A(\u1/u0/next_state_0[5] ), 
        .B(\u1/u0/N_288_i ), .Y(\u1/u0/N_314_i ));
    NOR2B \u1/u0/next_state_RNI9V101[5]  (.A(\u1/u0/N_414 ), .B(
        \u1/u0/N_387 ), .Y(\u1/u0/next_state_d[38] ));
    OR2B \u1/u0/data_out_RNO_1[1]  (.A(\u1/u0/next_state_d[38] ), .B(
        \u1/u0/data_out_30[1] ), .Y(\u1/u0/data_out_30_m[1] ));
    OR2B \u2/next_state_RNIIJU7_0[0]  (.A(\u2/N_172 ), .B(pc_ready), 
        .Y(\u2/N_168 ));
    IOBI_IB_OB_EB \pld_data_pad[4]/U0/U1  (.D(\program_table_data[4] ), 
        .E(\pld_ctr_c[3] ), .YIN(\pld_data_pad[4]/U0/NET3 ), .DOUT(
        \pld_data_pad[4]/U0/NET1 ), .EOUT(\pld_data_pad[4]/U0/NET2 ), 
        .Y(\pld_data_in[4] ));
    IOPAD_BI_U \pld_data_pad[11]/U0/U0  (.D(\pld_data_pad[11]/U0/NET1 )
        , .E(\pld_data_pad[11]/U0/NET2 ), .Y(
        \pld_data_pad[11]/U0/NET3 ), .PAD(pld_data[11]));
    MX2C \u1/u0/data_out_RNO_2[5]  (.A(\u1/jtag_data_out[5] ), .B(
        mote_tdo_c), .S(\u1/jtag_mode_net_1 ), .Y(
        \u1/u0/data_out_18_i[5] ));
    NOR2B \u2/result_addr_RNO[12]  (.A(\u2/rd[12] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[12] ));
    IOBI_IB_OB_EB \pld_data_pad[14]/U0/U1  (.D(
        \program_table_data[14] ), .E(\pld_ctr_c_0[3] ), .YIN(
        \pld_data_pad[14]/U0/NET3 ), .DOUT(\pld_data_pad[14]/U0/NET1 ), 
        .EOUT(\pld_data_pad[14]/U0/NET2 ), .Y(\pld_data_in[14] ));
    DFN1E1 \u1/data[3]  (.D(\u1/jtag_data_out[3] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\u1/jtag_data[3] ));
    IOIN_IB \usb_connect_pad/U0/U1  (.YIN(\usb_connect_pad/U0/NET1 ), 
        .Y(usb_connect_c));
    AO1B \u2/next_state_RNO[0]  (.A(\u2/next_state_ns_0_a3_1_0[0] ), 
        .B(\u2/next_state16 ), .C(\u2/next_state_ns_0_0[0] ), .Y(
        \u2/next_state_ns[0] ));
    MX2 \u1/u0/data_out_RNO_0[0]  (.A(\u1/jtag_data_out[0] ), .B(
        mote_tdo_c), .S(\u1/jtag_mode_net_1 ), .Y(
        \u1/u0/data_out_33[0] ));
    XOR2 \u2/waddr_RNO[1]  (.A(\u2/waddr[1]_net_1 ), .B(
        \u2/waddr[0]_net_1 ), .Y(\u2/waddr_n1 ));
    AOI1A \u2/un1_addr_0_I_79  (.A(\u2/ACT_LT4_E[0] ), .B(
        \u2/ACT_LT4_E[1] ), .C(\u2/ACT_LT4_E[2] ), .Y(
        \u2/ACT_LT4_E[3] ));
    AND2A \u2/un1_addr_0_I_42  (.A(\u2/rd[10] ), .B(\program_addr[10] )
        , .Y(\u2/ACT_LT4_E_0[2] ));
    MX2 \u1/data_RNIJBUC[0]  (.A(\u1/jtag_data[0] ), .B(
        \pld_data_in[0] ), .S(un1_pld_data), .Y(\program_addr[0] ));
    MX2 \u1/u0/data_out[9]/U0  (.A(\u1/jtag_data_out[9] ), .B(
        \u1/u0/data_out_35[9] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[9]/Y ));
    NOR2B \u2/result_addr_RNO[4]  (.A(\u2/rd[4] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[4] ));
    MX2 \u1/u0/data_out[2]/U0  (.A(\u1/jtag_data_out[2] ), .B(
        \u1/u0/data_out_35[2] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[2]/Y ));
    AO1 \u2/u0/program_table_mem_R0C0_RNIG7MKL  (.A(
        \u2/u0/un1_rd_1_13 ), .B(\u2/u0/un1_rd_1_12 ), .C(\u2/I_115 ), 
        .Y(\u2/next_state16 ));
    DFN1E0C1 \u2/wd[3]  (.D(\u2/wd_5[3] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[3]_net_1 ));
    AO1C \u2/un1_addr_0_I_101  (.A(\program_addr[3] ), .B(\u2/rd[3] ), 
        .C(\u2/N_15 ), .Y(\u2/N_20 ));
    DFN1E1 \u1/data[13]  (.D(\u1/jtag_data_out[13] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\jtag_data[13] ));
    IOBI_IB_OB_EB \pld_data_pad[5]/U0/U1  (.D(\program_table_data[5] ), 
        .E(\pld_ctr_c[3] ), .YIN(\pld_data_pad[5]/U0/NET3 ), .DOUT(
        \pld_data_pad[5]/U0/NET1 ), .EOUT(\pld_data_pad[5]/U0/NET2 ), 
        .Y(\pld_data_in[5] ));
    AO1D \u1/u0/tms_RNO  (.A(\u1/u0/next_state[2] ), .B(\u1/u0/N_439 ), 
        .C(\u1/u0/N_414 ), .Y(\u1/u0/tms_2 ));
    OR2 \u1/u0/next_state_RNIPMQP3[0]  (.A(\u1/u0/N_383 ), .B(
        \u1/u0/N_290 ), .Y(\u1/u0/N_295 ));
    IOPAD_BI_U \pld_data_pad[13]/U0/U0  (.D(\pld_data_pad[13]/U0/NET1 )
        , .E(\pld_data_pad[13]/U0/NET2 ), .Y(
        \pld_data_pad[13]/U0/NET3 ), .PAD(pld_data[13]));
    IOBI_IB_OB_EB \pld_data_pad[0]/U0/U1  (.D(\program_table_data[0] ), 
        .E(\pld_ctr_c_0[3] ), .YIN(\pld_data_pad[0]/U0/NET3 ), .DOUT(
        \pld_data_pad[0]/U0/NET1 ), .EOUT(\pld_data_pad[0]/U0/NET2 ), 
        .Y(\pld_data_in[0] ));
    XA1 \u2/raddr_RNO[3]  (.A(\u2/N_33 ), .B(\u2/raddr[3]_net_1 ), .C(
        \u2/ren_2_sqmuxa ), .Y(\u2/N_9 ));
    DFN1E1C1 \u2/raddr[3]  (.D(\u2/N_9 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/raddre ), .Q(\u2/raddr[3]_net_1 ));
    OA1 \u2/wd_RNO[8]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[8] ), .Y(\u2/wd_5[8] ));
    DFN1C1 \u1/u0/data_out[5]/U1  (.D(\u1/u0/data_out[5]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[5] ));
    OR3C \u1/u0/next_state_RNI8NV79[0]  (.A(\u1/u0/un1_tck55_1_0_2 ), 
        .B(\u1/u0/un1_tck55_1_0_1 ), .C(\u1/u0/N_364 ), .Y(
        \u1/u0/un1_tck55_1 ));
    DFN1E1 \u1/data[15]  (.D(\u1/jtag_data_out[15] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\jtag_data[15] ));
    NOR3A \u1/u0/data_out_RNO_0[7]  (.A(\u1/u0/next_state_d[30] ), .B(
        \u1/u0/N_295 ), .C(\u1/u0/data_out_35_0_1_0[5] ), .Y(
        \u1/u0/data_out_RNO_0[7]_net_1 ));
    OAI1 \u1/u0/next_state_RNILBSC1[5]  (.A(\u1/u0/N_397 ), .B(
        \u1/u0/N_419 ), .C(\u1/u0/next_state[5] ), .Y(\u1/u0/N_421 ));
    IOPAD_TRI \osc6m_pad/U0/U0  (.D(\osc6m_pad/U0/NET1 ), .E(
        \osc6m_pad/U0/NET2 ), .PAD(osc6m));
    MX2 \u1/u0/data_out_RNO_2[1]  (.A(\u1/jtag_data_out[1] ), .B(
        mote_tdo_c), .S(\u1/jtag_mode_net_1 ), .Y(
        \u1/u0/data_out_30[1] ));
    OR2 \pld_ctr_pad_RNIM34[2]  (.A(\pld_ctr_c[4] ), .B(\pld_ctr_c[2] )
        , .Y(un1_pld_data));
    OA1A \u2/un1_addr_0_I_102  (.A(\u2/N_16 ), .B(\u2/N_18 ), .C(
        \u2/N_17 ), .Y(\u2/N_21 ));
    OR2 \u1/u0/next_state_RNIJCQC[4]  (.A(\u1/u0/next_state[4] ), .B(
        \u1/u0/next_state[3] ), .Y(\u1/u0/N_439 ));
    DFN1E0C1 \u2/waddr[3]  (.D(\u2/waddr_n3 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/waddre ), .Q(\u2/waddr[3]_net_1 ));
    DFN1E1 \u1/data[12]  (.D(\u1/jtag_data_out[12] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\jtag_data[12] ));
    OA1A \u1/u0/tdi_RNO_2  (.A(\u1/u0/un1_next_state_5_i_a4_2_0 ), .B(
        \u1/u0/N_296 ), .C(\u1/u0/N_372 ), .Y(
        \u1/u0/un1_next_state_5_i_2 ));
    NOR2B \u2/result_addr_RNO[2]  (.A(\u2/rd[2] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[2] ));
    AO1B \u1/u0/next_state_0_RNI69I02[5]  (.A(\u1/u0/N_380 ), .B(
        \u1/u0/N_379 ), .C(\u1/u0/un1_tck55_1_0_a4_3_0 ), .Y(
        \u1/u0/N_368 ));
    NOR2A \u1/u0/next_state_RNIQI7J_0[5]  (.A(\u1/u0/next_state[5] ), 
        .B(\u1/u0/N_391 ), .Y(\u1/u0/N_414 ));
    MX2 \u1/u0/done/U0  (.A(\u1/jtag_done ), .B(
        \u1/u0/next_state_d[42] ), .S(\u1/jtag_enable_net_1 ), .Y(
        \u1/u0/done/Y ));
    OR3 \u1/u0/next_state_RNO_9[0]  (.A(\u1/u0/N_288_i ), .B(jtag_tck), 
        .C(\u1/u0/N_294 ), .Y(\u1/u0/N_453 ));
    OR2A \pld_data_pad_RNO_0[10]  (.A(un1_pld_data), .B(
        \pld_ctr_c_0[3] ), .Y(\pld_data_pad_RNO_0[10]_net_1 ));
    AO1 \u1/u0/next_state_RNIHU302[5]  (.A(\u1/u0/N_380 ), .B(
        \u1/u0/N_379 ), .C(\u1/u0/N_475 ), .Y(\u1/u0/N_382 ));
    NOR2 \u2/u0/program_table_mem_R0C0_RNIA2E6  (.A(\u2/rd[0] ), .B(
        \u2/rd[1] ), .Y(\u2/u0/un1_rd_1_0 ));
    OR3 \u1/u0/data_out_RNO_0[9]  (.A(\u1/u0/N_299 ), .B(\u1/u0/N_359 )
        , .C(\u1/u0/N_295 ), .Y(\u1/u0/N_72 ));
    NOR2B \u1/u0/next_state_RNI0PKP[5]  (.A(\u1/u0/next_state[5] ), .B(
        \u1/u0/N_419 ), .Y(\u1/u0/N_398 ));
    AOI1 \u1/u0/next_state_RNO[3]  (.A(
        \u1/u0/next_state_ns_i_a3_1_1[3] ), .B(\u1/u0/N_443 ), .C(
        \u1/u0/next_state_ns_i_0[3] ), .Y(\u1/u0/N_433 ));
    OR3A \u1/u0/data_out_RNO_4[2]  (.A(\u1/u0/next_state[5] ), .B(
        \u1/u0/next_state[0] ), .C(\u1/u0/N_476 ), .Y(\u1/u0/N_362 ));
    XOR2 \u1/u0/next_state_RNIFCQC[1]  (.A(\u1/u0/next_state[2] ), .B(
        \u1/u0/next_state[1] ), .Y(\u1/u0/N_288_i ));
    DFN1E1C1 \u2/result_addr[5]  (.D(\u2/result_addr_6[5] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[5] ));
    OR2B \u1/u0/next_state_RNO_1[2]  (.A(\u1/u0/next_state[2] ), .B(
        \u1/u0/N_441 ), .Y(\u1/u0/N_462 ));
    NOR2B \u2/result_addr_RNO[15]  (.A(\u2/rd[15] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[15] ));
    DFN1C1 \u1/u0/next_state[5]/U1  (.D(\u1/u0/next_state[5]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_net_1 ), .Q(\u1/u0/next_state[5] )
        );
    OAI1 \u2/next_state_RNIJ8QTL_0[0]  (.A(\u2/next_state16 ), .B(
        \u2/un1_raddr_1_sqmuxa_0_a3_0 ), .C(\u2/ren_2_sqmuxa ), .Y(
        \u2/raddre ));
    DFN1C1 \u1/u0/data_out[2]/U1  (.D(\u1/u0/data_out[2]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[2] ));
    IOPAD_BI_U \pld_data_pad[6]/U0/U0  (.D(\pld_data_pad[6]/U0/NET1 ), 
        .E(\pld_data_pad[6]/U0/NET2 ), .Y(\pld_data_pad[6]/U0/NET3 ), 
        .PAD(pld_data[6]));
    OA1 \u2/wd_RNO[9]  (.A(pc_ready), .B(\pld_ctr_c[4] ), .C(
        \program_addr[9] ), .Y(\u2/wd_5[9] ));
    AOI1A \u2/un1_addr_0_I_33  (.A(\u2/ACT_LT3_E[3] ), .B(
        \u2/ACT_LT3_E[4] ), .C(\u2/ACT_LT3_E[5] ), .Y(
        \u2/DWACT_CMPLE_PO0_DWACT_COMP0_E[0] ));
    AND3 \u2/un1_addr_0_I_66  (.A(\u2/DWACT_BL_EQUAL_0_E[0] ), .B(
        \u2/DWACT_BL_EQUAL_0_E[1] ), .C(\u2/DWACT_BL_EQUAL_0_E[2] ), 
        .Y(\u2/DWACT_BL_EQUAL_0_DWACT_ANDTREE_E[0] ));
    IOIN_IB \pld_ctr_pad[3]/U0/U1  (.YIN(\pld_ctr_pad[3]/U0/NET1 ), .Y(
        \pld_ctr_c[3] ));
    MX2 \u1/u0/data_out[8]/U0  (.A(\u1/jtag_data_out[8] ), .B(
        \u1/u0/data_out_35[8] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[8]/Y ));
    XOR2 \u2/waddr_RNO[3]  (.A(\u2/waddr_c2 ), .B(\u2/waddr[3]_net_1 ), 
        .Y(\u2/waddr_n3 ));
    DFN1E1 \u1/data[14]  (.D(\u1/jtag_data_out[14] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\jtag_data[14] ));
    DFN1P1 \u1/u0/tck  (.D(\u1/u0/tck_RNO_net_1 ), .CLK(osc96m), .PRE(
        \u1/jtag_reset_net_1 ), .Q(jtag_tck));
    OR3C \u1/u0/next_state_RNO[0]  (.A(\u1/u0/next_state_ns_0_2[0] ), 
        .B(\u1/u0/next_state_ns_0_1[0] ), .C(
        \u1/u0/next_state_ns_0_4[0] ), .Y(\u1/u0/next_state_ns[0] ));
    NOR2A \u1/u0/next_state_RNIQI7J[5]  (.A(\u1/u0/next_state[5] ), .B(
        \u1/u0/N_385 ), .Y(\u1/u0/next_state_d[40] ));
    IOBI_IB_OB_EB \pld_data_pad[2]/U0/U1  (.D(\program_table_data[2] ), 
        .E(\pld_ctr_c[3] ), .YIN(\pld_data_pad[2]/U0/NET3 ), .DOUT(
        \pld_data_pad[2]/U0/NET1 ), .EOUT(\pld_data_pad[2]/U0/NET2 ), 
        .Y(\pld_data_in[2] ));
    CLKINT \u2/rwclk_RNIO117  (.A(\u2/rwclk_i ), .Y(\u2/rwclk_net_1 ));
    DFN1C1 \u1/u0/data_out[0]/U1  (.D(\u1/u0/data_out[0]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[0] ));
    OR3 \u1/u0/data_out_RNO_0[3]  (.A(\u1/u0/N_305 ), .B(\u1/u0/N_361 )
        , .C(\u1/u0/N_298 ), .Y(\u1/u0/N_66 ));
    DFN1E1C1 \u2/result_addr[10]  (.D(\u2/result_addr_6[10] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[10] ));
    NOR2 \u1/u0/next_state_RNIFCQC_2[0]  (.A(\u1/u0/next_state[3] ), 
        .B(\u1/u0/next_state[0] ), .Y(\u1/u0/N_392 ));
    OA1 \u1/u0/tdi_RNO_3  (.A(\u1/jtag_mode_net_1 ), .B(\u1/u0/N_417 ), 
        .C(\u1/u0/N_376 ), .Y(\u1/u0/tdi_18k_0_a2_i_0 ));
    DFN1C1 \u1/u0/data_out[15]/U1  (.D(\u1/u0/data_out[15]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_0_net_1 ), .Q(
        \u1/jtag_data_out[15] ));
    INV \u1/jtag_enable_RNO  (.A(\u1/next_state[0]_net_1 ), .Y(
        \u1/next_state_i[0] ));
    NOR3C \u2/waddr_RNI77701[4]  (.A(\u2/waddr[3]_net_1 ), .B(
        \u2/waddr_c2 ), .C(\u2/waddr[4]_net_1 ), .Y(\u2/waddr_c4 ));
    MX2 \u1/u0/next_state[2]/U0  (.A(\u1/u0/next_state[2] ), .B(
        \u1/u0/next_state_ns[2] ), .S(\u1/jtag_enable_net_1 ), .Y(
        \u1/u0/next_state[2]/Y ));
    DFN1E1C1 \u1/jtag_enable  (.D(\u1/next_state_i[0] ), .CLK(osc96m), 
        .CLR(\pld_ctr_c[0] ), .E(\pld_ctr_c[3] ), .Q(
        \u1/jtag_enable_net_1 ));
    OR3B \u1/u0/next_state_RNO_6[0]  (.A(\u1/u0/next_state[3] ), .B(
        \u1/u0/next_state_0[5] ), .C(jtag_tck), .Y(\u1/u0/N_456 ));
    DFN1C1 \u1/u0/data_out[9]/U1  (.D(\u1/u0/data_out[9]/Y ), .CLK(
        osc96m), .CLR(\u1/jtag_reset_net_1 ), .Q(\u1/jtag_data_out[9] )
        );
    AOI1A \u2/un1_addr_0_I_85  (.A(\u2/ACT_LT4_E[7] ), .B(
        \u2/ACT_LT4_E[8] ), .C(\u2/ACT_LT4_E[5] ), .Y(
        \u2/ACT_LT4_E[10] ));
    IOTRI_OB_EB \mote_tms_pad/U0/U1  (.D(mote_tms_iv), .E(VCC), .DOUT(
        \mote_tms_pad/U0/NET1 ), .EOUT(\mote_tms_pad/U0/NET2 ));
    NOR3A \u2/u0/program_table_mem_R0C0_RNIK4SC  (.A(
        \u2/u0/un1_rd_1_3 ), .B(\u2/rd[5] ), .C(\u2/rd[4] ), .Y(
        \u2/u0/un1_rd_1_9 ));
    XNOR2 \u1/u0/tdi_RNO_10  (.A(\u1/u0/next_state[0] ), .B(
        \u1/u0/N_288_i ), .Y(\u1/u0/N_322_i ));
    DFN1E0C1 \u2/wd[1]  (.D(\u2/wd_5[1] ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/N_156 ), .Q(\u2/wd[1]_net_1 ));
    MX2 \u1/u0/data_out[12]/U0  (.A(\u1/jtag_data_out[12] ), .B(
        \u1/u0/data_out_35[12] ), .S(\u1/u0/un1_tck55_1 ), .Y(
        \u1/u0/data_out[12]/Y ));
    AOI1A \u2/un1_addr_0_I_43  (.A(\u2/ACT_LT4_E_0[0] ), .B(
        \u2/ACT_LT4_E_0[1] ), .C(\u2/ACT_LT4_E_0[2] ), .Y(
        \u2/ACT_LT4_E_0[3] ));
    DFN1E1 \u1/data[4]  (.D(\u1/jtag_data_out[4] ), .CLK(osc96m), .E(
        \u1/data_1_sqmuxa ), .Q(\u1/jtag_data[4] ));
    DFN1E1C1 \u2/result_addr[2]  (.D(\u2/result_addr_6[2] ), .CLK(
        osc96m), .CLR(\pld_ctr_c[0] ), .E(\u2/un1_raddr_1_sqmuxa ), .Q(
        \program_table_data[2] ));
    NOR3C \u1/u0/tdi_RNO_1  (.A(\u1/u0/N_371 ), .B(
        \u1/u0/un1_next_state_5_i_0 ), .C(\u1/u0/N_370 ), .Y(
        \u1/u0/un1_next_state_5_i_3 ));
    DFN1E1C1 \u2/raddr[5]  (.D(\u2/N_27 ), .CLK(osc96m), .CLR(
        \pld_ctr_c[0] ), .E(\u2/raddre ), .Q(\u2/raddr[5]_net_1 ));
    NOR2B \u2/result_addr_RNO[7]  (.A(\u2/rd[7] ), .B(
        \u2/next_state_i[0] ), .Y(\u2/result_addr_6[7] ));
    OR3 \u1/u0/data_out_RNO_0[14]  (.A(\u1/u0/N_298 ), .B(
        \u1/u0/N_383 ), .C(\u1/u0/next_state_d[38] ), .Y(\u1/u0/N_77 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule

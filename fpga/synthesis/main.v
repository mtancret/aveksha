`timescale 1 ns/100 ps
// Version: 9.0 9.0.0.15


module clocks(
       clocks_VCC,
       clocks_GND,
       osc96m_i,
       mcu_osc_c,
       osc6m,
       osc48m_c
    );
input  clocks_VCC;
input  clocks_GND;
output osc96m_i;
output mcu_osc_c;
output osc6m;
input  osc48m_c;

    wire CLKAP, Core_LOCK, Core_YB, Core_YC, GND, VCC, GND_net_1, 
        VCC_net_1;
    
    VCC VCC_i_0 (.Y(VCC_net_1));
    PLL #( .VCOFREQUENCY(96.000000) )  Core (.CLKA(CLKAP), .EXTFB(
        clocks_GND), .POWERDOWN(clocks_VCC), .GLA(osc6m), .LOCK(
        Core_LOCK), .GLB(mcu_osc_c), .YB(Core_YB), .GLC(osc96m_i), .YC(
        Core_YC), .OADIV0(clocks_VCC), .OADIV1(clocks_VCC), .OADIV2(
        clocks_VCC), .OADIV3(clocks_VCC), .OADIV4(clocks_GND), .OAMUX0(
        clocks_GND), .OAMUX1(clocks_GND), .OAMUX2(clocks_VCC), 
        .DLYGLA0(clocks_GND), .DLYGLA1(clocks_GND), .DLYGLA2(
        clocks_GND), .DLYGLA3(clocks_GND), .DLYGLA4(clocks_GND), 
        .OBDIV0(clocks_VCC), .OBDIV1(clocks_VCC), .OBDIV2(clocks_GND), 
        .OBDIV3(clocks_VCC), .OBDIV4(clocks_GND), .OBMUX0(clocks_GND), 
        .OBMUX1(clocks_VCC), .OBMUX2(clocks_GND), .DLYYB0(clocks_GND), 
        .DLYYB1(clocks_GND), .DLYYB2(clocks_GND), .DLYYB3(clocks_GND), 
        .DLYYB4(clocks_GND), .DLYGLB0(clocks_GND), .DLYGLB1(clocks_GND)
        , .DLYGLB2(clocks_GND), .DLYGLB3(clocks_GND), .DLYGLB4(
        clocks_GND), .OCDIV0(clocks_GND), .OCDIV1(clocks_GND), .OCDIV2(
        clocks_GND), .OCDIV3(clocks_GND), .OCDIV4(clocks_GND), .OCMUX0(
        clocks_GND), .OCMUX1(clocks_VCC), .OCMUX2(clocks_GND), .DLYYC0(
        clocks_GND), .DLYYC1(clocks_GND), .DLYYC2(clocks_GND), .DLYYC3(
        clocks_GND), .DLYYC4(clocks_GND), .DLYGLC0(clocks_GND), 
        .DLYGLC1(clocks_GND), .DLYGLC2(clocks_GND), .DLYGLC3(
        clocks_GND), .DLYGLC4(clocks_GND), .FINDIV0(clocks_GND), 
        .FINDIV1(clocks_GND), .FINDIV2(clocks_GND), .FINDIV3(
        clocks_VCC), .FINDIV4(clocks_GND), .FINDIV5(clocks_GND), 
        .FINDIV6(clocks_GND), .FBDIV0(clocks_VCC), .FBDIV1(clocks_GND), 
        .FBDIV2(clocks_GND), .FBDIV3(clocks_GND), .FBDIV4(clocks_VCC), 
        .FBDIV5(clocks_GND), .FBDIV6(clocks_GND), .FBDLY0(clocks_GND), 
        .FBDLY1(clocks_GND), .FBDLY2(clocks_GND), .FBDLY3(clocks_GND), 
        .FBDLY4(clocks_GND), .FBSEL0(clocks_VCC), .FBSEL1(clocks_GND), 
        .XDLYSEL(clocks_GND), .VCOSEL0(clocks_GND), .VCOSEL1(
        clocks_GND), .VCOSEL2(clocks_VCC));
    PLLINT pllint1 (.A(osc48m_c), .Y(CLKAP));
    GND GND_i_0 (.Y(GND_net_1));
    VCC VCC_i (.Y(VCC));
    GND GND_i (.Y(GND));
    
endmodule


module clock_manager(
       osc48m_c,
       osc6m,
       mcu_osc_c,
       osc96m_i,
       clock_manager_GND,
       clock_manager_VCC,
       osc96m,
       osc48m_out
    );
input  osc48m_c;
output osc6m;
output mcu_osc_c;
output osc96m_i;
input  clock_manager_GND;
input  clock_manager_VCC;
input  osc96m;
output osc48m_out;

    wire osc48m_out_i, osc48m_out_i_i, GND, VCC, GND_net_1, VCC_net_1;
    
    VCC VCC_i_0 (.Y(VCC_net_1));
    INV osc48m_out_RNO (.A(osc48m_out_i), .Y(osc48m_out_i_i));
    CLKINT osc48m_out_RNIQM56 (.A(osc48m_out_i), .Y(osc48m_out));
    DFN1 osc48m_out_inst_1 (.D(osc48m_out_i_i), .CLK(osc96m), .Q(
        osc48m_out_i));
    GND GND_i_0 (.Y(GND_net_1));
    VCC VCC_i (.Y(VCC));
    clocks u0 (.clocks_VCC(clock_manager_VCC), .clocks_GND(
        clock_manager_GND), .osc96m_i(osc96m_i), .mcu_osc_c(mcu_osc_c), 
        .osc6m(osc6m), .osc48m_c(osc48m_c));
    GND GND_i (.Y(GND));
    
endmodule


module jtag_shift(
       shift_data_out,
       next_state_0_0,
       shift_data_in_5,
       shift_data_in_0,
       shift_tck,
       pc_poll_enable,
       shift_tms,
       shift_tdi,
       mote_tdo_c,
       N_13,
       N_145,
       shift_mode,
       shift_reset,
       osc96m,
       pc_poll_enable_0
    );
output [15:0] shift_data_out;
input  next_state_0_0;
input  shift_data_in_5;
input  shift_data_in_0;
output shift_tck;
input  pc_poll_enable;
output shift_tms;
output shift_tdi;
input  mote_tdo_c;
output N_13;
output N_145;
input  shift_mode;
input  shift_reset;
input  osc96m;
input  pc_poll_enable_0;

    wire N_235_0, \next_state_0[8]_net_1 , \next_state[10]_net_1 , 
        \data_in_reg_6[2] , N_17, \data_in_reg[2]_net_1 , 
        \data_in_reg_6[7] , N_22, \data_in_reg[7]_net_1 , 
        \next_state_RNIUGBA[7]_net_1 , tms_6_0_0_0, N_222, N_280, 
        N_271, tms_6_0_0_a4_3, tms_6_0_0_a4_1, \next_state[6]_net_1 , 
        \next_state[12]_net_1 , \next_state[4]_net_1 , 
        \next_state[5]_net_1 , next_statese_8_i_0, 
        \next_state[9]_net_1 , next_statese_8_i_a4_0, 
        next_statese_10_0_a4_0_0, \data_in_reg_i_m_0[15] , 
        \data_in_reg[15]_net_1 , next_statese_6_i_0, 
        \next_state[7]_net_1 , next_statese_6_i_a4_0, 
        next_statese_10_0_a4_1_0, \data_in_reg_i_m_0[0] , 
        \data_in_reg[0]_net_1 , bit_count_26_0, \bit_count[3]_net_1 , 
        tms_6_0_0_a2_1_1, \bit_count[2]_net_1 , \bit_count[4]_net_1 , 
        tms_6_i_i9_2_i_a3_0, m26_1, m26_0, \next_state[11]_net_1 , 
        un1_next_state_i_a4_0, \data_in_reg_i_m[15] , 
        \data_in_reg_i_m[0] , N_277, tdi_6_iv, tdi_i_m, tms_6, N_230, 
        \next_state_RNO[7]_net_1 , N_247_1, bit_counte, N_238, N_273, 
        \bit_count[1]_net_1 , bit_count_c0, N_275, bit_count_c2, N_241, 
        N_242, \next_state_ns_e[11] , N_240, \next_state_RNO[9]_net_1 , 
        N_268_i_0, N_15_0, bit_count_n3, bit_count_n2, N_227, 
        \next_state[3]_net_1 , \next_state[1]_net_1 , N_296, N_299, 
        N_225, done_RNO_net_1, shift_done, bit_count_n4, N_72, 
        bit_count_n1, bit_count_n0, \next_state_ns_e[12] , 
        \next_state_0_RNIQTF6_0[8]_net_1 , N_9_0, \next_state_ns_e[0] , 
        \next_state[0]_net_1 , \data_in_reg_RNO_1[2]_net_1 , 
        \data_in_reg_RNO_1[7]_net_1 , \data_in_reg_RNO[2]_net_1 , 
        \data_in_reg_RNO[7]_net_1 , \data_out_5[15] , \data_out_5[14] , 
        \data_out_5[13] , \data_out_5[12] , \data_out_5[11] , 
        \next_state[8]_net_1 , \data_out_5[10] , \data_out_5[9] , 
        \data_out_5[8] , \data_out_5[7] , \data_out_3[7] , 
        \data_out_5[6] , \data_out_5[5] , \data_out_5[4] , 
        \data_out_5[3] , \data_out_5[2] , \data_out_5[1] , 
        \data_out_5[0] , N_23, \data_in_reg[9]_net_1 , N_21, 
        \data_in_reg[5]_net_1 , N_19, \data_in_reg[3]_net_1 , 
        \data_in_reg[1]_net_1 , N_30, \data_in_reg[14]_net_1 , N_15, 
        N_29, \data_in_reg[13]_net_1 , N_28, \data_in_reg[12]_net_1 , 
        N_27, \data_in_reg[11]_net_1 , N_26, \data_in_reg[10]_net_1 , 
        N_25, N_24, \data_in_reg[8]_net_1 , \data_in_reg[6]_net_1 , 
        N_20, \data_in_reg[4]_net_1 , N_18, N_16, 
        \next_state[2]_net_1 , GND, VCC, GND_net_1, VCC_net_1;
    
    DFN1E0C1 \data_in_reg[8]  (.D(N_23), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[8]_net_1 ));
    AX1D \bit_count_RNO[4]  (.A(bit_count_c2), .B(bit_count_26_0), .C(
        N_72), .Y(bit_count_n4));
    DFN1E1P1 tck (.D(N_268_i_0), .CLK(osc96m), .PRE(shift_reset), .E(
        pc_poll_enable), .Q(shift_tck));
    NOR2B \data_in_reg_RNO_1[7]  (.A(shift_reset), .B(shift_data_in_5), 
        .Y(\data_in_reg_RNO_1[7]_net_1 ));
    DFN1E0C1 \data_out[8]  (.D(\data_out_5[8] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[8]));
    AO1B tms_RNO (.A(tms_6_0_0_a4_3), .B(N_230), .C(tms_6_0_0_0), .Y(
        tms_6));
    MX2 \data_in_reg_RNO_2[2]  (.A(\data_in_reg[1]_net_1 ), .B(
        \data_in_reg[3]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_17));
    MX2C \next_state_RNO_0[7]  (.A(\next_state[7]_net_1 ), .B(
        next_statese_6_i_a4_0), .S(pc_poll_enable_0), .Y(
        next_statese_6_i_0));
    AO1 \next_state_RNO[4]  (.A(shift_mode), .B(\next_state[1]_net_1 ), 
        .C(\next_state[3]_net_1 ), .Y(N_296));
    MX2 \data_in_reg_RNO[3]  (.A(\data_in_reg[2]_net_1 ), .B(
        \data_in_reg[4]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_18));
    OR2A \next_state_RNO_2[11]  (.A(next_statese_10_0_a4_1_0), .B(
        N_277), .Y(N_242));
    MX2 \data_out_RNO[1]  (.A(shift_data_out[2]), .B(shift_data_out[0])
        , .S(\next_state[8]_net_1 ), .Y(\data_out_5[1] ));
    DFN1P1C1 \data_in_reg[7]  (.D(\data_in_reg_6[7] ), .CLK(osc96m), 
        .PRE(\data_in_reg_RNO_1[7]_net_1 ), .CLR(
        \data_in_reg_RNO[7]_net_1 ), .Q(\data_in_reg[7]_net_1 ));
    DFN1E0C1 \data_out[12]  (.D(\data_out_5[12] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[12]));
    NOR2 \bit_count_RNO[0]  (.A(bit_count_c0), .B(
        \next_state[6]_net_1 ), .Y(bit_count_n0));
    DFN1E1C1 \next_state[6]  (.D(\next_state[5]_net_1 ), .CLK(osc96m), 
        .CLR(shift_reset), .E(pc_poll_enable), .Q(
        \next_state[6]_net_1 ));
    DFN1E0C1 \data_out[5]  (.D(\data_out_5[5] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[5]));
    MX2 \data_in_reg_RNO_0[7]  (.A(N_22), .B(\data_in_reg[7]_net_1 ), 
        .S(N_235_0), .Y(\data_in_reg_6[7] ));
    NOR2A \next_state_RNO[2]  (.A(\next_state[1]_net_1 ), .B(
        shift_mode), .Y(N_299));
    DFN1E1C1 \next_state[1]  (.D(\next_state[0]_net_1 ), .CLK(osc96m), 
        .CLR(shift_reset), .E(pc_poll_enable), .Q(
        \next_state[1]_net_1 ));
    MX2 \data_in_reg_RNO[10]  (.A(\data_in_reg[9]_net_1 ), .B(
        \data_in_reg[11]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_25));
    DFN1E0C1 \data_out[1]  (.D(\data_out_5[1] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[1]));
    MX2 \data_in_reg_RNO[11]  (.A(\data_in_reg[10]_net_1 ), .B(
        \data_in_reg[12]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_26));
    OAI1 tms_RNO_1 (.A(N_225), .B(\next_state[9]_net_1 ), .C(N_277), 
        .Y(N_230));
    OAI1 \next_state_0_RNIQTF6[8]  (.A(\next_state_0[8]_net_1 ), .B(
        \next_state[10]_net_1 ), .C(pc_poll_enable_0), .Y(N_235_0));
    DFN1E1C1 tms (.D(tms_6), .CLK(osc96m), .CLR(shift_reset), .E(
        pc_poll_enable), .Q(shift_tms));
    MX2 \data_out_RNO[0]  (.A(shift_data_out[1]), .B(mote_tdo_c), .S(
        \next_state[8]_net_1 ), .Y(\data_out_5[0] ));
    OR3 \bit_count_RNIGRMB[1]  (.A(\bit_count[1]_net_1 ), .B(
        bit_count_c0), .C(\bit_count[2]_net_1 ), .Y(N_273));
    MX2 \data_in_reg_RNO[9]  (.A(\data_in_reg[8]_net_1 ), .B(
        \data_in_reg[10]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_24));
    OA1A tms_RNO_2 (.A(N_222), .B(N_280), .C(N_271), .Y(tms_6_0_0_0));
    NOR2A \next_state_RNO[0]  (.A(\next_state[0]_net_1 ), .B(
        pc_poll_enable_0), .Y(\next_state_ns_e[0] ));
    AO1 \next_state_RNO[12]  (.A(\next_state[11]_net_1 ), .B(
        pc_poll_enable_0), .C(\next_state[12]_net_1 ), .Y(
        \next_state_ns_e[12] ));
    DFN1E0C1 \data_out[10]  (.D(\data_out_5[10] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[10]));
    NOR2A \data_in_reg_RNO[15]  (.A(\data_in_reg[14]_net_1 ), .B(
        \next_state[10]_net_1 ), .Y(N_30));
    DFN1E0C1 \data_in_reg[0]  (.D(N_15), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[0]_net_1 ));
    DFN1C1 \next_state[8]  (.D(\next_state_RNIUGBA[7]_net_1 ), .CLK(
        osc96m), .CLR(shift_reset), .Q(\next_state[8]_net_1 ));
    MX2 \data_out_RNO[4]  (.A(shift_data_out[5]), .B(shift_data_out[3])
        , .S(\next_state[8]_net_1 ), .Y(\data_out_5[4] ));
    DFN1E1 \bit_count[1]  (.D(bit_count_n1), .CLK(osc96m), .E(
        bit_counte), .Q(\bit_count[1]_net_1 ));
    DFN1P1 \next_state[0]  (.D(\next_state_ns_e[0] ), .CLK(osc96m), 
        .PRE(shift_reset), .Q(\next_state[0]_net_1 ));
    OAI1 \next_state_0_RNIQTF6_0[8]  (.A(\next_state_0[8]_net_1 ), .B(
        \next_state[10]_net_1 ), .C(pc_poll_enable_0), .Y(
        \next_state_0_RNIQTF6_0[8]_net_1 ));
    MX2 \data_in_reg_RNO[6]  (.A(\data_in_reg[5]_net_1 ), .B(
        \data_in_reg[7]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_21));
    NOR3A tms_RNO_0 (.A(tms_6_0_0_a4_1), .B(\next_state[6]_net_1 ), .C(
        N_222), .Y(tms_6_0_0_a4_3));
    DFN1E1C1 \next_state[5]  (.D(\next_state[4]_net_1 ), .CLK(osc96m), 
        .CLR(shift_reset), .E(pc_poll_enable), .Q(
        \next_state[5]_net_1 ));
    GND GND_i (.Y(GND));
    MX2 \data_in_reg_RNO[8]  (.A(\data_in_reg[7]_net_1 ), .B(
        \data_in_reg[9]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_23));
    VCC VCC_i_0 (.Y(VCC_net_1));
    DFN1E0C1 \data_in_reg[4]  (.D(N_19), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[4]_net_1 ));
    NOR3 tdi_RNO (.A(\data_in_reg_i_m[0] ), .B(tdi_i_m), .C(
        \data_in_reg_i_m[15] ), .Y(tdi_6_iv));
    DFN1E0C1 \data_out[2]  (.D(\data_out_5[2] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[2]));
    DFN1E0C1 \data_in_reg[5]  (.D(N_20), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[5]_net_1 ));
    AO1 \next_state_RNO_1[7]  (.A(\next_state[6]_net_1 ), .B(
        shift_mode), .C(\next_state_0[8]_net_1 ), .Y(
        next_statese_6_i_a4_0));
    DFN1E0C1 \data_out[14]  (.D(\data_out_5[14] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[14]));
    DFN1E0C1 \data_in_reg[11]  (.D(N_26), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[11]_net_1 ));
    DFN1E0C1 \data_in_reg[10]  (.D(N_25), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[10]_net_1 ));
    OR2 \bit_count_RNILOGJ[1]  (.A(N_275), .B(N_273), .Y(N_277));
    OR3A tms_RNO_5 (.A(\next_state_0[8]_net_1 ), .B(N_275), .C(
        bit_count_c2), .Y(N_271));
    NOR2A \data_in_reg_RNO[7]  (.A(shift_reset), .B(shift_data_in_5), 
        .Y(\data_in_reg_RNO[7]_net_1 ));
    MX2 \next_state_RNIUGBA[7]  (.A(\next_state_0[8]_net_1 ), .B(
        \next_state[7]_net_1 ), .S(pc_poll_enable_0), .Y(
        \next_state_RNIUGBA[7]_net_1 ));
    NOR2B \data_in_reg_RNO_1[2]  (.A(shift_reset), .B(shift_data_in_0), 
        .Y(\data_in_reg_RNO_1[2]_net_1 ));
    VCC VCC_i (.Y(VCC));
    MX2 \data_out_RNO[11]  (.A(shift_data_out[12]), .B(
        shift_data_out[10]), .S(\next_state[8]_net_1 ), .Y(
        \data_out_5[11] ));
    OR2A \next_state_RNIJJN7[6]  (.A(pc_poll_enable_0), .B(
        \next_state[6]_net_1 ), .Y(N_247_1));
    OR2A \next_state_RNO_1[11]  (.A(\next_state[11]_net_1 ), .B(
        pc_poll_enable_0), .Y(N_240));
    MX2 \data_in_reg_RNO[13]  (.A(\data_in_reg[12]_net_1 ), .B(
        \data_in_reg[14]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_28));
    DFN1E0C1 \data_in_reg[15]  (.D(N_30), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[15]_net_1 ));
    DFN1C1 \next_state[7]  (.D(\next_state_RNO[7]_net_1 ), .CLK(osc96m)
        , .CLR(shift_reset), .Q(\next_state[7]_net_1 ));
    DFN1E1P1 tdi (.D(tdi_6_iv), .CLK(osc96m), .PRE(shift_reset), .E(
        pc_poll_enable), .Q(shift_tdi));
    OR2 tck_RNO_2 (.A(\next_state[3]_net_1 ), .B(\next_state[1]_net_1 )
        , .Y(N_15_0));
    DFN1E0C1 \data_in_reg[1]  (.D(N_16), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[1]_net_1 ));
    OR3B tck_RNO (.A(m26_0), .B(m26_1), .C(N_15_0), .Y(N_268_i_0));
    DFN1C1 \next_state[9]  (.D(\next_state_RNO[9]_net_1 ), .CLK(osc96m)
        , .CLR(shift_reset), .Q(\next_state[9]_net_1 ));
    NOR2 \data_out_RNO_0[7]  (.A(shift_data_out[8]), .B(mote_tdo_c), 
        .Y(\data_out_3[7] ));
    NOR2B \data_in_reg_RNO[0]  (.A(\next_state[10]_net_1 ), .B(
        \data_in_reg[1]_net_1 ), .Y(N_15));
    DFN1E1 \bit_count[4]  (.D(bit_count_n4), .CLK(osc96m), .E(
        bit_counte), .Q(\bit_count[4]_net_1 ));
    MX2 \data_in_reg_RNO[12]  (.A(\data_in_reg[11]_net_1 ), .B(
        \data_in_reg[13]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_27));
    OA1B \next_state_RNO[9]  (.A(N_247_1), .B(N_277), .C(
        next_statese_8_i_0), .Y(\next_state_RNO[9]_net_1 ));
    MX2 \data_in_reg_RNO_2[7]  (.A(\data_in_reg[6]_net_1 ), .B(
        \data_in_reg[8]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_22));
    AO1A \next_state_RNO_1[9]  (.A(shift_mode), .B(
        \next_state[6]_net_1 ), .C(\next_state[10]_net_1 ), .Y(
        next_statese_8_i_a4_0));
    OR2 tdi_RNO_4 (.A(\next_state[11]_net_1 ), .B(
        \next_state[7]_net_1 ), .Y(un1_next_state_i_a4_0));
    NOR3A \next_state_RNIS2HL[6]  (.A(pc_poll_enable_0), .B(
        shift_reset), .C(N_238), .Y(bit_counte));
    MX2 \data_out_RNO[9]  (.A(shift_data_out[10]), .B(
        shift_data_out[8]), .S(\next_state[8]_net_1 ), .Y(
        \data_out_5[9] ));
    MX2 \data_in_reg_RNO[4]  (.A(\data_in_reg[3]_net_1 ), .B(
        \data_in_reg[5]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_19));
    MX2 \data_in_reg_RNO[5]  (.A(\data_in_reg[4]_net_1 ), .B(
        \data_in_reg[6]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_20));
    OR2A tdi_RNO_3 (.A(\next_state[10]_net_1 ), .B(
        \data_in_reg[0]_net_1 ), .Y(\data_in_reg_i_m_0[0] ));
    MX2 \data_out_RNO[5]  (.A(shift_data_out[6]), .B(shift_data_out[4])
        , .S(\next_state[8]_net_1 ), .Y(\data_out_5[5] ));
    DFN1E0C1 \data_out[15]  (.D(\data_out_5[15] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[15]));
    DFN1E1C1 \next_state[4]  (.D(N_296), .CLK(osc96m), .CLR(
        shift_reset), .E(pc_poll_enable), .Q(\next_state[4]_net_1 ));
    DFN1E0C1 \data_out[3]  (.D(\data_out_5[3] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[3]));
    XA1C \bit_count_RNO[3]  (.A(\bit_count[3]_net_1 ), .B(bit_count_c2)
        , .C(\next_state[6]_net_1 ), .Y(bit_count_n3));
    NOR2 tck_RNO_1 (.A(\next_state[7]_net_1 ), .B(
        \next_state[9]_net_1 ), .Y(m26_1));
    MX2 \data_out_RNO[8]  (.A(shift_data_out[9]), .B(shift_data_out[7])
        , .S(\next_state[8]_net_1 ), .Y(\data_out_5[8] ));
    NOR2B \next_state_RNO_4[11]  (.A(\next_state[10]_net_1 ), .B(
        pc_poll_enable_0), .Y(next_statese_10_0_a4_1_0));
    DFN1E0C1 \data_out[7]  (.D(\data_out_5[7] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[7]));
    MX2 \data_in_reg_RNO_0[2]  (.A(N_17), .B(\data_in_reg[2]_net_1 ), 
        .S(N_235_0), .Y(\data_in_reg_6[2] ));
    NOR2B done_RNIO4EC (.A(N_13), .B(pc_poll_enable_0), .Y(N_145));
    DFN1P1C1 \data_in_reg[2]  (.D(\data_in_reg_6[2] ), .CLK(osc96m), 
        .PRE(\data_in_reg_RNO_1[2]_net_1 ), .CLR(
        \data_in_reg_RNO[2]_net_1 ), .Q(\data_in_reg[2]_net_1 ));
    DFN1C1 \next_state[12]  (.D(\next_state_ns_e[12] ), .CLK(osc96m), 
        .CLR(shift_reset), .Q(\next_state[12]_net_1 ));
    OR2 \next_state_RNIK67A[7]  (.A(\next_state_0[8]_net_1 ), .B(
        \next_state[7]_net_1 ), .Y(N_222));
    MX2 \data_in_reg_RNO[14]  (.A(\data_in_reg[13]_net_1 ), .B(
        \data_in_reg[15]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_29));
    DFN1E0C1 \data_out[4]  (.D(\data_out_5[4] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[4]));
    GND GND_i_0 (.Y(GND_net_1));
    MX2C \next_state_RNO_0[9]  (.A(\next_state[9]_net_1 ), .B(
        next_statese_8_i_a4_0), .S(pc_poll_enable_0), .Y(
        next_statese_8_i_0));
    OR2A \bit_count_RNO_0[4]  (.A(\bit_count[3]_net_1 ), .B(
        \next_state[6]_net_1 ), .Y(bit_count_26_0));
    OR2A \bit_count_RNILOGJ[4]  (.A(tms_6_i_i9_2_i_a3_0), .B(N_273), 
        .Y(N_280));
    DFN1E0C1 \data_out[9]  (.D(\data_out_5[9] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[9]));
    DFN1C1 \next_state_0[8]  (.D(\next_state_RNIUGBA[7]_net_1 ), .CLK(
        osc96m), .CLR(shift_reset), .Q(\next_state_0[8]_net_1 ));
    OR2A \bit_count_RNO_1[4]  (.A(\bit_count[4]_net_1 ), .B(
        \next_state[6]_net_1 ), .Y(N_72));
    NOR2A tdi_RNO_2 (.A(N_280), .B(\data_in_reg_i_m_0[15] ), .Y(
        \data_in_reg_i_m[15] ));
    OR3C \next_state_RNO[11]  (.A(N_241), .B(N_240), .C(N_242), .Y(
        \next_state_ns_e[11] ));
    MX2 \data_in_reg_RNO[1]  (.A(\data_in_reg[0]_net_1 ), .B(
        \data_in_reg[2]_net_1 ), .S(\next_state[10]_net_1 ), .Y(N_16));
    DFN1E1 \bit_count[0]  (.D(bit_count_n0), .CLK(osc96m), .E(
        bit_counte), .Q(bit_count_c0));
    OR2A tdi_RNO_5 (.A(\next_state_0[8]_net_1 ), .B(
        \data_in_reg[15]_net_1 ), .Y(\data_in_reg_i_m_0[15] ));
    MX2 \data_out_RNO[10]  (.A(shift_data_out[11]), .B(
        shift_data_out[9]), .S(\next_state[8]_net_1 ), .Y(
        \data_out_5[10] ));
    NOR3 tms_RNO_3 (.A(\next_state[12]_net_1 ), .B(
        \next_state[4]_net_1 ), .C(\next_state[5]_net_1 ), .Y(
        tms_6_0_0_a4_1));
    MX2 \data_out_RNO[3]  (.A(shift_data_out[4]), .B(shift_data_out[2])
        , .S(\next_state[8]_net_1 ), .Y(\data_out_5[3] ));
    DFN1E1C1 \next_state[3]  (.D(\next_state[2]_net_1 ), .CLK(osc96m), 
        .CLR(shift_reset), .E(pc_poll_enable), .Q(
        \next_state[3]_net_1 ));
    OA1B tdi_RNO_1 (.A(\next_state[9]_net_1 ), .B(
        un1_next_state_i_a4_0), .C(shift_tdi), .Y(tdi_i_m));
    MX2 \data_out_RNO[6]  (.A(shift_data_out[7]), .B(shift_data_out[5])
        , .S(\next_state[8]_net_1 ), .Y(\data_out_5[6] ));
    DFN1E0C1 \data_in_reg[14]  (.D(N_29), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[14]_net_1 ));
    OR2A \next_state_RNO_0[11]  (.A(next_statese_10_0_a4_0_0), .B(
        N_280), .Y(N_241));
    OR2A \bit_count_RNI5TP7[4]  (.A(\bit_count[3]_net_1 ), .B(
        \bit_count[4]_net_1 ), .Y(N_275));
    AOI1B tms_RNO_4 (.A(tms_6_0_0_a2_1_1), .B(N_227), .C(
        \next_state[10]_net_1 ), .Y(N_225));
    MX2A \data_out_RNO[7]  (.A(\data_out_3[7] ), .B(shift_data_out[6]), 
        .S(\next_state[8]_net_1 ), .Y(\data_out_5[7] ));
    MX2 \data_out_RNO[14]  (.A(shift_data_out[15]), .B(
        shift_data_out[13]), .S(\next_state_0[8]_net_1 ), .Y(
        \data_out_5[14] ));
    DFN1E0C1 \data_in_reg[12]  (.D(N_27), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[12]_net_1 ));
    NOR2A \bit_count_RNI5TP7_0[4]  (.A(\bit_count[4]_net_1 ), .B(
        \bit_count[3]_net_1 ), .Y(tms_6_i_i9_2_i_a3_0));
    NOR2B \data_out_RNO[15]  (.A(\next_state_0[8]_net_1 ), .B(
        shift_data_out[14]), .Y(\data_out_5[15] ));
    NOR2B \next_state_RNO_3[11]  (.A(\next_state_0[8]_net_1 ), .B(
        pc_poll_enable_0), .Y(next_statese_10_0_a4_0_0));
    DFN1E0C1 \data_in_reg[3]  (.D(N_18), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[3]_net_1 ));
    OR2B \bit_count_RNIGRMB[2]  (.A(\bit_count[2]_net_1 ), .B(N_227), 
        .Y(bit_count_c2));
    DFN1E1 \bit_count[2]  (.D(bit_count_n2), .CLK(osc96m), .E(
        bit_counte), .Q(\bit_count[2]_net_1 ));
    MX2 \data_out_RNO[13]  (.A(shift_data_out[14]), .B(
        shift_data_out[12]), .S(\next_state_0[8]_net_1 ), .Y(
        \data_out_5[13] ));
    NOR2A done_RNIEQ9C (.A(shift_done), .B(next_state_0_0), .Y(N_13));
    DFN1E0C1 \data_out[11]  (.D(\data_out_5[11] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[11]));
    DFN1C1 done (.D(done_RNO_net_1), .CLK(osc96m), .CLR(shift_reset), 
        .Q(shift_done));
    OA1B \next_state_RNO[7]  (.A(N_247_1), .B(N_280), .C(
        next_statese_6_i_0), .Y(\next_state_RNO[7]_net_1 ));
    NOR3 \next_state_RNIPSUD[6]  (.A(\next_state_0[8]_net_1 ), .B(
        \next_state[10]_net_1 ), .C(\next_state[6]_net_1 ), .Y(N_238));
    DFN1C1 \next_state[10]  (.D(N_9_0), .CLK(osc96m), .CLR(shift_reset)
        , .Q(\next_state[10]_net_1 ));
    NOR2A \data_in_reg_RNO[2]  (.A(shift_reset), .B(shift_data_in_0), 
        .Y(\data_in_reg_RNO[2]_net_1 ));
    XA1B \bit_count_RNO[2]  (.A(N_227), .B(\bit_count[2]_net_1 ), .C(
        \next_state[6]_net_1 ), .Y(bit_count_n2));
    DFN1E0C1 \data_out[13]  (.D(\data_out_5[13] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[13]));
    MX2 \data_out_RNO[12]  (.A(shift_data_out[13]), .B(
        shift_data_out[11]), .S(\next_state_0[8]_net_1 ), .Y(
        \data_out_5[12] ));
    DFN1E0C1 \data_in_reg[9]  (.D(N_24), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[9]_net_1 ));
    MX2 \next_state_RNO[10]  (.A(\next_state[10]_net_1 ), .B(
        \next_state[9]_net_1 ), .S(pc_poll_enable_0), .Y(N_9_0));
    DFN1E1 \bit_count[3]  (.D(bit_count_n3), .CLK(osc96m), .E(
        bit_counte), .Q(\bit_count[3]_net_1 ));
    NOR2A tdi_RNO_0 (.A(N_277), .B(\data_in_reg_i_m_0[0] ), .Y(
        \data_in_reg_i_m[0] ));
    AO1 done_RNO (.A(\next_state[12]_net_1 ), .B(pc_poll_enable_0), .C(
        shift_done), .Y(done_RNO_net_1));
    XA1B \bit_count_RNO[1]  (.A(\bit_count[1]_net_1 ), .B(bit_count_c0)
        , .C(\next_state[6]_net_1 ), .Y(bit_count_n1));
    DFN1E0C1 \data_in_reg[13]  (.D(N_28), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[13]_net_1 ));
    NOR2 tck_RNO_0 (.A(\next_state[5]_net_1 ), .B(
        \next_state[11]_net_1 ), .Y(m26_0));
    DFN1E0C1 \data_out[0]  (.D(\data_out_5[0] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[0]));
    NOR3A tms_RNO_6 (.A(\bit_count[2]_net_1 ), .B(\bit_count[4]_net_1 )
        , .C(\bit_count[3]_net_1 ), .Y(tms_6_0_0_a2_1_1));
    NOR2B \bit_count_RNIVSP7[1]  (.A(\bit_count[1]_net_1 ), .B(
        bit_count_c0), .Y(N_227));
    DFN1C1 \next_state[11]  (.D(\next_state_ns_e[11] ), .CLK(osc96m), 
        .CLR(shift_reset), .Q(\next_state[11]_net_1 ));
    MX2 \data_out_RNO[2]  (.A(shift_data_out[3]), .B(shift_data_out[1])
        , .S(\next_state[8]_net_1 ), .Y(\data_out_5[2] ));
    DFN1E0C1 \data_in_reg[6]  (.D(N_21), .CLK(osc96m), .CLR(
        shift_reset), .E(N_235_0), .Q(\data_in_reg[6]_net_1 ));
    DFN1E0C1 \data_out[6]  (.D(\data_out_5[6] ), .CLK(osc96m), .CLR(
        shift_reset), .E(\next_state_0_RNIQTF6_0[8]_net_1 ), .Q(
        shift_data_out[6]));
    DFN1E1C1 \next_state[2]  (.D(N_299), .CLK(osc96m), .CLR(
        shift_reset), .E(pc_poll_enable), .Q(\next_state[2]_net_1 ));
    
endmodule


module jtag_pc_poll(
       pc_poll_data,
       pc_poll_enable_0,
       mote_tdo_c,
       shift_tdi,
       shift_tms,
       shift_tck,
       pc_poll_enable,
       mode_reset,
       osc96m,
       pc_poll_done,
       mode_reset_0
    );
output [15:0] pc_poll_data;
input  pc_poll_enable_0;
input  mote_tdo_c;
output shift_tdi;
output shift_tms;
output shift_tck;
input  pc_poll_enable;
input  mode_reset;
input  osc96m;
output pc_poll_done;
input  mode_reset_0;

    wire shift_reset_net_1, shift_reset_0, data_0_sqmuxa, 
        \next_state[1]_net_1 , N_145, N_4, shift_mode_net_1, N_13, N_7, 
        \next_state[0]_net_1 , N_9, \shift_data_in[2]_net_1 , 
        \shift_data_in[7]_net_1 , \shift_data_out[0] , 
        \shift_data_out[1] , \shift_data_out[2] , \shift_data_out[3] , 
        \shift_data_out[4] , \shift_data_out[5] , \shift_data_out[6] , 
        \shift_data_out[7] , \shift_data_out[8] , \shift_data_out[9] , 
        \shift_data_out[10] , \shift_data_out[11] , 
        \shift_data_out[12] , \shift_data_out[13] , 
        \shift_data_out[14] , \shift_data_out[15] , GND, VCC, 
        GND_net_1, VCC_net_1;
    
    jtag_shift u0 (.shift_data_out({\shift_data_out[15] , 
        \shift_data_out[14] , \shift_data_out[13] , 
        \shift_data_out[12] , \shift_data_out[11] , 
        \shift_data_out[10] , \shift_data_out[9] , \shift_data_out[8] , 
        \shift_data_out[7] , \shift_data_out[6] , \shift_data_out[5] , 
        \shift_data_out[4] , \shift_data_out[3] , \shift_data_out[2] , 
        \shift_data_out[1] , \shift_data_out[0] }), .next_state_0_0(
        \next_state[0]_net_1 ), .shift_data_in_5(
        \shift_data_in[7]_net_1 ), .shift_data_in_0(
        \shift_data_in[2]_net_1 ), .shift_tck(shift_tck), 
        .pc_poll_enable(pc_poll_enable), .shift_tms(shift_tms), 
        .shift_tdi(shift_tdi), .mote_tdo_c(mote_tdo_c), .N_13(N_13), 
        .N_145(N_145), .shift_mode(shift_mode_net_1), .shift_reset(
        shift_reset_net_1), .osc96m(osc96m), .pc_poll_enable_0(
        pc_poll_enable_0));
    DFN1E1 \data[3]  (.D(\shift_data_out[3] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[3]));
    DFN1E1 \data[5]  (.D(\shift_data_out[5] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[5]));
    DFN1E1C1 \next_state[1]  (.D(N_9), .CLK(osc96m), .CLR(mode_reset), 
        .E(pc_poll_enable), .Q(\next_state[1]_net_1 ));
    DFN1E1C1 \next_state[0]  (.D(N_13), .CLK(osc96m), .CLR(mode_reset), 
        .E(pc_poll_enable), .Q(\next_state[0]_net_1 ));
    DFN1E1 \data[9]  (.D(\shift_data_out[9] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[9]));
    DFN1E1 \data[2]  (.D(\shift_data_out[2] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[2]));
    VCC VCC_i (.Y(VCC));
    DFN1E1 \data[6]  (.D(\shift_data_out[6] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[6]));
    DFN1E1 \data[7]  (.D(\shift_data_out[7] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[7]));
    DFN1E1 \data[12]  (.D(\shift_data_out[12] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[12]));
    DFN1E1 \data[10]  (.D(\shift_data_out[10] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[10]));
    DFN1E1P1 \shift_data_in[7]  (.D(\next_state[1]_net_1 ), .CLK(
        osc96m), .PRE(mode_reset), .E(N_145), .Q(
        \shift_data_in[7]_net_1 ));
    DFN1E1 \data[0]  (.D(\shift_data_out[0] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[0]));
    DFN1E1P1 shift_reset (.D(\next_state[0]_net_1 ), .CLK(osc96m), 
        .PRE(mode_reset), .E(pc_poll_enable), .Q(shift_reset_0));
    DFN1E1 \data[11]  (.D(\shift_data_out[11] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[11]));
    DFN1E1 \data[8]  (.D(\shift_data_out[8] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[8]));
    DFN1E1C1 poll_done (.D(N_7), .CLK(osc96m), .CLR(mode_reset), .E(
        pc_poll_enable), .Q(pc_poll_done));
    DFN1E1 \data[4]  (.D(\shift_data_out[4] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[4]));
    DFN1E1 \data[15]  (.D(\shift_data_out[15] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[15]));
    MX2B shift_mode_RNO (.A(shift_mode_net_1), .B(
        \next_state[1]_net_1 ), .S(N_13), .Y(N_4));
    XOR2 \next_state_RNO[1]  (.A(\next_state[0]_net_1 ), .B(
        \next_state[1]_net_1 ), .Y(N_9));
    NOR3B \next_state_RNI0J4M[1]  (.A(\next_state[1]_net_1 ), .B(N_145)
        , .C(mode_reset_0), .Y(data_0_sqmuxa));
    DFN1E1C1 shift_mode (.D(N_4), .CLK(osc96m), .CLR(mode_reset), .E(
        pc_poll_enable), .Q(shift_mode_net_1));
    DFN1E1P1 \shift_data_in[2]  (.D(\next_state[1]_net_1 ), .CLK(
        osc96m), .PRE(mode_reset), .E(N_145), .Q(
        \shift_data_in[2]_net_1 ));
    GND GND_i (.Y(GND));
    MAJ3 poll_done_RNO (.A(\next_state[0]_net_1 ), .B(
        \next_state[1]_net_1 ), .C(pc_poll_done), .Y(N_7));
    DFN1E1 \data[13]  (.D(\shift_data_out[13] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[13]));
    DFN1E1 \data[1]  (.D(\shift_data_out[1] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[1]));
    CLKINT shift_reset_RNIPRD7 (.A(shift_reset_0), .Y(
        shift_reset_net_1));
    DFN1E1 \data[14]  (.D(\shift_data_out[14] ), .CLK(osc96m), .E(
        data_0_sqmuxa), .Q(pc_poll_data[14]));
    VCC VCC_i_0 (.Y(VCC_net_1));
    GND GND_i_0 (.Y(GND_net_1));
    
endmodule


module function_search(
       pc_poll_data,
       search_result,
       osc48m_out,
       pc_poll_done,
       search_enable,
       search_done
    );
input  [15:0] pc_poll_data;
output [15:0] search_result;
input  osc48m_out;
input  pc_poll_done;
input  search_enable;
output search_done;

    wire result_c11_m6_0_a2_0_net_1, result_c2_net_1, 
        result_c11tt_m3_e_net_1, result_n13, result_c12_0, 
        result_c11_m6_0_a2_3_net_1, result_c1_net_1, done_i, 
        result_n15_0_m4_i_o2_4_net_1, result_n15_0_m4_i_o2_2_net_1, 
        result_n15_0_m4_i_o2_1_net_1, result_c13_m3_0_a2_3_net_1, 
        result_c13_m3_0_a2_1_net_1, result_c9_m5_0_a2_2_0, 
        result_c9_m5_0_a2_2_net_1, result_c9_m5_0_a2_3, 
        result_c9_m5_0_a2_1_net_1, result_c9_m5_0_a2_0_net_1, 
        result_c7_m3_0_a2_2_net_1, result_c7_m3_0_a2_0_net_1, 
        result_c4_m1_0_a2_0_net_1, result_c11tt_m3_e_1, 
        result_c11tt_m3_e_0_net_1, result_c11_m6_0_a2_3_0_net_1, 
        result_0_sqmuxa_0_net_1, un1_find_0, un1_read_clk_2lt4_2_net_1, 
        un1_read_clk_2lt4_1_net_1, un1_read_clk_2lto11_4_net_1, 
        un1_read_clk_2lto11_2_net_1, un1_read_clk_2lto11_0_net_1, 
        result_c7, result_c9, un1_read_clk_2lt12, un1_read_clk_2lt11, 
        resulte, un1_read_clk_0, result12_0_net_1, 
        result_n15_0_N_12_i_i_0, result_n14, result_n12, result_n11, 
        result_n10, result_n9, result_n8, result_n7, result_c5_net_1, 
        result_n6, result_n5, result_n4, result_n3, result_n2, 
        result_18_0_net_1, result_n1, un1_find_2lt15, 
        un1_read_clk_2lt14, done_0_sqmuxa, GND, VCC, GND_net_1, 
        VCC_net_1;
    
    NOR2 un1_read_clk_2lto11_0 (.A(pc_poll_data[6]), .B(
        pc_poll_data[7]), .Y(un1_read_clk_2lto11_0_net_1));
    NOR2B result_c11_m6_0_a2_3_0 (.A(search_result[11]), .B(
        search_result[10]), .Y(result_c11_m6_0_a2_3_0_net_1));
    OA1 un1_find_2lto14 (.A(pc_poll_data[12]), .B(pc_poll_data[13]), 
        .C(pc_poll_data[14]), .Y(un1_find_2lt15));
    AX1C result_n12_0 (.A(result_c11_m6_0_a2_3_net_1), .B(
        result_c11_m6_0_a2_0_net_1), .C(search_result[12]), .Y(
        result_n12));
    NOR3C result_n15_0_m4_i_o2_2 (.A(search_result[13]), .B(
        search_result[14]), .C(result_n15_0_m4_i_o2_1_net_1), .Y(
        result_n15_0_m4_i_o2_2_net_1));
    AO1 un1_read_clk_2lto15 (.A(un1_read_clk_2lt14), .B(
        pc_poll_data[14]), .C(pc_poll_data[15]), .Y(un1_read_clk_0));
    AX1C result_n9_0 (.A(search_result[8]), .B(result_c7), .C(
        search_result[9]), .Y(result_n9));
    AX1C result_n11_0 (.A(search_result[10]), .B(result_c9), .C(
        search_result[11]), .Y(result_n11));
    XOR2 result_n10_0 (.A(result_c9), .B(search_result[10]), .Y(
        result_n10));
    NOR3A un1_read_clk_2lto11_4 (.A(un1_read_clk_2lto11_2_net_1), .B(
        pc_poll_data[9]), .C(pc_poll_data[8]), .Y(
        un1_read_clk_2lto11_4_net_1));
    OR2B result_c7_m3_0_a2_1 (.A(search_result[6]), .B(
        search_result[4]), .Y(result_c9_m5_0_a2_2_net_1));
    DFN1E1C1 \result[6]  (.D(result_n6), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[6]));
    NOR3 result12_0 (.A(un1_read_clk_0), .B(un1_find_0), .C(done_i), 
        .Y(result12_0_net_1));
    NOR2B result_c4_m1_0_a2_0_0 (.A(search_result[2]), .B(
        result_c11tt_m3_e_1), .Y(result_c4_m1_0_a2_0_net_1));
    DFN1E1C1 \result[9]  (.D(result_n9), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[9]));
    NOR2B result_c9_m5_0_a2_0 (.A(search_result[9]), .B(
        search_result[7]), .Y(result_c9_m5_0_a2_0_net_1));
    DFN1E1C1 \result[8]  (.D(result_n8), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[8]));
    DFN1E1C1 \result[3]  (.D(result_n3), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[3]));
    AX1C result_n4_0 (.A(search_result[3]), .B(result_c2_net_1), .C(
        search_result[4]), .Y(result_n4));
    XOR2 result_n3_0 (.A(result_c2_net_1), .B(search_result[3]), .Y(
        result_n3));
    NOR3B result_c5 (.A(result_c4_m1_0_a2_0_net_1), .B(
        search_result[5]), .C(result_c1_net_1), .Y(result_c5_net_1));
    VCC VCC_i (.Y(VCC));
    OR2B result_c1 (.A(search_result[1]), .B(search_result[0]), .Y(
        result_c1_net_1));
    AX1C result_n14_0 (.A(result_c11_m6_0_a2_3_net_1), .B(
        result_c13_m3_0_a2_3_net_1), .C(search_result[14]), .Y(
        result_n14));
    NOR2B result_c4_m1_0_a2_0 (.A(search_result[4]), .B(
        search_result[3]), .Y(result_c11tt_m3_e_1));
    NOR3C result_c11_m6_0_a2_3 (.A(result_c11_m6_0_a2_3_0_net_1), .B(
        search_result[8]), .C(result_c9_m5_0_a2_0_net_1), .Y(
        result_c11_m6_0_a2_3_net_1));
    OR2A result_0_sqmuxa_0 (.A(search_enable), .B(un1_find_0), .Y(
        result_0_sqmuxa_0_net_1));
    XNOR2 result_n2_0 (.A(result_c1_net_1), .B(search_result[2]), .Y(
        result_n2));
    XNOR2 result_n13_0 (.A(result_c12_0), .B(search_result[13]), .Y(
        result_n13));
    NOR3C result_c13_m3_0_a2_1 (.A(search_result[12]), .B(
        search_result[13]), .C(search_result[2]), .Y(
        result_c13_m3_0_a2_1_net_1));
    DFN1E1C1 \result[1]  (.D(result_n1), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[1]));
    DFN1E1C1 \result[15]  (.D(result_n15_0_N_12_i_i_0), .CLK(
        osc48m_out), .CLR(pc_poll_done), .E(resulte), .Q(
        search_result[15]));
    DFN1E1C1 \result[4]  (.D(result_n4), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[4]));
    DFN1E1C1 \result[10]  (.D(result_n10), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[10]));
    CLKINT done_RNIPM16 (.A(done_i), .Y(search_done));
    NOR2B result_c11_m6_0_a2_0 (.A(result_c2_net_1), .B(
        result_c11tt_m3_e_net_1), .Y(result_c11_m6_0_a2_0_net_1));
    NOR3 un1_read_clk_2lt4_2 (.A(pc_poll_data[1]), .B(pc_poll_data[0]), 
        .C(pc_poll_data[4]), .Y(un1_read_clk_2lt4_2_net_1));
    DFN1E1C1 \result[7]  (.D(result_n7), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[7]));
    AX1C result_n7_0 (.A(search_result[6]), .B(result_c5_net_1), .C(
        search_result[7]), .Y(result_n7));
    NOR2B result_c7_m3_0_a2_0 (.A(search_result[7]), .B(
        search_result[5]), .Y(result_c7_m3_0_a2_0_net_1));
    DFN1E1C1 \result[14]  (.D(result_n14), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[14]));
    GND GND_i (.Y(GND));
    AX1 result_n5_0 (.A(result_c1_net_1), .B(result_c4_m1_0_a2_0_net_1)
        , .C(search_result[5]), .Y(result_n5));
    OR3C result_c12 (.A(result_c11_m6_0_a2_3_net_1), .B(
        result_c11_m6_0_a2_0_net_1), .C(search_result[12]), .Y(
        result_c12_0));
    NOR2 result_c9_m5_0_a2_2 (.A(result_c9_m5_0_a2_2_net_1), .B(
        result_c9_m5_0_a2_3), .Y(result_c9_m5_0_a2_2_0));
    AX1C result_n15_0_m4_i_x2 (.A(result_c11_m6_0_a2_3_net_1), .B(
        result_n15_0_m4_i_o2_4_net_1), .C(search_result[15]), .Y(
        result_n15_0_N_12_i_i_0));
    NOR3B result_c9_m5_0_a2 (.A(result_c9_m5_0_a2_2_0), .B(
        result_c9_m5_0_a2_1_net_1), .C(result_c1_net_1), .Y(result_c9));
    DFN1E1C1 \result[5]  (.D(result_n5), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[5]));
    AO1B un1_read_clk_2lto5 (.A(un1_read_clk_2lt4_2_net_1), .B(
        un1_read_clk_2lt4_1_net_1), .C(pc_poll_data[5]), .Y(
        un1_read_clk_2lt11));
    XOR2 result_n6_0 (.A(result_c5_net_1), .B(search_result[6]), .Y(
        result_n6));
    NOR3B result_n15_0_m4_i_o2_4 (.A(result_n15_0_m4_i_o2_2_net_1), .B(
        result_c11tt_m3_e_net_1), .C(result_c1_net_1), .Y(
        result_n15_0_m4_i_o2_4_net_1));
    NOR3 result_0_sqmuxa (.A(un1_read_clk_0), .B(
        result_0_sqmuxa_0_net_1), .C(search_done), .Y(resulte));
    NOR3C result_c9_m5_0_a2_1 (.A(search_result[5]), .B(
        search_result[8]), .C(result_c9_m5_0_a2_0_net_1), .Y(
        result_c9_m5_0_a2_1_net_1));
    DFN1E1C1 \result[11]  (.D(result_n11), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[11]));
    XOR2 result_n1_0 (.A(search_result[1]), .B(search_result[0]), .Y(
        result_n1));
    DFN1E1 done (.D(result12_0_net_1), .CLK(osc48m_out), .E(
        done_0_sqmuxa), .Q(done_i));
    NOR2 un1_read_clk_2lt4_1 (.A(pc_poll_data[2]), .B(pc_poll_data[3]), 
        .Y(un1_read_clk_2lt4_1_net_1));
    DFN1E1C1 \result[12]  (.D(result_n12), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[12]));
    DFN1C1 \result[0]  (.D(result_18_0_net_1), .CLK(osc48m_out), .CLR(
        pc_poll_done), .Q(search_result[0]));
    NOR2 un1_read_clk_2lto11_2 (.A(pc_poll_data[10]), .B(
        pc_poll_data[11]), .Y(un1_read_clk_2lto11_2_net_1));
    OR2B result_c7_m3_0_a2_2 (.A(search_result[3]), .B(
        search_result[2]), .Y(result_c9_m5_0_a2_3));
    DFN1E1C1 \result[2]  (.D(result_n2), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[2]));
    NOR2B result_n15_0_m4_i_o2_1 (.A(search_result[12]), .B(
        search_result[2]), .Y(result_n15_0_m4_i_o2_1_net_1));
    XOR2 result_n8_0 (.A(result_c7), .B(search_result[8]), .Y(
        result_n8));
    XOR2 result_18_0 (.A(resulte), .B(search_result[0]), .Y(
        result_18_0_net_1));
    DFN1E1C1 \result[13]  (.D(result_n13), .CLK(osc48m_out), .CLR(
        pc_poll_done), .E(resulte), .Q(search_result[13]));
    NOR2 un1_find_2lto15 (.A(un1_find_2lt15), .B(pc_poll_data[15]), .Y(
        un1_find_0));
    NOR3A result_c7_m3_0_a2_2_0 (.A(result_c7_m3_0_a2_0_net_1), .B(
        result_c9_m5_0_a2_2_net_1), .C(result_c9_m5_0_a2_3), .Y(
        result_c7_m3_0_a2_2_net_1));
    NOR2B result_c11tt_m3_e_0 (.A(search_result[6]), .B(
        search_result[5]), .Y(result_c11tt_m3_e_0_net_1));
    OR3C un1_read_clk_2lto11 (.A(un1_read_clk_2lto11_0_net_1), .B(
        un1_read_clk_2lt11), .C(un1_read_clk_2lto11_4_net_1), .Y(
        un1_read_clk_2lt12));
    AO1 un1_read_clk_2lto13 (.A(un1_read_clk_2lt12), .B(
        pc_poll_data[12]), .C(pc_poll_data[13]), .Y(un1_read_clk_2lt14)
        );
    NOR2A done_RNO (.A(search_enable), .B(pc_poll_done), .Y(
        done_0_sqmuxa));
    NOR2A result_c2 (.A(search_result[2]), .B(result_c1_net_1), .Y(
        result_c2_net_1));
    NOR2B result_c11tt_m3_e (.A(result_c11tt_m3_e_0_net_1), .B(
        result_c11tt_m3_e_1), .Y(result_c11tt_m3_e_net_1));
    NOR2A result_c7_m3_0_a2 (.A(result_c7_m3_0_a2_2_net_1), .B(
        result_c1_net_1), .Y(result_c7));
    NOR3B result_c13_m3_0_a2_3 (.A(result_c13_m3_0_a2_1_net_1), .B(
        result_c11tt_m3_e_net_1), .C(result_c1_net_1), .Y(
        result_c13_m3_0_a2_3_net_1));
    VCC VCC_i_0 (.Y(VCC_net_1));
    GND GND_i_0 (.Y(GND_net_1));
    
endmodule


module mem_manager(
       search_result,
       pc_poll_data,
       pld_ctr_c,
       search_done,
       search_enable,
       pc_poll_done,
       osc48m_out,
       load_enable,
       mode_reset
    );
output [15:0] search_result;
input  [15:0] pc_poll_data;
input  [4:4] pld_ctr_c;
output search_done;
input  search_enable;
input  pc_poll_done;
input  osc48m_out;
input  load_enable;
input  mode_reset;

    wire GND, VCC, GND_net_1, VCC_net_1;
    
    VCC VCC_i_0 (.Y(VCC_net_1));
    function_search u2 (.pc_poll_data({pc_poll_data[15], 
        pc_poll_data[14], pc_poll_data[13], pc_poll_data[12], 
        pc_poll_data[11], pc_poll_data[10], pc_poll_data[9], 
        pc_poll_data[8], pc_poll_data[7], pc_poll_data[6], 
        pc_poll_data[5], pc_poll_data[4], pc_poll_data[3], 
        pc_poll_data[2], pc_poll_data[1], pc_poll_data[0]}), 
        .search_result({search_result[15], search_result[14], 
        search_result[13], search_result[12], search_result[11], 
        search_result[10], search_result[9], search_result[8], 
        search_result[7], search_result[6], search_result[5], 
        search_result[4], search_result[3], search_result[2], 
        search_result[1], search_result[0]}), .osc48m_out(osc48m_out), 
        .pc_poll_done(pc_poll_done), .search_enable(search_enable), 
        .search_done(search_done));
    GND GND_i_0 (.Y(GND_net_1));
    VCC VCC_i (.Y(VCC));
    GND GND_i (.Y(GND));
    
endmodule


module output_buffer(
       search_result,
       func_data,
       osc48m_out,
       new_result,
       search_done,
       rts_c,
       search_enable,
       mode_reset,
       mode_reset_0
    );
input  [15:0] search_result;
output [15:0] func_data;
input  osc48m_out;
input  new_result;
input  search_done;
output rts_c;
input  search_enable;
input  mode_reset;
input  mode_reset_0;

    wire \output_data_RNO[3]_net_1 , \output_data_RNO_0[3]_net_1 , 
        \output_data_RNO[1]_net_1 , \output_data_RNO_0[1]_net_1 , 
        \output_data_RNO[15]_net_1 , \output_data_RNO_0[15]_net_1 , 
        \output_data_RNO[14]_net_1 , \output_data_RNO_0[14]_net_1 , 
        \output_data_RNO[13]_net_1 , \output_data_RNO_0[13]_net_1 , 
        \output_data_RNO[12]_net_1 , \output_data_RNO_0[12]_net_1 , 
        \output_data_RNO[11]_net_1 , \output_data_RNO_0[11]_net_1 , 
        \output_data_RNO[10]_net_1 , \output_data_RNO_0[10]_net_1 , 
        \output_data_RNO[9]_net_1 , \output_data_RNO_0[9]_net_1 , 
        \output_data_RNO[8]_net_1 , \output_data_RNO_0[8]_net_1 , 
        \output_data_RNO[7]_net_1 , \output_data_RNO_0[7]_net_1 , 
        \output_data_RNO[6]_net_1 , \output_data_RNO_0[6]_net_1 , 
        \output_data_RNO[5]_net_1 , \output_data_RNO_0[5]_net_1 , 
        \output_data_RNO[4]_net_1 , \output_data_RNO_0[4]_net_1 , 
        \output_data_RNO[2]_net_1 , \output_data_RNO_0[2]_net_1 , 
        \output_data_RNO[0]_net_1 , \output_data_RNO_0[0]_net_1 , 
        rts_RNO_net_1, rts_RNO_0_net_1, load_next, GND, VCC, GND_net_1, 
        VCC_net_1;
    
    DFN1 \output_data[1]  (.D(\output_data_RNO[1]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[1]));
    NOR2A \output_data_RNO[9]  (.A(\output_data_RNO_0[9]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[9]_net_1 ));
    MX2 \output_data_RNO_0[8]  (.A(func_data[8]), .B(search_result[8]), 
        .S(search_enable), .Y(\output_data_RNO_0[8]_net_1 ));
    MX2 \output_data_RNO_0[12]  (.A(func_data[12]), .B(
        search_result[12]), .S(search_enable), .Y(
        \output_data_RNO_0[12]_net_1 ));
    DFN1 \output_data[13]  (.D(\output_data_RNO[13]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[13]));
    DFN1 \output_data[14]  (.D(\output_data_RNO[14]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[14]));
    NOR2A \output_data_RNO[6]  (.A(\output_data_RNO_0[6]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[6]_net_1 ));
    DFN1 \output_data[6]  (.D(\output_data_RNO[6]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[6]));
    DFN1 \output_data[0]  (.D(\output_data_RNO[0]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[0]));
    OR2 \output_data_RNO[3]  (.A(\output_data_RNO_0[3]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[3]_net_1 ));
    DFN1 \output_data[7]  (.D(\output_data_RNO[7]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[7]));
    VCC VCC_i (.Y(VCC));
    NOR2A \output_data_RNO[15]  (.A(\output_data_RNO_0[15]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[15]_net_1 ));
    DFN1 \output_data[5]  (.D(\output_data_RNO[5]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[5]));
    DFN1 \output_data[12]  (.D(\output_data_RNO[12]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[12]));
    MX2 \output_data_RNO_0[0]  (.A(func_data[0]), .B(search_result[0]), 
        .S(search_enable), .Y(\output_data_RNO_0[0]_net_1 ));
    MX2 \output_data_RNO_0[1]  (.A(func_data[1]), .B(search_result[1]), 
        .S(search_enable), .Y(\output_data_RNO_0[1]_net_1 ));
    NOR2A \output_data_RNO[12]  (.A(\output_data_RNO_0[12]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[12]_net_1 ));
    NOR2A \output_data_RNO[13]  (.A(\output_data_RNO_0[13]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[13]_net_1 ));
    MX2 \output_data_RNO_0[11]  (.A(func_data[11]), .B(
        search_result[11]), .S(search_enable), .Y(
        \output_data_RNO_0[11]_net_1 ));
    MX2 \output_data_RNO_0[9]  (.A(func_data[9]), .B(search_result[9]), 
        .S(search_enable), .Y(\output_data_RNO_0[9]_net_1 ));
    MX2 \output_data_RNO_0[3]  (.A(func_data[3]), .B(search_result[3]), 
        .S(search_enable), .Y(\output_data_RNO_0[3]_net_1 ));
    NOR2A \output_data_RNO[8]  (.A(\output_data_RNO_0[8]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[8]_net_1 ));
    MX2 \output_data_RNO_0[13]  (.A(func_data[13]), .B(
        search_result[13]), .S(search_enable), .Y(
        \output_data_RNO_0[13]_net_1 ));
    MX2 \output_data_RNO_0[10]  (.A(func_data[10]), .B(
        search_result[10]), .S(search_enable), .Y(
        \output_data_RNO_0[10]_net_1 ));
    NOR2A \output_data_RNO[4]  (.A(\output_data_RNO_0[4]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[4]_net_1 ));
    NOR2A \output_data_RNO[14]  (.A(\output_data_RNO_0[14]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[14]_net_1 ));
    MX2 \output_data_RNO_0[2]  (.A(func_data[2]), .B(search_result[2]), 
        .S(search_enable), .Y(\output_data_RNO_0[2]_net_1 ));
    DFN1 \output_data[3]  (.D(\output_data_RNO[3]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[3]));
    DFN1 \output_data[2]  (.D(\output_data_RNO[2]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[2]));
    NOR2A \output_data_RNO[0]  (.A(\output_data_RNO_0[0]_net_1 ), .B(
        mode_reset), .Y(\output_data_RNO[0]_net_1 ));
    DFN1 \output_data[10]  (.D(\output_data_RNO[10]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[10]));
    DFN1 \output_data[4]  (.D(\output_data_RNO[4]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[4]));
    MX2 \output_data_RNO_0[6]  (.A(func_data[6]), .B(search_result[6]), 
        .S(search_enable), .Y(\output_data_RNO_0[6]_net_1 ));
    GND GND_i (.Y(GND));
    MX2 \output_data_RNO_0[4]  (.A(func_data[4]), .B(search_result[4]), 
        .S(search_enable), .Y(\output_data_RNO_0[4]_net_1 ));
    MX2 \output_data_RNO_0[15]  (.A(func_data[15]), .B(
        search_result[15]), .S(search_enable), .Y(
        \output_data_RNO_0[15]_net_1 ));
    DFN1 \output_data[8]  (.D(\output_data_RNO[8]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[8]));
    DFN1 \output_data[11]  (.D(\output_data_RNO[11]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[11]));
    OR2 \output_data_RNO[1]  (.A(\output_data_RNO_0[1]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[1]_net_1 ));
    MX2 \output_data_RNO_0[14]  (.A(func_data[14]), .B(
        search_result[14]), .S(search_enable), .Y(
        \output_data_RNO_0[14]_net_1 ));
    NOR2A \output_data_RNO[5]  (.A(\output_data_RNO_0[5]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[5]_net_1 ));
    NOR2A \output_data_RNO[2]  (.A(\output_data_RNO_0[2]_net_1 ), .B(
        mode_reset), .Y(\output_data_RNO[2]_net_1 ));
    MX2 \output_data_RNO_0[7]  (.A(func_data[7]), .B(search_result[7]), 
        .S(search_enable), .Y(\output_data_RNO_0[7]_net_1 ));
    MX2 rts_RNO_0 (.A(rts_c), .B(load_next), .S(search_enable), .Y(
        rts_RNO_0_net_1));
    MX2 \output_data_RNO_0[5]  (.A(func_data[5]), .B(search_result[5]), 
        .S(search_enable), .Y(\output_data_RNO_0[5]_net_1 ));
    NOR2A rts_RNO (.A(rts_RNO_0_net_1), .B(mode_reset), .Y(
        rts_RNO_net_1));
    DFN1 \output_data[15]  (.D(\output_data_RNO[15]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[15]));
    DFN1 rts (.D(rts_RNO_net_1), .CLK(osc48m_out), .Q(rts_c));
    NOR2A \output_data_RNO[7]  (.A(\output_data_RNO_0[7]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[7]_net_1 ));
    DFN1 \output_data[9]  (.D(\output_data_RNO[9]_net_1 ), .CLK(
        osc48m_out), .Q(func_data[9]));
    NOR2A \output_data_RNO[11]  (.A(\output_data_RNO_0[11]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[11]_net_1 ));
    NOR2A \output_data_RNO[10]  (.A(\output_data_RNO_0[10]_net_1 ), .B(
        mode_reset_0), .Y(\output_data_RNO[10]_net_1 ));
    VCC VCC_i_0 (.Y(VCC_net_1));
    NOR2B rts_RNO_1 (.A(search_done), .B(new_result), .Y(load_next));
    GND GND_i_0 (.Y(GND_net_1));
    
endmodule


module jtag_controller(
       func_data,
       pld_ctr_c,
       mode,
       rts_c,
       osc48m_out,
       shift_tck,
       shift_tms,
       shift_tdi,
       mote_tdo_c,
       mode_reset,
       search_enable_2,
       load_enable_2,
       mode_reset_0,
       osc96m
    );
output [15:0] func_data;
input  [4:4] pld_ctr_c;
input  [1:0] mode;
output rts_c;
input  osc48m_out;
output shift_tck;
output shift_tms;
output shift_tdi;
input  mote_tdo_c;
input  mode_reset;
output search_enable_2;
output load_enable_2;
input  mode_reset_0;
input  osc96m;

    wire pc_poll_enable_0_net_1, un1_search_result_NE_12, 
        un1_search_result_NE_3, un1_search_result_NE_2, 
        un1_search_result_NE_8, un1_search_result_NE_11, 
        un1_search_result_13_i, un1_search_result_12_i, 
        un1_search_result_NE_7, un1_search_result_NE_10, 
        un1_search_result_9_i, un1_search_result_8_i, 
        un1_search_result_NE_5, un1_search_result_1_i, 
        un1_search_result_0_i, un1_search_result_NE_1, 
        \last_result[14]_net_1 , \search_result[14] , 
        un1_search_result_15_i, \last_result[10]_net_1 , 
        \search_result[10] , un1_search_result_11_i, 
        \last_result[6]_net_1 , \search_result[6] , 
        un1_search_result_7_i, \last_result[4]_net_1 , 
        \search_result[4] , un1_search_result_5_i, 
        \last_result[2]_net_1 , \search_result[2] , 
        un1_search_result_3_i, new_result_1, \search_result[15] , 
        \last_result[15]_net_1 , \search_result[13] , 
        \last_result[13]_net_1 , \search_result[12] , 
        \last_result[12]_net_1 , \search_result[11] , 
        \last_result[11]_net_1 , \search_result[9] , 
        \last_result[9]_net_1 , \search_result[8] , 
        \last_result[8]_net_1 , \search_result[7] , 
        \last_result[7]_net_1 , \search_result[5] , 
        \last_result[5]_net_1 , \search_result[3] , 
        \last_result[3]_net_1 , \search_result[1] , 
        \last_result[1]_net_1 , \search_result[0] , 
        \last_result[0]_net_1 , new_result_net_1, search_done, 
        search_enable_net_1, load_enable_net_1, pc_poll_enable_net_1, 
        \pc_poll_data[0] , \pc_poll_data[1] , \pc_poll_data[2] , 
        \pc_poll_data[3] , \pc_poll_data[4] , \pc_poll_data[5] , 
        \pc_poll_data[6] , \pc_poll_data[7] , \pc_poll_data[8] , 
        \pc_poll_data[9] , \pc_poll_data[10] , \pc_poll_data[11] , 
        \pc_poll_data[12] , \pc_poll_data[13] , \pc_poll_data[14] , 
        \pc_poll_data[15] , pc_poll_done, GND, VCC, GND_net_1, 
        VCC_net_1;
    
    jtag_pc_poll u0 (.pc_poll_data({\pc_poll_data[15] , 
        \pc_poll_data[14] , \pc_poll_data[13] , \pc_poll_data[12] , 
        \pc_poll_data[11] , \pc_poll_data[10] , \pc_poll_data[9] , 
        \pc_poll_data[8] , \pc_poll_data[7] , \pc_poll_data[6] , 
        \pc_poll_data[5] , \pc_poll_data[4] , \pc_poll_data[3] , 
        \pc_poll_data[2] , \pc_poll_data[1] , \pc_poll_data[0] }), 
        .pc_poll_enable_0(pc_poll_enable_0_net_1), .mote_tdo_c(
        mote_tdo_c), .shift_tdi(shift_tdi), .shift_tms(shift_tms), 
        .shift_tck(shift_tck), .pc_poll_enable(pc_poll_enable_net_1), 
        .mode_reset(mode_reset), .osc96m(osc96m), .pc_poll_done(
        pc_poll_done), .mode_reset_0(mode_reset_0));
    DFN1E1 pc_poll_enable_0 (.D(mode[1]), .CLK(osc96m), .E(
        mode_reset_0), .Q(pc_poll_enable_0_net_1));
    DFN1 \last_result[14]  (.D(\search_result[14] ), .CLK(search_done), 
        .Q(\last_result[14]_net_1 ));
    DFN1E1 pc_poll_enable (.D(mode[1]), .CLK(osc96m), .E(mode_reset), 
        .Q(pc_poll_enable_net_1));
    DFN1 \last_result[7]  (.D(\search_result[7] ), .CLK(search_done), 
        .Q(\last_result[7]_net_1 ));
    XNOR2 new_result_RNO_16 (.A(\search_result[1] ), .B(
        \last_result[1]_net_1 ), .Y(un1_search_result_1_i));
    XNOR2 new_result_RNO_15 (.A(\search_result[5] ), .B(
        \last_result[5]_net_1 ), .Y(un1_search_result_5_i));
    XNOR2 new_result_RNO_17 (.A(\search_result[0] ), .B(
        \last_result[0]_net_1 ), .Y(un1_search_result_0_i));
    XNOR2 new_result_RNO_6 (.A(\search_result[9] ), .B(
        \last_result[9]_net_1 ), .Y(un1_search_result_9_i));
    DFN1 \last_result[2]  (.D(\search_result[2] ), .CLK(search_done), 
        .Q(\last_result[2]_net_1 ));
    VCC VCC_i (.Y(VCC));
    mem_manager u1 (.search_result({\search_result[15] , 
        \search_result[14] , \search_result[13] , \search_result[12] , 
        \search_result[11] , \search_result[10] , \search_result[9] , 
        \search_result[8] , \search_result[7] , \search_result[6] , 
        \search_result[5] , \search_result[4] , \search_result[3] , 
        \search_result[2] , \search_result[1] , \search_result[0] }), 
        .pc_poll_data({\pc_poll_data[15] , \pc_poll_data[14] , 
        \pc_poll_data[13] , \pc_poll_data[12] , \pc_poll_data[11] , 
        \pc_poll_data[10] , \pc_poll_data[9] , \pc_poll_data[8] , 
        \pc_poll_data[7] , \pc_poll_data[6] , \pc_poll_data[5] , 
        \pc_poll_data[4] , \pc_poll_data[3] , \pc_poll_data[2] , 
        \pc_poll_data[1] , \pc_poll_data[0] }), .pld_ctr_c({
        pld_ctr_c[4]}), .search_done(search_done), .search_enable(
        search_enable_net_1), .pc_poll_done(pc_poll_done), .osc48m_out(
        osc48m_out), .load_enable(load_enable_net_1), .mode_reset(
        mode_reset));
    XNOR2 new_result_RNO_19 (.A(\search_result[3] ), .B(
        \last_result[3]_net_1 ), .Y(un1_search_result_3_i));
    XA1A new_result_RNO_10 (.A(\last_result[4]_net_1 ), .B(
        \search_result[4] ), .C(un1_search_result_5_i), .Y(
        un1_search_result_NE_2));
    DFN1E1 load_enable (.D(load_enable_2), .CLK(osc96m), .E(mode_reset)
        , .Q(load_enable_net_1));
    DFN1 \last_result[15]  (.D(\search_result[15] ), .CLK(search_done), 
        .Q(\last_result[15]_net_1 ));
    DFN1 \last_result[1]  (.D(\search_result[1] ), .CLK(search_done), 
        .Q(\last_result[1]_net_1 ));
    NOR3C new_result_RNO_0 (.A(un1_search_result_13_i), .B(
        un1_search_result_12_i), .C(un1_search_result_NE_7), .Y(
        un1_search_result_NE_11));
    XNOR2 new_result_RNO_7 (.A(\search_result[8] ), .B(
        \last_result[8]_net_1 ), .Y(un1_search_result_8_i));
    DFN1 \last_result[6]  (.D(\search_result[6] ), .CLK(search_done), 
        .Q(\last_result[6]_net_1 ));
    DFN1 \last_result[10]  (.D(\search_result[10] ), .CLK(search_done), 
        .Q(\last_result[10]_net_1 ));
    XA1A new_result_RNO_5 (.A(\last_result[14]_net_1 ), .B(
        \search_result[14] ), .C(un1_search_result_15_i), .Y(
        un1_search_result_NE_7));
    DFN1 \last_result[8]  (.D(\search_result[8] ), .CLK(search_done), 
        .Q(\last_result[8]_net_1 ));
    DFN1 \last_result[13]  (.D(\search_result[13] ), .CLK(search_done), 
        .Q(\last_result[13]_net_1 ));
    DFN1E1 search_enable (.D(search_enable_2), .CLK(osc96m), .E(
        mode_reset), .Q(search_enable_net_1));
    XNOR2 new_result_RNO_3 (.A(\search_result[13] ), .B(
        \last_result[13]_net_1 ), .Y(un1_search_result_13_i));
    DFN1 \last_result[4]  (.D(\search_result[4] ), .CLK(search_done), 
        .Q(\last_result[4]_net_1 ));
    GND GND_i (.Y(GND));
    DFN1 new_result (.D(new_result_1), .CLK(search_done), .Q(
        new_result_net_1));
    DFN1 \last_result[12]  (.D(\search_result[12] ), .CLK(search_done), 
        .Q(\last_result[12]_net_1 ));
    XNOR2 new_result_RNO_12 (.A(\search_result[15] ), .B(
        \last_result[15]_net_1 ), .Y(un1_search_result_15_i));
    NOR2A search_enable_2_inst_1 (.A(mode[1]), .B(mode[0]), .Y(
        search_enable_2));
    XNOR2 new_result_RNO_4 (.A(\search_result[12] ), .B(
        \last_result[12]_net_1 ), .Y(un1_search_result_12_i));
    output_buffer u2 (.search_result({\search_result[15] , 
        \search_result[14] , \search_result[13] , \search_result[12] , 
        \search_result[11] , \search_result[10] , \search_result[9] , 
        \search_result[8] , \search_result[7] , \search_result[6] , 
        \search_result[5] , \search_result[4] , \search_result[3] , 
        \search_result[2] , \search_result[1] , \search_result[0] }), 
        .func_data({func_data[15], func_data[14], func_data[13], 
        func_data[12], func_data[11], func_data[10], func_data[9], 
        func_data[8], func_data[7], func_data[6], func_data[5], 
        func_data[4], func_data[3], func_data[2], func_data[1], 
        func_data[0]}), .osc48m_out(osc48m_out), .new_result(
        new_result_net_1), .search_done(search_done), .rts_c(rts_c), 
        .search_enable(search_enable_net_1), .mode_reset(mode_reset), 
        .mode_reset_0(mode_reset_0));
    DFN1 \last_result[11]  (.D(\search_result[11] ), .CLK(search_done), 
        .Q(\last_result[11]_net_1 ));
    NOR3C new_result_RNO_1 (.A(un1_search_result_9_i), .B(
        un1_search_result_8_i), .C(un1_search_result_NE_5), .Y(
        un1_search_result_NE_10));
    XNOR2 new_result_RNO_13 (.A(\search_result[11] ), .B(
        \last_result[11]_net_1 ), .Y(un1_search_result_11_i));
    OR3C new_result_RNO (.A(un1_search_result_NE_11), .B(
        un1_search_result_NE_10), .C(un1_search_result_NE_12), .Y(
        new_result_1));
    XA1A new_result_RNO_18 (.A(\last_result[2]_net_1 ), .B(
        \search_result[2] ), .C(un1_search_result_3_i), .Y(
        un1_search_result_NE_1));
    XNOR2 new_result_RNO_14 (.A(\search_result[7] ), .B(
        \last_result[7]_net_1 ), .Y(un1_search_result_7_i));
    NOR3C new_result_RNO_2 (.A(un1_search_result_NE_3), .B(
        un1_search_result_NE_2), .C(un1_search_result_NE_8), .Y(
        un1_search_result_NE_12));
    XA1A new_result_RNO_8 (.A(\last_result[10]_net_1 ), .B(
        \search_result[10] ), .C(un1_search_result_11_i), .Y(
        un1_search_result_NE_5));
    NOR3C new_result_RNO_11 (.A(un1_search_result_1_i), .B(
        un1_search_result_0_i), .C(un1_search_result_NE_1), .Y(
        un1_search_result_NE_8));
    DFN1 \last_result[5]  (.D(\search_result[5] ), .CLK(search_done), 
        .Q(\last_result[5]_net_1 ));
    DFN1 \last_result[0]  (.D(\search_result[0] ), .CLK(search_done), 
        .Q(\last_result[0]_net_1 ));
    DFN1 \last_result[3]  (.D(\search_result[3] ), .CLK(search_done), 
        .Q(\last_result[3]_net_1 ));
    XA1A new_result_RNO_9 (.A(\last_result[6]_net_1 ), .B(
        \search_result[6] ), .C(un1_search_result_7_i), .Y(
        un1_search_result_NE_3));
    NOR2A load_enable_2_inst_1 (.A(mode[0]), .B(mode[1]), .Y(
        load_enable_2));
    DFN1 \last_result[9]  (.D(\search_result[9] ), .CLK(search_done), 
        .Q(\last_result[9]_net_1 ));
    VCC VCC_i_0 (.Y(VCC_net_1));
    GND GND_i_0 (.Y(GND_net_1));
    
endmodule


module io_controller(
       mode,
       func_data,
       pld_data_in_1,
       pld_data_in_3,
       pld_data_in_0,
       pld_ctr_c,
       load_enable_2,
       search_enable_2,
       mode_reset,
       shift_tms,
       mode1_RNI6FQ93,
       mode0_RNIOK8L,
       mode0_RNIUPCG1,
       shift_tck,
       mode1_RNICFK53,
       shift_tdi,
       N_19,
       mode1_RNI16O93,
       mote_tdo_c,
       osc96m,
       mode_reset_0
    );
output [1:0] mode;
input  [10:10] func_data;
input  pld_data_in_1;
input  pld_data_in_3;
input  pld_data_in_0;
input  [2:0] pld_ctr_c;
input  load_enable_2;
input  search_enable_2;
output mode_reset;
input  shift_tms;
output mode1_RNI6FQ93;
output mode0_RNIOK8L;
output mode0_RNIUPCG1;
input  shift_tck;
output mode1_RNICFK53;
input  shift_tdi;
output N_19;
output mode1_RNI16O93;
input  mote_tdo_c;
input  osc96m;
output mode_reset_0;

    wire N_72, mote_tms_iv_i_0, mode0_RNIHQ031_net_1, N_32, 
        mote_tck_iv_i_0, N_26, mote_tdi_iv_i_0, N_29, 
        \un1_mote_tdo_0_iv_i_0[10] , N_20, mode1_net_1, io_saved_net_1, 
        \next_state_nss[0] , \next_state[0]_net_1 , 
        \next_state[1]_net_1 , \next_state_nss[1] , io_saved_1_sqmuxa, 
        saved_tck_0_sqmuxa, N_67, saved_tck_net_1, saved_tdi_net_1, 
        saved_tms_net_1, N_35, mode2_net_1, mode3_net_1, mode0_net_1, 
        un9_mode3, un8_mode0, GND, VCC, GND_net_1, VCC_net_1;
    
    OA1C mode1_RNICFK53_inst_1 (.A(N_19), .B(shift_tck), .C(
        mote_tck_iv_i_0), .Y(mode1_RNICFK53));
    DFN1E1 mode_reset_inst_1 (.D(pld_ctr_c[2]), .CLK(osc96m), .E(N_72), 
        .Q(mode_reset));
    AO1D mode0_RNIHQ031 (.A(mode0_net_1), .B(N_35), .C(io_saved_net_1), 
        .Y(mode0_RNIHQ031_net_1));
    NOR2 saved_tdi_RNIQQKO (.A(mode0_RNIOK8L), .B(saved_tdi_net_1), .Y(
        N_29));
    NOR2A \next_state_RNIBB71_0[0]  (.A(\next_state[0]_net_1 ), .B(
        N_72), .Y(io_saved_1_sqmuxa));
    DFN1E1 \mode[1]  (.D(pld_ctr_c[1]), .CLK(osc96m), .E(
        io_saved_1_sqmuxa), .Q(mode[1]));
    DFN1 \next_state[1]  (.D(\next_state_nss[1] ), .CLK(osc96m), .Q(
        \next_state[1]_net_1 ));
    DFN1 \next_state[0]  (.D(\next_state_nss[0] ), .CLK(osc96m), .Q(
        \next_state[0]_net_1 ));
    OA1A \next_state_RNIBB71[0]  (.A(\next_state[0]_net_1 ), .B(
        \next_state[1]_net_1 ), .C(pld_ctr_c[2]), .Y(
        \next_state_nss[0] ));
    NOR3A mode1_RNIHQ031 (.A(N_20), .B(mode1_net_1), .C(io_saved_net_1)
        , .Y(N_19));
    VCC VCC_i (.Y(VCC));
    OR2B \next_state_RNIJMK[1]  (.A(\next_state[1]_net_1 ), .B(
        pld_ctr_c[2]), .Y(N_67));
    NOR3 mode2_RNIK8KK (.A(mode2_net_1), .B(mode3_net_1), .C(
        mode1_net_1), .Y(N_35));
    DFN1E1 saved_tms (.D(mode1_RNI6FQ93), .CLK(osc96m), .E(
        saved_tck_0_sqmuxa), .Q(saved_tms_net_1));
    NOR2A mode0_RNIUPCG1_inst_1 (.A(mode0_RNIOK8L), .B(
        \un1_mote_tdo_0_iv_i_0[10] ), .Y(mode0_RNIUPCG1));
    NOR2 saved_tms_RNIDVLO (.A(mode0_RNIOK8L), .B(saved_tms_net_1), .Y(
        N_32));
    NOR2 mode0_RNO (.A(mode[1]), .B(mode[0]), .Y(un8_mode0));
    NOR2B mode3_RNO (.A(mode[1]), .B(mode[0]), .Y(un9_mode3));
    OA1C mode0_RNIOK8L_inst_1 (.A(mode1_net_1), .B(mode0_net_1), .C(
        io_saved_net_1), .Y(mode0_RNIOK8L));
    DFN1E1 saved_tdi (.D(mode1_RNI16O93), .CLK(osc96m), .E(
        saved_tck_0_sqmuxa), .Q(saved_tdi_net_1));
    OA1C mode1_RNI6FQ93_inst_1 (.A(N_19), .B(shift_tms), .C(
        mote_tms_iv_i_0), .Y(mode1_RNI6FQ93));
    NOR2 saved_tck_RNIRMKO (.A(mode0_RNIOK8L), .B(saved_tck_net_1), .Y(
        N_26));
    OA1 \next_state_RNO[1]  (.A(\next_state[0]_net_1 ), .B(
        \next_state[1]_net_1 ), .C(pld_ctr_c[2]), .Y(
        \next_state_nss[1] ));
    DFN1E0 mode1 (.D(load_enable_2), .CLK(osc96m), .E(N_67), .Q(
        mode1_net_1));
    DFN1E0 mode2 (.D(search_enable_2), .CLK(osc96m), .E(N_67), .Q(
        mode2_net_1));
    GND GND_i (.Y(GND));
    DFN1E1 \mode[0]  (.D(pld_ctr_c[0]), .CLK(osc96m), .E(
        io_saved_1_sqmuxa), .Q(mode[0]));
    DFN1E0 mode0 (.D(un8_mode0), .CLK(osc96m), .E(N_67), .Q(
        mode0_net_1));
    AO1D saved_tdi_RNIL2032 (.A(mode0_RNIHQ031_net_1), .B(
        pld_data_in_1), .C(N_29), .Y(mote_tdi_iv_i_0));
    DFN1E1 mode_reset_0_inst_1 (.D(pld_ctr_c[2]), .CLK(osc96m), .E(
        N_72), .Q(mode_reset_0));
    DFN1E0 io_saved (.D(pld_ctr_c[2]), .CLK(osc96m), .E(
        \next_state_nss[0] ), .Q(io_saved_net_1));
    NOR2 \next_state_RNIBB71_1[0]  (.A(\next_state[0]_net_1 ), .B(N_72)
        , .Y(saved_tck_0_sqmuxa));
    OA1C mode1_RNI16O93_inst_1 (.A(N_19), .B(shift_tdi), .C(
        mote_tdi_iv_i_0), .Y(mode1_RNI16O93));
    DFN1E0 mode3 (.D(un9_mode3), .CLK(osc96m), .E(N_67), .Q(
        mode3_net_1));
    OA1B mode2_RNIJ8KK (.A(mode2_net_1), .B(mode3_net_1), .C(
        mode0_net_1), .Y(N_20));
    AO1D saved_tck_RNIVFSU1 (.A(mode0_RNIHQ031_net_1), .B(
        pld_data_in_3), .C(N_26), .Y(mote_tck_iv_i_0));
    DFN1E1 saved_tck (.D(mode1_RNICFK53), .CLK(osc96m), .E(
        saved_tck_0_sqmuxa), .Q(saved_tck_net_1));
    MX2C mode2_RNI654R (.A(mote_tdo_c), .B(func_data[10]), .S(N_20), 
        .Y(\un1_mote_tdo_0_iv_i_0[10] ));
    AO1D saved_tms_RNI77132 (.A(mode0_RNIHQ031_net_1), .B(
        pld_data_in_0), .C(N_32), .Y(mote_tms_iv_i_0));
    OR2A \next_state_RNIJMK_0[1]  (.A(pld_ctr_c[2]), .B(
        \next_state[1]_net_1 ), .Y(N_72));
    VCC VCC_i_0 (.Y(VCC_net_1));
    GND GND_i_0 (.Y(GND_net_1));
    
endmodule


module main(
       mote_tdo,
       usb_connect,
       osc48m,
       mote_tdi,
       mote_tms,
       mote_tck,
       osc32k,
       usb_osc,
       mcu_osc,
       pld_data,
       pld_ctr
    );
input  mote_tdo;
input  usb_connect;
input  osc48m;
output mote_tdi;
output mote_tms;
output mote_tck;
output osc32k;
output usb_osc;
output mcu_osc;
inout  [15:0] pld_data;
inout  [4:0] pld_ctr;

    wire osc6m, osc48m_out, osc96m, shift_tdi, shift_tms, shift_tck, 
        \func_data[0] , \func_data[1] , \func_data[2] , \func_data[3] , 
        \func_data[4] , \func_data[5] , \func_data[6] , \func_data[7] , 
        \func_data[8] , \func_data[9] , \func_data[10] , 
        \func_data[11] , \func_data[12] , \func_data[13] , 
        \func_data[14] , \func_data[15] , \mode[0] , \mode[1] , 
        mode_reset, VCC, mode0_RNIOK8L, mode0_RNIUPCG1, mode1_RNICFK53, 
        mode1_RNI16O93, mode1_RNI6FQ93, \u2.N_19 , \pld_data_in[8] , 
        \pld_data_in[9] , \pld_data_in[11] , mote_tdo_c, usb_connect_c, 
        osc48m_c, GND, usb_osc_c, mcu_osc_c, \pld_ctr_c[0] , 
        \pld_ctr_c[1] , \pld_ctr_c[2] , rts_c, \pld_ctr_c[4] , 
        \u3.search_enable_2 , \u3.load_enable_2 , mode_reset_0, 
        GND_net_1, VCC_net_1;
    
    clock_manager u0 (.osc48m_c(osc48m_c), .osc6m(osc6m), .mcu_osc_c(
        mcu_osc_c), .osc96m_i(osc96m), .clock_manager_GND(GND), 
        .clock_manager_VCC(VCC), .osc96m(osc96m), .osc48m_out(
        osc48m_out));
    TRIBUFF \pld_data_pad[12]  (.D(\func_data[12] ), .E(\u2.N_19 ), 
        .PAD(pld_data[12]));
    OUTBUF mcu_osc_pad (.D(mcu_osc_c), .PAD(mcu_osc));
    jtag_controller u3 (.func_data({\func_data[15] , \func_data[14] , 
        \func_data[13] , \func_data[12] , \func_data[11] , 
        \func_data[10] , \func_data[9] , \func_data[8] , 
        \func_data[7] , \func_data[6] , \func_data[5] , \func_data[4] , 
        \func_data[3] , \func_data[2] , \func_data[1] , \func_data[0] })
        , .pld_ctr_c({\pld_ctr_c[4] }), .mode({\mode[1] , \mode[0] }), 
        .rts_c(rts_c), .osc48m_out(osc48m_out), .shift_tck(shift_tck), 
        .shift_tms(shift_tms), .shift_tdi(shift_tdi), .mote_tdo_c(
        mote_tdo_c), .mode_reset(mode_reset), .search_enable_2(
        \u3.search_enable_2 ), .load_enable_2(\u3.load_enable_2 ), 
        .mode_reset_0(mode_reset_0), .osc96m(osc96m));
    TRIBUFF \pld_data_pad[6]  (.D(\func_data[6] ), .E(\u2.N_19 ), .PAD(
        pld_data[6]));
    VCC VCC_i (.Y(VCC));
    INBUF \pld_ctr_pad[1]  (.PAD(pld_ctr[1]), .Y(\pld_ctr_c[1] ));
    BIBUF \pld_data_pad[9]  (.PAD(pld_data[9]), .D(\func_data[9] ), .E(
        \u2.N_19 ), .Y(\pld_data_in[9] ));
    TRIBUFF \pld_data_pad[0]  (.D(\func_data[0] ), .E(\u2.N_19 ), .PAD(
        pld_data[0]));
    NOR2B usb_osc_pad_RNO (.A(usb_connect_c), .B(osc6m), .Y(usb_osc_c));
    TRIBUFF \pld_data_pad[2]  (.D(\func_data[2] ), .E(\u2.N_19 ), .PAD(
        pld_data[2]));
    INBUF usb_connect_pad (.PAD(usb_connect), .Y(usb_connect_c));
    OUTBUF \pld_ctr_pad[3]  (.D(rts_c), .PAD(pld_ctr[3]));
    TRIBUFF \pld_data_pad[4]  (.D(\func_data[4] ), .E(\u2.N_19 ), .PAD(
        pld_data[4]));
    OUTBUF mote_tdi_pad (.D(mode1_RNI16O93), .PAD(mote_tdi));
    INBUF \pld_ctr_pad[2]  (.PAD(pld_ctr[2]), .Y(\pld_ctr_c[2] ));
    INBUF mote_tdo_pad (.PAD(mote_tdo), .Y(mote_tdo_c));
    GND GND_i (.Y(GND));
    BIBUF \pld_data_pad[8]  (.PAD(pld_data[8]), .D(\func_data[8] ), .E(
        \u2.N_19 ), .Y(\pld_data_in[8] ));
    INBUF \pld_ctr_pad[4]  (.PAD(pld_ctr[4]), .Y(\pld_ctr_c[4] ));
    OUTBUF mote_tms_pad (.D(mode1_RNI6FQ93), .PAD(mote_tms));
    BIBUF \pld_data_pad[11]  (.PAD(pld_data[11]), .D(\func_data[11] ), 
        .E(\u2.N_19 ), .Y(\pld_data_in[11] ));
    TRIBUFF \pld_data_pad[3]  (.D(\func_data[3] ), .E(\u2.N_19 ), .PAD(
        pld_data[3]));
    io_controller u2 (.mode({\mode[1] , \mode[0] }), .func_data({
        \func_data[10] }), .pld_data_in_1(\pld_data_in[9] ), 
        .pld_data_in_3(\pld_data_in[11] ), .pld_data_in_0(
        \pld_data_in[8] ), .pld_ctr_c({\pld_ctr_c[2] , \pld_ctr_c[1] , 
        \pld_ctr_c[0] }), .load_enable_2(\u3.load_enable_2 ), 
        .search_enable_2(\u3.search_enable_2 ), .mode_reset(mode_reset)
        , .shift_tms(shift_tms), .mode1_RNI6FQ93(mode1_RNI6FQ93), 
        .mode0_RNIOK8L(mode0_RNIOK8L), .mode0_RNIUPCG1(mode0_RNIUPCG1), 
        .shift_tck(shift_tck), .mode1_RNICFK53(mode1_RNICFK53), 
        .shift_tdi(shift_tdi), .N_19(\u2.N_19 ), .mode1_RNI16O93(
        mode1_RNI16O93), .mote_tdo_c(mote_tdo_c), .osc96m(osc96m), 
        .mode_reset_0(mode_reset_0));
    TRIBUFF \pld_data_pad[14]  (.D(\func_data[14] ), .E(\u2.N_19 ), 
        .PAD(pld_data[14]));
    TRIBUFF \pld_data_pad[10]  (.D(mode0_RNIUPCG1), .E(mode0_RNIOK8L), 
        .PAD(pld_data[10]));
    OUTBUF mote_tck_pad (.D(mode1_RNICFK53), .PAD(mote_tck));
    TRIBUFF \pld_data_pad[7]  (.D(\func_data[7] ), .E(\u2.N_19 ), .PAD(
        pld_data[7]));
    INBUF \pld_ctr_pad[0]  (.PAD(pld_ctr[0]), .Y(\pld_ctr_c[0] ));
    TRIBUFF \pld_data_pad[1]  (.D(\func_data[1] ), .E(\u2.N_19 ), .PAD(
        pld_data[1]));
    TRIBUFF \pld_data_pad[15]  (.D(\func_data[15] ), .E(\u2.N_19 ), 
        .PAD(pld_data[15]));
    INBUF osc48m_pad (.PAD(osc48m), .Y(osc48m_c));
    OUTBUF usb_osc_pad (.D(usb_osc_c), .PAD(usb_osc));
    OUTBUF osc32k_pad (.D(GND), .PAD(osc32k));
    TRIBUFF \pld_data_pad[5]  (.D(\func_data[5] ), .E(\u2.N_19 ), .PAD(
        pld_data[5]));
    TRIBUFF \pld_data_pad[13]  (.D(\func_data[13] ), .E(\u2.N_19 ), 
        .PAD(pld_data[13]));
    VCC VCC_i_0 (.Y(VCC_net_1));
    GND GND_i_0 (.Y(GND_net_1));
    
endmodule

`timescale 1 ns/100 ps
// Version: 9.0 9.0.0.15


module output_buffer_mem(DATA,Q,WE,RE,WCLOCK,RCLOCK,FULL,EMPTY,
        RESET);
input [15:0] DATA;
output [15:0] Q;
input  WE, RE, WCLOCK, RCLOCK;
output  FULL, EMPTY;
input  RESET;

    wire RESETP, MEM_RADDR_0_net, RBINNXTSHIFT_0_net, 
        WBINSYNCSHIFT_0_net, MEM_WADDR_0_net, WBINNXTSHIFT_0_net, 
        RBINSYNCSHIFT_0_net, MEM_RADDR_1_net, RBINNXTSHIFT_1_net, 
        WBINSYNCSHIFT_1_net, MEM_WADDR_1_net, WBINNXTSHIFT_1_net, 
        RBINSYNCSHIFT_1_net, MEM_RADDR_2_net, RBINNXTSHIFT_2_net, 
        WBINSYNCSHIFT_2_net, MEM_WADDR_2_net, WBINNXTSHIFT_2_net, 
        RBINSYNCSHIFT_2_net, MEM_RADDR_3_net, RBINNXTSHIFT_3_net, 
        WBINSYNCSHIFT_3_net, MEM_WADDR_3_net, WBINNXTSHIFT_3_net, 
        RBINSYNCSHIFT_3_net, MEM_RADDR_4_net, RBINNXTSHIFT_4_net, 
        READDOMAIN_WMSB, MEM_WADDR_4_net, WBINNXTSHIFT_4_net, 
        RBINSYNCSHIFT_4_net, FULLINT, MEMORYWE, MEMWENEG, 
        WGRY_0_net, WGRY_1_net, WGRY_2_net, WGRY_3_net, 
        WGRY_4_net, RGRYSYNC_0_net, RGRYSYNC_1_net, 
        RGRYSYNC_2_net, RGRYSYNC_3_net, RGRYSYNC_4_net, EMPTYINT, 
        MEMORYRE, MEMRENEG, DVLDI, DVLDX, RGRY_0_net, RGRY_1_net, 
        RGRY_2_net, RGRY_3_net, RGRY_4_net, WGRYSYNC_0_net, 
        WGRYSYNC_1_net, WGRYSYNC_2_net, WGRYSYNC_3_net, 
        WGRYSYNC_4_net, QXI_0_net, QXI_1_net, QXI_2_net, 
        QXI_3_net, QXI_4_net, QXI_5_net, QXI_6_net, QXI_7_net, 
        QXI_8_net, QXI_9_net, QXI_10_net, QXI_11_net, QXI_12_net, 
        QXI_13_net, QXI_14_net, QXI_15_net, DFN1C0_6_Q, 
        DFN1C0_4_Q, DFN1C0_5_Q, DFN1C0_8_Q, DFN1C0_2_Q, XNOR3_0_Y, 
        XNOR3_3_Y, XOR2_5_Y, XOR2_10_Y, XOR2_17_Y, XOR2_18_Y, 
        XOR2_26_Y, AND2_10_Y, AND2_3_Y, AND2_14_Y, AND2_0_Y, 
        XOR2_23_Y, XOR2_2_Y, XOR2_3_Y, XOR2_1_Y, XOR2_4_Y, 
        AND2_13_Y, AO1_7_Y, AND2_16_Y, AND2_21_Y, AND2_18_Y, 
        AO1_8_Y, AND2_11_Y, AND2_19_Y, AO1_4_Y, AO1_9_Y, AO1_3_Y, 
        XOR2_21_Y, XOR2_6_Y, XOR2_20_Y, XOR2_28_Y, NAND2_1_Y, 
        XOR2_14_Y, XOR2_12_Y, XOR2_8_Y, XOR2_22_Y, XOR2_19_Y, 
        AND2_12_Y, AND2_2_Y, AND2_1_Y, AND2_15_Y, XOR2_15_Y, 
        XOR2_13_Y, XOR2_7_Y, XOR2_27_Y, XOR2_25_Y, AND2_7_Y, 
        AO1_6_Y, AND2_9_Y, AND2_8_Y, AND2_4_Y, AO1_5_Y, AND2_20_Y, 
        AND2_6_Y, AO1_0_Y, AO1_2_Y, AO1_1_Y, XOR2_0_Y, XOR2_9_Y, 
        XOR2_24_Y, XOR2_11_Y, XNOR3_2_Y, XNOR3_1_Y, DFN1C0_9_Q, 
        DFN1C0_0_Q, DFN1C0_3_Q, DFN1C0_7_Q, DFN1C0_1_Q, AND2_17_Y, 
        XNOR2_8_Y, XNOR2_2_Y, XNOR2_1_Y, XNOR2_3_Y, XNOR2_4_Y, 
        AND3_1_Y, AND2A_0_Y, AND2_5_Y, XOR2_16_Y, XNOR2_0_Y, 
        XNOR2_5_Y, XNOR2_7_Y, XNOR2_6_Y, AND3_0_Y, NAND2_0_Y, VCC, 
        GND;
    
    VCC VCC_1_net(.Y(VCC));
    GND GND_1_net(.Y(GND));
    DFN1C0 DFN1C0_RGRYSYNC_4_inst(.D(DFN1C0_1_Q), .CLK(WCLOCK), 
        .CLR(RESETP), .Q(RGRYSYNC_4_net));
    AND2 AND2_2(.A(MEM_WADDR_2_net), .B(GND), .Y(AND2_2_Y));
    AND2 AND2_20(.A(AND2_8_Y), .B(XOR2_25_Y), .Y(AND2_20_Y));
    AND2 AND2_11(.A(AND2_21_Y), .B(XOR2_4_Y), .Y(AND2_11_Y));
    XOR2 XOR2_WBINNXTSHIFT_2_inst(.A(XOR2_9_Y), .B(AO1_0_Y), .Y(
        WBINNXTSHIFT_2_net));
    DFN1C0 DFN1C0_FULL(.D(FULLINT), .CLK(WCLOCK), .CLR(RESETP), 
        .Q(FULL));
    XOR2 XOR2_RBINSYNCSHIFT_3_inst(.A(RGRYSYNC_4_net), .B(
        RGRYSYNC_3_net), .Y(RBINSYNCSHIFT_3_net));
    XOR2 XOR2_19(.A(WBINNXTSHIFT_4_net), .B(GND), .Y(XOR2_19_Y));
    XOR2 XOR2_1(.A(MEM_RADDR_3_net), .B(GND), .Y(XOR2_1_Y));
    XOR2 XOR2_23(.A(MEM_RADDR_0_net), .B(MEMORYRE), .Y(XOR2_23_Y));
    DFN1E1C0 DFN1E1C0_Q_1_inst(.D(QXI_1_net), .CLK(RCLOCK), .CLR(
        RESETP), .E(DVLDI), .Q(Q[1]));
    DFN1C0 DFN1C0_RGRYSYNC_3_inst(.D(DFN1C0_7_Q), .CLK(WCLOCK), 
        .CLR(RESETP), .Q(RGRYSYNC_3_net));
    DFN1E1C0 DFN1E1C0_Q_4_inst(.D(QXI_4_net), .CLK(RCLOCK), .CLR(
        RESETP), .E(DVLDI), .Q(Q[4]));
    DFN1E1C0 DFN1E1C0_Q_7_inst(.D(QXI_7_net), .CLK(RCLOCK), .CLR(
        RESETP), .E(DVLDI), .Q(Q[7]));
    BUFF BUFF_READDOMAIN_WMSB(.A(WGRYSYNC_4_net), .Y(
        READDOMAIN_WMSB));
    XOR2 XOR2_RBINNXTSHIFT_0_inst(.A(MEM_RADDR_0_net), .B(
        MEMORYRE), .Y(RBINNXTSHIFT_0_net));
    AO1 AO1_7(.A(XOR2_1_Y), .B(AND2_3_Y), .C(AND2_14_Y), .Y(
        AO1_7_Y));
    DFN1C0 DFN1C0_9(.D(RGRY_0_net), .CLK(WCLOCK), .CLR(RESETP), 
        .Q(DFN1C0_9_Q));
    AND2 AND2_18(.A(AND2_13_Y), .B(XOR2_3_Y), .Y(AND2_18_Y));
    AND2 AND2_15(.A(MEM_WADDR_4_net), .B(GND), .Y(AND2_15_Y));
    DFN1C0 DFN1C0_0(.D(RGRY_1_net), .CLK(WCLOCK), .CLR(RESETP), 
        .Q(DFN1C0_0_Q));
    AND2 AND2_1(.A(MEM_WADDR_3_net), .B(GND), .Y(AND2_1_Y));
    DFN1C0 DFN1C0_MEM_WADDR_0_inst(.D(WBINNXTSHIFT_0_net), .CLK(
        WCLOCK), .CLR(RESETP), .Q(MEM_WADDR_0_net));
    AO1 AO1_8(.A(XOR2_4_Y), .B(AO1_3_Y), .C(AND2_0_Y), .Y(AO1_8_Y)
        );
    DFN1C0 DFN1C0_MEM_RADDR_1_inst(.D(RBINNXTSHIFT_1_net), .CLK(
        RCLOCK), .CLR(RESETP), .Q(MEM_RADDR_1_net));
    DFN1C0 DFN1C0_MEM_WADDR_3_inst(.D(WBINNXTSHIFT_3_net), .CLK(
        WCLOCK), .CLR(RESETP), .Q(MEM_WADDR_3_net));
    AND2 AND2_10(.A(MEM_RADDR_1_net), .B(GND), .Y(AND2_10_Y));
    AND2 AND2_7(.A(XOR2_15_Y), .B(XOR2_13_Y), .Y(AND2_7_Y));
    XOR2 XOR2_20(.A(MEM_RADDR_3_net), .B(GND), .Y(XOR2_20_Y));
    AND2 AND2_12(.A(MEM_WADDR_1_net), .B(GND), .Y(AND2_12_Y));
    XOR2 XOR2_WBINNXTSHIFT_0_inst(.A(MEM_WADDR_0_net), .B(
        MEMORYWE), .Y(WBINNXTSHIFT_0_net));
    DFN1C0 DFN1C0_MEM_WADDR_4_inst(.D(WBINNXTSHIFT_4_net), .CLK(
        WCLOCK), .CLR(RESETP), .Q(MEM_WADDR_4_net));
    AND2 AND2_EMPTYINT(.A(AND2_17_Y), .B(XNOR2_8_Y), .Y(EMPTYINT));
    XOR2 XOR2_24(.A(MEM_WADDR_3_net), .B(GND), .Y(XOR2_24_Y));
    XOR2 XOR2_21(.A(MEM_RADDR_1_net), .B(GND), .Y(XOR2_21_Y));
    XNOR2 XNOR2_RBINSYNCSHIFT_1_inst(.A(RGRYSYNC_1_net), .B(
        XNOR3_3_Y), .Y(RBINSYNCSHIFT_1_net));
    XOR2 XOR2_16(.A(RBINSYNCSHIFT_4_net), .B(WBINNXTSHIFT_4_net), 
        .Y(XOR2_16_Y));
    DFN1C0 DFN1C0_4(.D(WGRY_1_net), .CLK(RCLOCK), .CLR(RESETP), 
        .Q(DFN1C0_4_Q));
    INV MEMWEBUBBLE(.A(MEMORYWE), .Y(MEMWENEG));
    AND2 AND2_6(.A(MEM_WADDR_0_net), .B(MEMORYWE), .Y(AND2_6_Y));
    AND3 AND3_0(.A(XNOR2_0_Y), .B(XNOR2_5_Y), .C(XNOR2_7_Y), .Y(
        AND3_0_Y));
    DFN1C0 DFN1C0_MEM_RADDR_2_inst(.D(RBINNXTSHIFT_2_net), .CLK(
        RCLOCK), .CLR(RESETP), .Q(MEM_RADDR_2_net));
    DFN1C0 DFN1C0_RGRY_2_inst(.D(XOR2_17_Y), .CLK(RCLOCK), .CLR(
        RESETP), .Q(RGRY_2_net));
    XNOR2 XNOR2_2(.A(RBINNXTSHIFT_0_net), .B(WBINSYNCSHIFT_0_net), 
        .Y(XNOR2_2_Y));
    XOR2 XOR2_4(.A(MEM_RADDR_4_net), .B(GND), .Y(XOR2_4_Y));
    AND3 AND3_1(.A(XNOR2_2_Y), .B(XNOR2_1_Y), .C(XNOR2_3_Y), .Y(
        AND3_1_Y));
    XNOR2 XNOR2_0(.A(RBINSYNCSHIFT_0_net), .B(WBINNXTSHIFT_0_net), 
        .Y(XNOR2_0_Y));
    XOR2 XOR2_18(.A(RBINNXTSHIFT_3_net), .B(RBINNXTSHIFT_4_net), 
        .Y(XOR2_18_Y));
    XOR2 XOR2_RBINNXTSHIFT_4_inst(.A(XOR2_28_Y), .B(AO1_3_Y), .Y(
        RBINNXTSHIFT_4_net));
    DFN1C0 DFN1C0_RGRY_1_inst(.D(XOR2_10_Y), .CLK(RCLOCK), .CLR(
        RESETP), .Q(RGRY_1_net));
    DFN1C0 DFN1C0_WGRY_3_inst(.D(XOR2_22_Y), .CLK(WCLOCK), .CLR(
        RESETP), .Q(WGRY_3_net));
    DFN1E1C0 DFN1E1C0_Q_6_inst(.D(QXI_6_net), .CLK(RCLOCK), .CLR(
        RESETP), .E(DVLDI), .Q(Q[6]));
    XOR2 XOR2_8(.A(WBINNXTSHIFT_2_net), .B(WBINNXTSHIFT_3_net), 
        .Y(XOR2_8_Y));
    INV MEMREBUBBLE(.A(MEMORYRE), .Y(MEMRENEG));
    DFN1C0 DFN1C0_MEM_RADDR_4_inst(.D(RBINNXTSHIFT_4_net), .CLK(
        RCLOCK), .CLR(RESETP), .Q(MEM_RADDR_4_net));
    AND2 AND2_3(.A(MEM_RADDR_2_net), .B(GND), .Y(AND2_3_Y));
    RAM512X18 RAM512X18_QXI_15_inst(.RADDR8(GND), .RADDR7(GND), 
        .RADDR6(GND), .RADDR5(GND), .RADDR4(GND), .RADDR3(
        MEM_RADDR_3_net), .RADDR2(MEM_RADDR_2_net), .RADDR1(
        MEM_RADDR_1_net), .RADDR0(MEM_RADDR_0_net), .WADDR8(GND), 
        .WADDR7(GND), .WADDR6(GND), .WADDR5(GND), .WADDR4(GND), 
        .WADDR3(MEM_WADDR_3_net), .WADDR2(MEM_WADDR_2_net), 
        .WADDR1(MEM_WADDR_1_net), .WADDR0(MEM_WADDR_0_net), .WD17(
        GND), .WD16(GND), .WD15(DATA[15]), .WD14(DATA[14]), .WD13(
        DATA[13]), .WD12(DATA[12]), .WD11(DATA[11]), .WD10(
        DATA[10]), .WD9(DATA[9]), .WD8(DATA[8]), .WD7(DATA[7]), 
        .WD6(DATA[6]), .WD5(DATA[5]), .WD4(DATA[4]), .WD3(DATA[3])
        , .WD2(DATA[2]), .WD1(DATA[1]), .WD0(DATA[0]), .RW0(GND), 
        .RW1(VCC), .WW0(GND), .WW1(VCC), .PIPE(GND), .REN(
        MEMRENEG), .WEN(MEMWENEG), .RCLK(RCLOCK), .WCLK(WCLOCK), 
        .RESET(RESETP), .RD17(), .RD16(), .RD15(QXI_15_net), 
        .RD14(QXI_14_net), .RD13(QXI_13_net), .RD12(QXI_12_net), 
        .RD11(QXI_11_net), .RD10(QXI_10_net), .RD9(QXI_9_net), 
        .RD8(QXI_8_net), .RD7(QXI_7_net), .RD6(QXI_6_net), .RD5(
        QXI_5_net), .RD4(QXI_4_net), .RD3(QXI_3_net), .RD2(
        QXI_2_net), .RD1(QXI_1_net), .RD0(QXI_0_net));
    XOR2 XOR2_WBINNXTSHIFT_4_inst(.A(XOR2_11_Y), .B(AO1_1_Y), .Y(
        WBINNXTSHIFT_4_net));
    XNOR2 XNOR2_6(.A(RBINSYNCSHIFT_3_net), .B(WBINNXTSHIFT_3_net), 
        .Y(XNOR2_6_Y));
    AND2 AND2_14(.A(MEM_RADDR_3_net), .B(GND), .Y(AND2_14_Y));
    INV RESETBUBBLE(.A(RESET), .Y(RESETP));
    BUFF BUFF_RBINSYNCSHIFT_4_inst(.A(RGRYSYNC_4_net), .Y(
        RBINSYNCSHIFT_4_net));
    AO1 AO1_2(.A(XOR2_7_Y), .B(AO1_0_Y), .C(AND2_2_Y), .Y(AO1_2_Y)
        );
    DFN1C0 DFN1C0_WGRY_0_inst(.D(XOR2_14_Y), .CLK(WCLOCK), .CLR(
        RESETP), .Q(WGRY_0_net));
    XOR2 XOR2_9(.A(MEM_WADDR_2_net), .B(GND), .Y(XOR2_9_Y));
    XNOR2 XNOR2_4(.A(RBINNXTSHIFT_3_net), .B(WBINSYNCSHIFT_3_net), 
        .Y(XNOR2_4_Y));
    DFN1C0 DFN1C0_WGRYSYNC_1_inst(.D(DFN1C0_4_Q), .CLK(RCLOCK), 
        .CLR(RESETP), .Q(WGRYSYNC_1_net));
    XOR2 XOR2_5(.A(RBINNXTSHIFT_0_net), .B(RBINNXTSHIFT_1_net), 
        .Y(XOR2_5_Y));
    AND2 AND2_19(.A(MEM_RADDR_0_net), .B(MEMORYRE), .Y(AND2_19_Y));
    DFN1C0 DFN1C0_6(.D(WGRY_0_net), .CLK(RCLOCK), .CLR(RESETP), 
        .Q(DFN1C0_6_Q));
    DFN1E1C0 DFN1E1C0_Q_0_inst(.D(QXI_0_net), .CLK(RCLOCK), .CLR(
        RESETP), .E(DVLDI), .Q(Q[0]));
    XOR2 XOR2_22(.A(WBINNXTSHIFT_3_net), .B(WBINNXTSHIFT_4_net), 
        .Y(XOR2_22_Y));
    AO1 AO1_1(.A(AND2_9_Y), .B(AO1_0_Y), .C(AO1_6_Y), .Y(AO1_1_Y));
    XOR2 XOR2_13(.A(MEM_WADDR_1_net), .B(GND), .Y(XOR2_13_Y));
    DFN1C0 DFN1C0_WGRYSYNC_2_inst(.D(DFN1C0_5_Q), .CLK(RCLOCK), 
        .CLR(RESETP), .Q(WGRYSYNC_2_net));
    DFN1C0 DFN1C0_WGRYSYNC_0_inst(.D(DFN1C0_6_Q), .CLK(RCLOCK), 
        .CLR(RESETP), .Q(WGRYSYNC_0_net));
    AO1 AO1_3(.A(AND2_16_Y), .B(AO1_4_Y), .C(AO1_7_Y), .Y(AO1_3_Y)
        );
    XOR2 XOR2_RBINNXTSHIFT_3_inst(.A(XOR2_20_Y), .B(AO1_9_Y), .Y(
        RBINNXTSHIFT_3_net));
    DFN1C0 DFN1C0_3(.D(RGRY_2_net), .CLK(WCLOCK), .CLR(RESETP), 
        .Q(DFN1C0_3_Q));
    AND2 AND2_16(.A(XOR2_3_Y), .B(XOR2_1_Y), .Y(AND2_16_Y));
    AND2 AND2_13(.A(XOR2_23_Y), .B(XOR2_2_Y), .Y(AND2_13_Y));
    XOR2 XOR2_10(.A(RBINNXTSHIFT_1_net), .B(RBINNXTSHIFT_2_net), 
        .Y(XOR2_10_Y));
    XNOR2 XNOR2_1(.A(RBINNXTSHIFT_1_net), .B(WBINSYNCSHIFT_1_net), 
        .Y(XNOR2_1_Y));
    DFN1C0 DFN1C0_RGRY_4_inst(.D(XOR2_26_Y), .CLK(RCLOCK), .CLR(
        RESETP), .Q(RGRY_4_net));
    DFN1C0 DFN1C0_2(.D(WGRY_4_net), .CLK(RCLOCK), .CLR(RESETP), 
        .Q(DFN1C0_2_Q));
    DFN1C0 DFN1C0_MEM_WADDR_2_inst(.D(WBINNXTSHIFT_2_net), .CLK(
        WCLOCK), .CLR(RESETP), .Q(MEM_WADDR_2_net));
    XOR2 XOR2_27(.A(MEM_WADDR_3_net), .B(GND), .Y(XOR2_27_Y));
    AND2 AND2_MEMORYRE(.A(NAND2_1_Y), .B(RE), .Y(MEMORYRE));
    XOR2 XOR2_7(.A(MEM_WADDR_2_net), .B(GND), .Y(XOR2_7_Y));
    AND2 AND2_5(.A(AND3_0_Y), .B(XNOR2_6_Y), .Y(AND2_5_Y));
    XOR2 XOR2_WBINNXTSHIFT_3_inst(.A(XOR2_24_Y), .B(AO1_2_Y), .Y(
        WBINNXTSHIFT_3_net));
    XOR2 XOR2_14(.A(WBINNXTSHIFT_0_net), .B(WBINNXTSHIFT_1_net), 
        .Y(XOR2_14_Y));
    XNOR3 XNOR3_1(.A(WGRYSYNC_4_net), .B(WGRYSYNC_3_net), .C(
        WGRYSYNC_2_net), .Y(XNOR3_1_Y));
    XNOR2 XNOR2_3(.A(RBINNXTSHIFT_2_net), .B(WBINSYNCSHIFT_2_net), 
        .Y(XNOR2_3_Y));
    DFN1C0 DFN1C0_7(.D(RGRY_3_net), .CLK(WCLOCK), .CLR(RESETP), 
        .Q(DFN1C0_7_Q));
    XOR2 XOR2_11(.A(MEM_WADDR_4_net), .B(GND), .Y(XOR2_11_Y));
    XOR2 XOR2_25(.A(MEM_WADDR_4_net), .B(GND), .Y(XOR2_25_Y));
    XNOR3 XNOR3_3(.A(RGRYSYNC_4_net), .B(RGRYSYNC_3_net), .C(
        RGRYSYNC_2_net), .Y(XNOR3_3_Y));
    XOR3 XOR3_RBINSYNCSHIFT_2_inst(.A(RGRYSYNC_4_net), .B(
        RGRYSYNC_3_net), .C(RGRYSYNC_2_net), .Y(
        RBINSYNCSHIFT_2_net));
    DFN1E1C0 DFN1E1C0_Q_11_inst(.D(QXI_11_net), .CLK(RCLOCK), 
        .CLR(RESETP), .E(DVLDI), .Q(Q[11]));
    AO1 AO1_6(.A(XOR2_27_Y), .B(AND2_2_Y), .C(AND2_1_Y), .Y(
        AO1_6_Y));
    DFN1E1C0 DFN1E1C0_Q_10_inst(.D(QXI_10_net), .CLK(RCLOCK), 
        .CLR(RESETP), .E(DVLDI), .Q(Q[10]));
    DFN1C0 DFN1C0_MEM_RADDR_3_inst(.D(RBINNXTSHIFT_3_net), .CLK(
        RCLOCK), .CLR(RESETP), .Q(MEM_RADDR_3_net));
    AND2 AND2_9(.A(XOR2_7_Y), .B(XOR2_27_Y), .Y(AND2_9_Y));
    DFN1E1C0 DFN1E1C0_Q_9_inst(.D(QXI_9_net), .CLK(RCLOCK), .CLR(
        RESETP), .E(DVLDI), .Q(Q[9]));
    DFN1E1C0 DFN1E1C0_Q_5_inst(.D(QXI_5_net), .CLK(RCLOCK), .CLR(
        RESETP), .E(DVLDI), .Q(Q[5]));
    AO1 AO1_9(.A(XOR2_3_Y), .B(AO1_4_Y), .C(AND2_3_Y), .Y(AO1_9_Y)
        );
    NAND2 NAND2_0(.A(FULL), .B(VCC), .Y(NAND2_0_Y));
    DFN1C0 DFN1C0_DVLDX(.D(DVLDI), .CLK(RCLOCK), .CLR(RESETP), .Q(
        DVLDX));
    XOR2 XOR2_WBINSYNCSHIFT_3_inst(.A(WGRYSYNC_4_net), .B(
        WGRYSYNC_3_net), .Y(WBINSYNCSHIFT_3_net));
    XNOR3 XNOR3_0(.A(RGRYSYNC_4_net), .B(RGRYSYNC_3_net), .C(
        RGRYSYNC_2_net), .Y(XNOR3_0_Y));
    DFN1C0 DFN1C0_DVLDI(.D(AND2A_0_Y), .CLK(RCLOCK), .CLR(RESETP), 
        .Q(DVLDI));
    DFN1E1C0 DFN1E1C0_Q_12_inst(.D(QXI_12_net), .CLK(RCLOCK), 
        .CLR(RESETP), .E(DVLDI), .Q(Q[12]));
    AND2 AND2_MEMORYWE(.A(NAND2_0_Y), .B(WE), .Y(MEMORYWE));
    DFN1C0 DFN1C0_WGRY_2_inst(.D(XOR2_8_Y), .CLK(WCLOCK), .CLR(
        RESETP), .Q(WGRY_2_net));
    AO1 AO1_0(.A(XOR2_13_Y), .B(AND2_6_Y), .C(AND2_12_Y), .Y(
        AO1_0_Y));
    DFN1C0 DFN1C0_RGRYSYNC_1_inst(.D(DFN1C0_0_Q), .CLK(WCLOCK), 
        .CLR(RESETP), .Q(RGRYSYNC_1_net));
    XOR2 XOR2_2(.A(MEM_RADDR_1_net), .B(GND), .Y(XOR2_2_Y));
    DFN1C0 DFN1C0_8(.D(WGRY_3_net), .CLK(RCLOCK), .CLR(RESETP), 
        .Q(DFN1C0_8_Q));
    AND2A AND2A_0(.A(EMPTY), .B(RE), .Y(AND2A_0_Y));
    XNOR3 XNOR3_WBINSYNCSHIFT_0_inst(.A(WGRYSYNC_1_net), .B(
        WGRYSYNC_0_net), .C(XNOR3_2_Y), .Y(WBINSYNCSHIFT_0_net));
    DFN1C0 DFN1C0_RGRYSYNC_2_inst(.D(DFN1C0_3_Q), .CLK(WCLOCK), 
        .CLR(RESETP), .Q(RGRYSYNC_2_net));
    DFN1C0 DFN1C0_RGRYSYNC_0_inst(.D(DFN1C0_9_Q), .CLK(WCLOCK), 
        .CLR(RESETP), .Q(RGRYSYNC_0_net));
    DFN1C0 DFN1C0_WGRY_1_inst(.D(XOR2_12_Y), .CLK(WCLOCK), .CLR(
        RESETP), .Q(WGRY_1_net));
    DFN1P0 DFN1P0_EMPTY(.D(EMPTYINT), .CLK(RCLOCK), .PRE(RESETP), 
        .Q(EMPTY));
    DFN1E1C0 DFN1E1C0_Q_3_inst(.D(QXI_3_net), .CLK(RCLOCK), .CLR(
        RESETP), .E(DVLDI), .Q(Q[3]));
    DFN1C0 DFN1C0_WGRYSYNC_4_inst(.D(DFN1C0_2_Q), .CLK(RCLOCK), 
        .CLR(RESETP), .Q(WGRYSYNC_4_net));
    AND2 AND2_0(.A(MEM_RADDR_4_net), .B(GND), .Y(AND2_0_Y));
    AND2 AND2_17(.A(AND3_1_Y), .B(XNOR2_4_Y), .Y(AND2_17_Y));
    XNOR2 XNOR2_WBINSYNCSHIFT_1_inst(.A(WGRYSYNC_1_net), .B(
        XNOR3_1_Y), .Y(WBINSYNCSHIFT_1_net));
    XOR2 XOR2_6(.A(MEM_RADDR_2_net), .B(GND), .Y(XOR2_6_Y));
    DFN1E1C0 DFN1E1C0_Q_13_inst(.D(QXI_13_net), .CLK(RCLOCK), 
        .CLR(RESETP), .E(DVLDI), .Q(Q[13]));
    XOR3 XOR3_WBINSYNCSHIFT_2_inst(.A(WGRYSYNC_4_net), .B(
        WGRYSYNC_3_net), .C(WGRYSYNC_2_net), .Y(
        WBINSYNCSHIFT_2_net));
    DFN1C0 DFN1C0_WGRYSYNC_3_inst(.D(DFN1C0_8_Q), .CLK(RCLOCK), 
        .CLR(RESETP), .Q(WGRYSYNC_3_net));
    XOR2 XOR2_12(.A(WBINNXTSHIFT_1_net), .B(WBINNXTSHIFT_2_net), 
        .Y(XOR2_12_Y));
    XNOR2 XNOR2_7(.A(RBINSYNCSHIFT_2_net), .B(WBINNXTSHIFT_2_net), 
        .Y(XNOR2_7_Y));
    DFN1C0 DFN1C0_5(.D(WGRY_2_net), .CLK(RCLOCK), .CLR(RESETP), 
        .Q(DFN1C0_5_Q));
    XOR2 XOR2_26(.A(RBINNXTSHIFT_4_net), .B(GND), .Y(XOR2_26_Y));
    DFN1C0 DFN1C0_1(.D(RGRY_4_net), .CLK(WCLOCK), .CLR(RESETP), 
        .Q(DFN1C0_1_Q));
    AND2 AND2_4(.A(AND2_7_Y), .B(XOR2_7_Y), .Y(AND2_4_Y));
    AND2 AND2_FULLINT(.A(AND2_5_Y), .B(XOR2_16_Y), .Y(FULLINT));
    DFN1E1C0 DFN1E1C0_Q_2_inst(.D(QXI_2_net), .CLK(RCLOCK), .CLR(
        RESETP), .E(DVLDI), .Q(Q[2]));
    XNOR2 XNOR2_5(.A(RBINSYNCSHIFT_1_net), .B(WBINNXTSHIFT_1_net), 
        .Y(XNOR2_5_Y));
    AO1 AO1_5(.A(XOR2_25_Y), .B(AO1_1_Y), .C(AND2_15_Y), .Y(
        AO1_5_Y));
    DFN1C0 DFN1C0_RGRY_3_inst(.D(XOR2_18_Y), .CLK(RCLOCK), .CLR(
        RESETP), .Q(RGRY_3_net));
    AND2 AND2_8(.A(AND2_7_Y), .B(AND2_9_Y), .Y(AND2_8_Y));
    XOR2 XOR2_3(.A(MEM_RADDR_2_net), .B(GND), .Y(XOR2_3_Y));
    XNOR3 XNOR3_RBINSYNCSHIFT_0_inst(.A(RGRYSYNC_1_net), .B(
        RGRYSYNC_0_net), .C(XNOR3_0_Y), .Y(RBINSYNCSHIFT_0_net));
    DFN1C0 DFN1C0_MEM_WADDR_1_inst(.D(WBINNXTSHIFT_1_net), .CLK(
        WCLOCK), .CLR(RESETP), .Q(MEM_WADDR_1_net));
    XOR2 XOR2_RBINNXTSHIFT_1_inst(.A(XOR2_21_Y), .B(AND2_19_Y), 
        .Y(RBINNXTSHIFT_1_net));
    XOR2 XOR2_17(.A(RBINNXTSHIFT_2_net), .B(RBINNXTSHIFT_3_net), 
        .Y(XOR2_17_Y));
    XOR2 XOR2_28(.A(MEM_RADDR_4_net), .B(GND), .Y(XOR2_28_Y));
    DFN1E1C0 DFN1E1C0_Q_15_inst(.D(QXI_15_net), .CLK(RCLOCK), 
        .CLR(RESETP), .E(DVLDI), .Q(Q[15]));
    DFN1E1C0 DFN1E1C0_Q_14_inst(.D(QXI_14_net), .CLK(RCLOCK), 
        .CLR(RESETP), .E(DVLDI), .Q(Q[14]));
    XOR2 XOR2_15(.A(MEM_WADDR_0_net), .B(MEMORYWE), .Y(XOR2_15_Y));
    DFN1C0 DFN1C0_MEM_RADDR_0_inst(.D(RBINNXTSHIFT_0_net), .CLK(
        RCLOCK), .CLR(RESETP), .Q(MEM_RADDR_0_net));
    DFN1E1C0 DFN1E1C0_Q_8_inst(.D(QXI_8_net), .CLK(RCLOCK), .CLR(
        RESETP), .E(DVLDI), .Q(Q[8]));
    DFN1C0 DFN1C0_RGRY_0_inst(.D(XOR2_5_Y), .CLK(RCLOCK), .CLR(
        RESETP), .Q(RGRY_0_net));
    AND2 AND2_21(.A(AND2_13_Y), .B(AND2_16_Y), .Y(AND2_21_Y));
    XOR2 XOR2_WBINNXTSHIFT_1_inst(.A(XOR2_0_Y), .B(AND2_6_Y), .Y(
        WBINNXTSHIFT_1_net));
    DFN1C0 DFN1C0_WGRY_4_inst(.D(XOR2_19_Y), .CLK(WCLOCK), .CLR(
        RESETP), .Q(WGRY_4_net));
    XOR2 XOR2_0(.A(MEM_WADDR_1_net), .B(GND), .Y(XOR2_0_Y));
    NAND2 NAND2_1(.A(EMPTY), .B(VCC), .Y(NAND2_1_Y));
    AO1 AO1_4(.A(XOR2_2_Y), .B(AND2_19_Y), .C(AND2_10_Y), .Y(
        AO1_4_Y));
    XOR2 XOR2_RBINNXTSHIFT_2_inst(.A(XOR2_6_Y), .B(AO1_4_Y), .Y(
        RBINNXTSHIFT_2_net));
    XNOR2 XNOR2_8(.A(RBINNXTSHIFT_4_net), .B(READDOMAIN_WMSB), .Y(
        XNOR2_8_Y));
    XNOR3 XNOR3_2(.A(WGRYSYNC_4_net), .B(WGRYSYNC_3_net), .C(
        WGRYSYNC_2_net), .Y(XNOR3_2_Y));
    
endmodule

`timescale 1 ns/100 ps
// Version: 9.0 9.0.0.15


module program_table_mem(WD,RD,WEN,REN,WADDR,RADDR,WCLK,RCLK);
input [15:0] WD;
output [15:0] RD;
input  WEN, REN;
input [9:0] WADDR, RADDR;
input WCLK, RCLK;

    wire WEAP, WEBP, VCC, GND;
    
    VCC VCC_1_net(.Y(VCC));
    GND GND_1_net(.Y(GND));
    RAM4K9 #( .MEMORYFILE("program_table_mem_R0C0.mem") )  
        program_table_mem_R0C0(.ADDRA11(GND), .ADDRA10(GND), 
        .ADDRA9(WADDR[9]), .ADDRA8(WADDR[8]), .ADDRA7(WADDR[7]), 
        .ADDRA6(WADDR[6]), .ADDRA5(WADDR[5]), .ADDRA4(WADDR[4]), 
        .ADDRA3(WADDR[3]), .ADDRA2(WADDR[2]), .ADDRA1(WADDR[1]), 
        .ADDRA0(WADDR[0]), .ADDRB11(GND), .ADDRB10(GND), .ADDRB9(
        RADDR[9]), .ADDRB8(RADDR[8]), .ADDRB7(RADDR[7]), .ADDRB6(
        RADDR[6]), .ADDRB5(RADDR[5]), .ADDRB4(RADDR[4]), .ADDRB3(
        RADDR[3]), .ADDRB2(RADDR[2]), .ADDRB1(RADDR[1]), .ADDRB0(
        RADDR[0]), .DINA8(GND), .DINA7(GND), .DINA6(GND), .DINA5(
        GND), .DINA4(GND), .DINA3(WD[3]), .DINA2(WD[2]), .DINA1(
        WD[1]), .DINA0(WD[0]), .DINB8(GND), .DINB7(GND), .DINB6(
        GND), .DINB5(GND), .DINB4(GND), .DINB3(GND), .DINB2(GND), 
        .DINB1(GND), .DINB0(GND), .WIDTHA0(GND), .WIDTHA1(VCC), 
        .WIDTHB0(GND), .WIDTHB1(VCC), .PIPEA(GND), .PIPEB(GND), 
        .WMODEA(GND), .WMODEB(GND), .BLKA(WEAP), .BLKB(WEBP), 
        .WENA(GND), .WENB(VCC), .CLKA(WCLK), .CLKB(RCLK), .RESET(
        VCC), .DOUTA8(), .DOUTA7(), .DOUTA6(), .DOUTA5(), .DOUTA4(
        ), .DOUTA3(), .DOUTA2(), .DOUTA1(), .DOUTA0(), .DOUTB8(), 
        .DOUTB7(), .DOUTB6(), .DOUTB5(), .DOUTB4(), .DOUTB3(RD[3])
        , .DOUTB2(RD[2]), .DOUTB1(RD[1]), .DOUTB0(RD[0]));
    RAM4K9 #( .MEMORYFILE("program_table_mem_R0C1.mem") )  
        program_table_mem_R0C1(.ADDRA11(GND), .ADDRA10(GND), 
        .ADDRA9(WADDR[9]), .ADDRA8(WADDR[8]), .ADDRA7(WADDR[7]), 
        .ADDRA6(WADDR[6]), .ADDRA5(WADDR[5]), .ADDRA4(WADDR[4]), 
        .ADDRA3(WADDR[3]), .ADDRA2(WADDR[2]), .ADDRA1(WADDR[1]), 
        .ADDRA0(WADDR[0]), .ADDRB11(GND), .ADDRB10(GND), .ADDRB9(
        RADDR[9]), .ADDRB8(RADDR[8]), .ADDRB7(RADDR[7]), .ADDRB6(
        RADDR[6]), .ADDRB5(RADDR[5]), .ADDRB4(RADDR[4]), .ADDRB3(
        RADDR[3]), .ADDRB2(RADDR[2]), .ADDRB1(RADDR[1]), .ADDRB0(
        RADDR[0]), .DINA8(GND), .DINA7(GND), .DINA6(GND), .DINA5(
        GND), .DINA4(GND), .DINA3(WD[7]), .DINA2(WD[6]), .DINA1(
        WD[5]), .DINA0(WD[4]), .DINB8(GND), .DINB7(GND), .DINB6(
        GND), .DINB5(GND), .DINB4(GND), .DINB3(GND), .DINB2(GND), 
        .DINB1(GND), .DINB0(GND), .WIDTHA0(GND), .WIDTHA1(VCC), 
        .WIDTHB0(GND), .WIDTHB1(VCC), .PIPEA(GND), .PIPEB(GND), 
        .WMODEA(GND), .WMODEB(GND), .BLKA(WEAP), .BLKB(WEBP), 
        .WENA(GND), .WENB(VCC), .CLKA(WCLK), .CLKB(RCLK), .RESET(
        VCC), .DOUTA8(), .DOUTA7(), .DOUTA6(), .DOUTA5(), .DOUTA4(
        ), .DOUTA3(), .DOUTA2(), .DOUTA1(), .DOUTA0(), .DOUTB8(), 
        .DOUTB7(), .DOUTB6(), .DOUTB5(), .DOUTB4(), .DOUTB3(RD[7])
        , .DOUTB2(RD[6]), .DOUTB1(RD[5]), .DOUTB0(RD[4]));
    RAM4K9 #( .MEMORYFILE("program_table_mem_R0C3.mem") )  
        program_table_mem_R0C3(.ADDRA11(GND), .ADDRA10(GND), 
        .ADDRA9(WADDR[9]), .ADDRA8(WADDR[8]), .ADDRA7(WADDR[7]), 
        .ADDRA6(WADDR[6]), .ADDRA5(WADDR[5]), .ADDRA4(WADDR[4]), 
        .ADDRA3(WADDR[3]), .ADDRA2(WADDR[2]), .ADDRA1(WADDR[1]), 
        .ADDRA0(WADDR[0]), .ADDRB11(GND), .ADDRB10(GND), .ADDRB9(
        RADDR[9]), .ADDRB8(RADDR[8]), .ADDRB7(RADDR[7]), .ADDRB6(
        RADDR[6]), .ADDRB5(RADDR[5]), .ADDRB4(RADDR[4]), .ADDRB3(
        RADDR[3]), .ADDRB2(RADDR[2]), .ADDRB1(RADDR[1]), .ADDRB0(
        RADDR[0]), .DINA8(GND), .DINA7(GND), .DINA6(GND), .DINA5(
        GND), .DINA4(GND), .DINA3(WD[15]), .DINA2(WD[14]), .DINA1(
        WD[13]), .DINA0(WD[12]), .DINB8(GND), .DINB7(GND), .DINB6(
        GND), .DINB5(GND), .DINB4(GND), .DINB3(GND), .DINB2(GND), 
        .DINB1(GND), .DINB0(GND), .WIDTHA0(GND), .WIDTHA1(VCC), 
        .WIDTHB0(GND), .WIDTHB1(VCC), .PIPEA(GND), .PIPEB(GND), 
        .WMODEA(GND), .WMODEB(GND), .BLKA(WEAP), .BLKB(WEBP), 
        .WENA(GND), .WENB(VCC), .CLKA(WCLK), .CLKB(RCLK), .RESET(
        VCC), .DOUTA8(), .DOUTA7(), .DOUTA6(), .DOUTA5(), .DOUTA4(
        ), .DOUTA3(), .DOUTA2(), .DOUTA1(), .DOUTA0(), .DOUTB8(), 
        .DOUTB7(), .DOUTB6(), .DOUTB5(), .DOUTB4(), .DOUTB3(
        RD[15]), .DOUTB2(RD[14]), .DOUTB1(RD[13]), .DOUTB0(RD[12])
        );
    INV WEBUBBLEB(.A(REN), .Y(WEBP));
    INV WEBUBBLEA(.A(WEN), .Y(WEAP));
    RAM4K9 #( .MEMORYFILE("program_table_mem_R0C2.mem") )  
        program_table_mem_R0C2(.ADDRA11(GND), .ADDRA10(GND), 
        .ADDRA9(WADDR[9]), .ADDRA8(WADDR[8]), .ADDRA7(WADDR[7]), 
        .ADDRA6(WADDR[6]), .ADDRA5(WADDR[5]), .ADDRA4(WADDR[4]), 
        .ADDRA3(WADDR[3]), .ADDRA2(WADDR[2]), .ADDRA1(WADDR[1]), 
        .ADDRA0(WADDR[0]), .ADDRB11(GND), .ADDRB10(GND), .ADDRB9(
        RADDR[9]), .ADDRB8(RADDR[8]), .ADDRB7(RADDR[7]), .ADDRB6(
        RADDR[6]), .ADDRB5(RADDR[5]), .ADDRB4(RADDR[4]), .ADDRB3(
        RADDR[3]), .ADDRB2(RADDR[2]), .ADDRB1(RADDR[1]), .ADDRB0(
        RADDR[0]), .DINA8(GND), .DINA7(GND), .DINA6(GND), .DINA5(
        GND), .DINA4(GND), .DINA3(WD[11]), .DINA2(WD[10]), .DINA1(
        WD[9]), .DINA0(WD[8]), .DINB8(GND), .DINB7(GND), .DINB6(
        GND), .DINB5(GND), .DINB4(GND), .DINB3(GND), .DINB2(GND), 
        .DINB1(GND), .DINB0(GND), .WIDTHA0(GND), .WIDTHA1(VCC), 
        .WIDTHB0(GND), .WIDTHB1(VCC), .PIPEA(GND), .PIPEB(GND), 
        .WMODEA(GND), .WMODEB(GND), .BLKA(WEAP), .BLKB(WEBP), 
        .WENA(GND), .WENB(VCC), .CLKA(WCLK), .CLKB(RCLK), .RESET(
        VCC), .DOUTA8(), .DOUTA7(), .DOUTA6(), .DOUTA5(), .DOUTA4(
        ), .DOUTA3(), .DOUTA2(), .DOUTA1(), .DOUTA0(), .DOUTB8(), 
        .DOUTB7(), .DOUTB6(), .DOUTB5(), .DOUTB4(), .DOUTB3(
        RD[11]), .DOUTB2(RD[10]), .DOUTB1(RD[9]), .DOUTB0(RD[8]));
    
endmodule

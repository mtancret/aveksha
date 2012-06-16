/**
 * main.v
 * Purpose: Top level.
 * Author(s): Matthew Tan Creti
 *
 * Copyright 2011 Purdue University
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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
    pld_ctr0,
    pld_ctr1,
    pld_ctr2,
    pld_ctr3,
    pld_ctr4
);

input mote_tdo;
input usb_connect;
input osc48m;

output mote_tdi;
output mote_tms;
output mote_tck;
output mcu_osc;
output usb_osc;
output osc32k;

inout [15:0] pld_data;
//inout [4:0] pld_ctr;

input pld_ctr0;
input pld_ctr1;
input pld_ctr2;
output pld_ctr3;
input pld_ctr4;

wire [4:0] pld_ctr;
assign pld_ctr[0] = pld_ctr0;
assign pld_ctr[1] = pld_ctr1;
assign pld_ctr[2] = pld_ctr2;
assign pld_ctr3 = pld_ctr[3];
assign pld_ctr[4] = pld_ctr4;

/**********
* Clocks
**********/

wire osc6m;
wire osc8m;
wire osc24m;
wire osc48m_out;
wire osc96m;
wire global_reset;

wire main_clk = osc96m;
wire search_clk = osc8m;
wire jtag_clk = osc96m; //osc8m;
wire buffer_clk = osc6m; //osc48m_out;
/*
wire main_clk = osc48m_out; // osc96m;
wire search_clk = osc24m; //osc48m_out;
wire jtag_clk = osc6m; // osc96m;
wire buffer_clk = osc24m; //osc48m_out;
*/
assign mcu_osc = osc8m;
assign usb_osc = osc6m & usb_connect;

clock_manager u0 (
.osc48m (osc48m),
.osc32k (osc32k),
.osc8m (osc8m),
.osc6m (osc6m),
.osc24m (osc24m),
.osc48m_out (osc48m_out),
.osc96m (osc96m),
.reset (global_reset)
);

/**********
* Mode control
* 0 direct
* 1 progarm
* 2 pc_poll
* 3 pc_poll_no_lookup
**********/
wire [1:0] mode_input = pld_ctr[1:0];
wire mode_select = pld_ctr[2];
/*
wire [1:0] mode;

mode_selector u1 (
.reset (global_reset),
.mode_input (mode_input),
.select (mode_select),
.mode (mode)
);
*/

/**********
* io
**********/

wire [15:0] func_data;
wire [15:0] pc_data = func_data;
wire shift_tdi;
wire shift_tms;
wire shift_tck;
//wire shift_tdo;
wire [1:0] mode;
wire mode_reset;

io_controller u2 (
// inputs
.reset (global_reset),
.mode_select (mode_select),
.mode_input (mode_input),
.clk (main_clk),
.mote_tdo (mote_tdo),
.shift_tdi (shift_tdi),
.shift_tms (shift_tms),
.shift_tck (shift_tck),
.func_data (func_data),
.pc_data (pc_data),

// outputs
.mote_tdi (mote_tdi),
.mote_tms (mote_tms),
.mote_tck (mote_tck),
.mode (mode),
.mode_reset (mode_reset),

// inout
.pld_data (pld_data)
);

/**********
* jtag
**********/

wire rts;
assign pld_ctr[3] = rts;
wire cts = pld_ctr[4];
wire load_clk = pld_ctr[4];

jtag_controller u3 (
// inputs
.reset (mode_reset),
.mode (mode),
.clk (main_clk),
.load_clk (load_clk),
.search_clk (search_clk),
.jtag_clk (jtag_clk),
.buffer_clk (buffer_clk),
.tdo (mote_tdo),
.data_in (pld_data),
.cts (cts),

// outputs
.tdi (shift_tdi),
.tms (shift_tms),
.tck (shift_tck),
.data_out (func_data),
.rts (rts)
);

endmodule

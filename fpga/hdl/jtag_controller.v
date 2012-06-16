/**
 * jtag_controller.v
 * Purpose: High level control of the JTAG interface.
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

module jtag_controller(
    reset,
    mode,
    clk,
    load_clk,
    search_clk,
    jtag_clk,
    buffer_clk,
    tdo,
    data_in,
    cts,

    tdi,
    tms,
    tck,
    data_out,
    rts
);

input reset;
input [1:0] mode;
input clk;
input load_clk;
input search_clk;
input jtag_clk;
input buffer_clk;
input tdo;
input [15:0] data_in;
input cts;

output tdi;
output tms;
output tck;
output [15:0] data_out;
output rts;

wire [15:0] pc_poll_data;
wire [15:0] search_result;
wire search_done;
wire pc_poll_done;
reg pc_poll_enable = 0;
reg load_enable = 0;
reg search_enable = 0;
reg output_buffer_enable = 0;

jtag_pc_poll u0 (
//jtag_watchpoint_poll u0(
// inputs
.reset (reset),
.enable (pc_poll_enable),
.clk (jtag_clk),
.tdo (tdo),

// outputs
.data (pc_poll_data),
.poll_done (pc_poll_done),
.tdi (tdi),
.tms (tms),
.tck (tck)
);

mem_manager u1 (
// inputs
.reset (reset),
.load_reset (reset),
.load_enable (load_enable),
.load_clk (load_clk),
.load_data (data_in[15:0]),
.search_reset (pc_poll_done),
.search_enable (search_enable),
.search_clk (pc_poll_done), //(search_clk),
.find (pc_poll_data),

// outputs
.result (search_result),
.done (search_done)
);

reg [15:0] last_result = 0;
reg new_result = 0;
wire load_next = search_done & new_result;

always @(posedge search_done)
begin
    if (search_result != last_result)
    begin
        new_result <= 1;
    end else begin
        new_result <= 0;
    end
    last_result <= search_result;
end

output_buffer u2 (
// inputs
.reset (reset),
.enable (output_buffer_enable),
.clk (buffer_clk),
.input_data (search_result),
.load_next (load_next),
.cts (cts),

// outputs
.output_data (data_out),
.rts (rts)
);

always @(posedge clk)
begin
    if (reset)
    begin
        case(mode)
            0: // direct
            begin
                load_enable <= 0;
                pc_poll_enable <= 0;
                search_enable <= 0;
                output_buffer_enable <= 0;
            end
			1: // program
            begin
                load_enable <= 1;
                pc_poll_enable <= 0;
                search_enable <= 0;
                output_buffer_enable <= 0;
            end
            2: // pc_poll
            begin
                load_enable <= 0;
                pc_poll_enable <= 1;
                search_enable <= 1;
                output_buffer_enable <= 1;
            end
            3: // pc_poll_no_lookup
            begin
                load_enable <= 0;
                pc_poll_enable <= 1;
                search_enable <= 0;
                output_buffer_enable <= 0;
            end
        endcase
    end
end

endmodule

/**
 * io_controller.v
 * Purpose: Responsible for general IO.
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

module io_controller(
    reset,
    mode_select,
    mode_input,
    clk,
    mote_tdo,
    shift_tdi,
    shift_tms,
    shift_tck,
    func_data,
    pc_data,

    mote_tdi,
    mote_tms,
    mote_tck,
    mode,
    mode_reset,

    pld_data
);

input reset;
input mode_select;
input [1:0] mode_input;
input clk;
input mote_tdo;
input shift_tdi;
input shift_tms;
input shift_tck;
input [15:0] func_data;
input [15:0] pc_data;

output mote_tdi;
output mote_tms;
output mote_tck;
output reg [1:0] mode;
output reg mode_reset;

inout [15:0] pld_data;

reg io_saved;
reg mode0;
reg mode1;
reg mode2;
reg mode3;
reg saved_tdi;
reg saved_tms;
reg saved_tck;

reg [1:0] next_state;

always @(posedge reset or posedge clk)
begin
    if (reset)
    begin
        mode_reset <= 0;
        io_saved <= 0;
        mode0 <= 1;
        mode1 <= 0;
        mode2 <= 0;
        mode3 <= 0;
        saved_tdi <= 0;
        saved_tms <= 0;
        saved_tck <= 0;
        mode <= 0;
        next_state <= 0;
    end
    else if (mode_select)
    begin
    	if (next_state == 0)
        begin
            saved_tdi <= mote_tdi;
            saved_tms <= mote_tms;
            saved_tck <= mote_tck;
            next_state <= 1;
        end
        else if (next_state == 1)
        begin
            io_saved <= 1;
            mode <= mode_input;
            next_state <= 2;
        end else begin
            mode_reset <= 1;
            mode0 <= (mode == 0) ? 1 : 0;
            mode1 <= (mode == 1) ? 1 : 0;
            mode2 <= (mode == 2) ? 1 : 0;
            mode3 <= (mode == 3) ? 1 : 0;
            next_state <= 3;
        end
    end else begin
        io_saved <= 0;
        mode_reset <= 0;
        next_state <= 0;
    end
end

assign pld_data[15:0] =
    (io_saved) ? 16'bzzzzzzzzzzzzzzzz :
    ((mode0) ? {5'bzzzzz, mote_tdo, 10'bzzzzzzzzzz} :
    ((mode1) ? 16'bzzzzzzzzzzzzzzzz :
    ((mode2) ? func_data :
    ((mode3) ? pc_data :
    {5'bzzzzz, mote_tdo, 10'bzzzzzzzzzz} ))));

assign mote_tck =
    (io_saved) ? saved_tck :
    ((mode0) ? pld_data[11] :
    ((mode1) ? saved_tck :
    ((mode2) ? shift_tck :
    ((mode3) ? shift_tck :
    pld_data[11] ))));

assign mote_tdi =
    (io_saved) ? saved_tdi :
    ((mode0) ? pld_data[9] :
    ((mode1) ? saved_tdi :
    ((mode2) ? shift_tdi :
    ((mode3) ? shift_tdi :
    pld_data[9] ))));

assign mote_tms =
    (io_saved) ? saved_tms :
    ((mode0) ? pld_data[8] :
    ((mode1) ? saved_tms :
    ((mode2) ? shift_tms :
    ((mode3) ? shift_tms :
    pld_data[8] ))));

endmodule

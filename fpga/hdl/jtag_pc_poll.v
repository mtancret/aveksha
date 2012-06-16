/**
 * jtag_pc_poll.v
 * Purpose: Implementation of pc polling.
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

module jtag_pc_poll(
    reset,
    enable,
    clk,
    tdo,

    data,
    poll_done,
    tdi,
    tms,
    tck
);

input reset;
input enable;
input clk;
input tdo;

output reg [15:0] data;
output reg poll_done = 0;
output tdi;
output tms;
output tck;

reg [15:0]shift_data_in;
reg shift_mode;
reg shift_reset = 0;
reg [2:0] next_state;
wire [15:0] shift_data_out;
wire shift_done;

jtag_shift u0 (
.data_in (shift_data_in[15:0]),
.mode (shift_mode),
.reset (shift_reset),
.enable (enable),
.clk (clk),
.tdo (tdo),

.data_out (shift_data_out[15:0]),
.done (shift_done),
.tck (tck),
.tms (tms),
.tdi (tdi) 
);

always @(posedge reset or posedge clk) begin
    if (reset)
    begin
        shift_data_in[15:0] <= 16'h0084;
        shift_reset <= 1;
		shift_mode <= 0;
		poll_done <= 0;
        next_state <= 0;
	end
    else if (enable)
    begin
		case(next_state)	
			0:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h0000;
                    shift_mode <= 1;
					next_state <= 1;
				end else begin
					next_state <= 0;
				end
			end
			1:
			begin
				shift_reset <= 1;
				next_state <= 2;
			end
			2:
			begin
				shift_reset <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h0084;
                    data <= shift_data_out;
                    shift_mode <= 0;
					next_state <= 3;
				end else begin
					next_state <= 2;
				end
			end
			3:
			begin
				shift_reset <= 1;
				poll_done <= 1;
				next_state <= 0;
			end
            default: // 7
            begin
                next_state <= 7;
            end
		endcase
	end		
end // always

endmodule

/**
 * jtag_watchpoint_poll.v
 * Purpose: Implementation of watchpoint polling.
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

module jtag_watchpoint_poll(
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
reg [4:0] next_state;
reg [7:0] current_address;
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
        shift_data_in[15:0] <= 16'h0009;
        current_address <= 8'h00;
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
                    shift_data_in[15:0] <= 16'h009A;
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
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= { 8'h00, (current_address | 2) };
                    shift_mode <= 1;
					next_state <= 3;
				end else begin
					next_state <= 2;
				end
			end
			3:
			begin
				shift_reset <= 1;
				next_state <= 4;
			end
            4:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h0009;
                    shift_mode <= 0;
					next_state <= 5;
				end else begin
					next_state <= 4;
				end
			end
			5:
			begin
				shift_reset <= 1;
				next_state <= 6;
			end
            6:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h009D;
                    shift_mode <= 1;
					next_state <= 7;
				end else begin
					next_state <= 6;
				end
			end
			7:
			begin
				shift_reset <= 1;
				next_state <= 8;
			end
            8:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h0000;
                    shift_mode <= 1;
					next_state <= 9;
				end else begin
					next_state <= 8;
				end
			end
			9:
			begin
				shift_reset <= 1;
				next_state <= 10;
			end
            10:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h0009;
                    shift_mode <= 0;
					next_state <= 11;
				end else begin
					next_state <= 10;
				end
			end
			11:
			begin
				shift_reset <= 1;
				next_state <= 12;
			end
            12:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h009D;
                    shift_mode <= 1;
					next_state <= 13;
				end else begin
					next_state <= 12;
				end
			end
			13:
			begin
				shift_reset <= 1;
				next_state <= 14;
			end
            14:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h0000;
                    shift_mode <= 1;
					next_state <= 15;
				end else begin
					next_state <= 14;
				end
			end
			15:
			begin
				shift_reset <= 1;
				next_state <= 16;
			end
            16:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h0009;
                    shift_mode <= 0;
                    if (shift_data_out[0] == 1'b1)
                    begin
					    next_state <= 0;
                    end else begin
					    next_state <= 17;
                    end
				end else begin
					next_state <= 16;
				end
			end
			17:
			begin
				shift_reset <= 1;
				next_state <= 18;
			end



            18:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h009A;
                    shift_mode <= 1;
					next_state <= 19;
				end else begin
					next_state <= 18;
				end
			end
			19:
			begin
				shift_reset <= 1;
				next_state <= 20;
			end
            20:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= { 8'h00, current_address };
                    shift_mode <= 1;
					next_state <= 21;
				end else begin
					next_state <= 20;
				end
			end
			21:
			begin
				shift_reset <= 1;
				next_state <= 22;
			end
            22:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h0009;
                    shift_mode <= 0;
					next_state <= 23;
				end else begin
					next_state <= 22;
				end
			end
			23:
			begin
				shift_reset <= 1;
				next_state <= 24;
			end
            24:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h009D;
                    shift_mode <= 1;
					next_state <= 25;
				end else begin
					next_state <= 24;
				end
			end
			25:
			begin
				shift_reset <= 1;
				next_state <= 26;
			end
            26:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h0000;
                    shift_mode <= 1;
					next_state <= 27;
				end else begin
					next_state <= 26;
				end
			end
			27:
			begin
				shift_reset <= 1;
				next_state <= 28;
			end
            28:
			begin
				shift_reset <= 0;
                poll_done <= 0;
				if (shift_done) begin
                    shift_data_in[15:0] <= 16'h0009;
                    data <= shift_data_out;
                    shift_mode <= 0;
					next_state <= 29;
				end else begin
					next_state <= 28;
				end
			end
			29:
			begin
				shift_reset <= 1;
                poll_done <= 1;
                if (current_address == 28)
                begin
                    current_address <= 0;
                end else begin
                    current_address <= current_address + 4;
                end
				next_state <= 0;
			end
            default: // 30
            begin
                next_state <= 30;
            end
		endcase
	end		
end // always

endmodule

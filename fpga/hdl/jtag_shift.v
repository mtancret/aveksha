/**
 * jtag_shift.v
 * Purpose: Implementation of shift_ir and shift_dr16.
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

/* Shift jtag data, either shift_ir or shift_dr16 depending on mode.
   initial. Settings when module is not is use.
      inputs:
      data_in  = -
      mode     = -
      reset    = -
      enable   = 0
      clk    = -
      outputs:
      data_out = undef
      done     = undef
      next state: 1
   1. Prepare reset with data and mode.
      inputs:
      data_in  = 8 or 16 bits of data
      mode     = 0 or 1
      reset    = 1
      enable   = 1
      clk    = 0
      outputs:
      data_out = undef
      done     = undef
      next state: 2
   2. Preform reset.
      inputs:
      data_in  = do not change until done
      mode     = do not change until done
      reset    = 1
      enable   = 1
      clk    = rising edge
      outputs:
      data_out = undef
      done     = 0
      next state: 3
   3. Loop util done
      inputs:
      data_in  = do not change until done
      mode     = do not change until done
      reset    = 0
      enable   = 1
      clk    = rising edge
      outputs:
      data_out = undef
      done     = 0
      next state: if done then 4 else 3
   4. Done.
      inputs:
      data_in  = -
      mode     = -
      enable   = -
      clk    = -
      outputs:
      data_out = 8 or 16 bits of data
      done     = 1
      next state: initial
      
*/
module jtag_shift(
    data_in,
    mode,
    reset,
    enable,
    clk,
    tdo,

    data_out,
    done,
    tck,
    tms,
    tdi,
);
/* 16-bits to shift into jtag device, for
   8-bit transfers use bits [7:0] */
input [15:0] data_in;
reg [15:0] data_in_reg;
/* 0: shift_ir
   1: shift_dr16 */
input mode;
/* reset module on positive edge */
input reset;
/* enable module */
input enable;
/* clk for module */
input clk;
input tdo;

/* 16-bits shifted out of jtag device, for
   8-bit transfers only bits [8:15] valid. */
output reg [15:0] data_out;
output reg done = 0;
output reg tck;
output reg tms;
output reg tdi;

reg [4:0] next_state;
reg [4:0] bit_count;

always @(posedge reset or posedge clk)
begin
	if (reset)
	begin
        tms <= 0;
		tck <= 1;
		tdi <= 1;
		done <= 0;
        data_out <= 16'h00;
        data_in_reg <= data_in;
		next_state <= 0;
	end
	else if (enable)
	begin
		case(next_state)
			0:
			begin
				tms <= 1;
                tck <= 0;
				tdi <= 1;
				next_state <= 1;
			end
			1:
			begin
				tms <= 1;
                tck <= 1;
				tdi <= 1;
				if (mode)
				begin // shift_dr skips second tck during tms high
					next_state <= 4;
				end else begin // shift_ir has two tck during tms high
					next_state <= 2;
				end
			end
			2:
			begin
				tms <= 1;
                tck <= 0;
				tdi <= 1;
				next_state <= 3;
			end
			3:
			begin
				tms <= 1;
                tck <= 1;
				tdi <= 1;
				next_state <= 4;
			end
			4:
			begin
				tms <= 0;
                tck <= 0;
				tdi <= 1;
				next_state <= 5;
			end
			5:
			begin
				tms <= 0;
                tck <= 1;
				tdi <= 1;
				next_state <= 6;
			end
			6:
			begin
				tms <= 0;
                tck <= 0;
				tdi <= 1;
                bit_count <= 0;
				if (mode)
				begin // shift_dr
					next_state <= 7;
				end else begin // shift_ir
					next_state <= 9;
				end
			end
			
            
            7:
			begin
                tdi <= tdi;
                if (bit_count == 16)
                begin
				    tms <= 1;
                    tck <= 1;
                end else begin
                    tms <= 0;
                    tck <= 1;
                end
				next_state <= 8;
			end
			8:
			begin
                tck <= 0;
				
			    tdi <= data_in_reg[15];
                data_in_reg <= data_in_reg << 1;
                data_out <= (data_out[15:0] << 1) | { 15'b000000000000000, tdo};
                
                if (bit_count == 15)
				begin
                    tms <= 1;
					next_state <= 7;
				end
                else if (bit_count == 16) 
                begin
                    tms <= 1;
                    tdi <= 1;
					next_state <= 11;
				end else begin
                    tms <= 0;
                    next_state <= 7;
                end
                bit_count <= bit_count + 1;
			end


            9:
			begin
                tdi <= tdi;
				if (bit_count == 8)
                begin
				    tms <= 1;
                    tck <= 1;
                end else begin
                    tms <= 0;
                    tck <= 1;
                end
				next_state <= 10;
			end
			10:
			begin
                tck <= 0;
				
			    tdi <= data_in_reg[0];
                data_in_reg <= data_in_reg >> 1;
                data_out <= (data_out >> 1) | {8'b00000000, tdo, 7'b0000000};
                
                if (bit_count == 7)
				begin
                    tms <= 1;
					next_state <= 9;
				end
                else if (bit_count == 8)
                begin
                    tms <= 1;
                    tdi <= 1;
					next_state <= 11;
				end else begin
                    tms <= 0;
                    next_state <= 9;
                end
                bit_count <= bit_count + 1;
			end

            
            11:
			begin
				tms <= 1;
                tck <= 1;
                tdi <= tdi;
				next_state <= 12;
			end
			default: // 12:
			begin
                tms <= 0;
				tck <= 0;
				tdi <= 1;
				done <= 1;
				next_state <= 12;
			end
		endcase
	end
end

endmodule

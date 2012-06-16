/**
 * program_table_loader.v
 * Purpose: Loads the function table into memory.
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

module program_table_loader(
    reset,
    enable,
    clock,
    
    write_en,
    write_addr,
    write_clk
);

input reset;
input enable;
input clock;

output reg write_en = 1;
output reg [9:0] write_addr;
output reg write_clk;

reg next_state = 0;

always @(posedge reset or posedge clock)
begin
    if (reset)
    begin
        write_addr <= 10'h000;
        write_clk <= 0;
        next_state <= 0;
    end
    else if (enable)
    begin
         case(next_state)
			0:
			begin
                write_clk <= 1;
                next_state <= 1;
            end
            1:
            begin
                write_clk <= 0;
                write_addr <= write_addr + 1;
                next_state <= 0;
            end
        endcase
    end
end

endmodule

/**
 * function_search.v
 * Purpose: Performs binary search for function pointer.
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

// Algorithm in Python code:
// #!/usr/bin/python
// list = [1,4,5,10,14,20,23,34,36,45]
//
// for find in range(48):
//	min = 0
//	max = len(list)-1
//	lower = 0
//
//	while min <= max:
//		mid = min + ((max - min) >> 1)
//
//		current = list[mid]
//
//		if find > current:
//			min = mid + 1
//			lower = current
//		elif find < current:
//			max = mid - 1
//		else: # find == current:
//			lower = current
//			break
//	print find, lower

module function_search(
    find,
    reset,
    enable,
    clk,

    result,
    done,
    read_data,
    read_addr,
    read_en,
    read_clk
);

input [15:0] find;
input reset;
input enable;
input clk;
input [15:0] read_data;

output reg [15:0] result;
output reg done = 0;
output [9:0] read_addr;
output reg read_en = 0;
output reg read_clk = 0;

reg [1:0] next_state;
reg [9:0] min;
reg [9:0] mid;
reg [9:0] max;

assign read_addr = mid;

reg counting;
always @(posedge reset or posedge clk)
begin
    if (reset)
    begin
        min <= 10'h000;
        mid <= 10'h1FF;
        max <= 10'h3FF;
        done <= 0;
        read_en <= 0;
        read_clk <= 0;
        next_state <= 0;
    end else if (enable) begin
        case(next_state)
            0:
            begin
                if (max < min || mid == 0)
                begin
                    result <= read_data;
                    done <= 1;
                    next_state <= 3;
                end else begin
                    mid <= min + ((max - min) >> 1);
                    read_en <= 1;
                    read_clk <= 0;
                    next_state <= 1;
                end
            end
            1:
            begin
                read_clk <= 1;
                next_state <= 2;
            end
            2:
            begin
                if (find > read_data)
                begin
                    min <= mid + 1;
                    result <= read_data;
                    next_state <= 0;
                end
                else if (find < read_data)
                begin
                    max <= mid - 1;
                    next_state <= 0;
                end else begin
                    result <= read_data;
                    done <= 1;
                    next_state <= 3;
                end
            end
            default:
            begin
            end
        endcase
    end
end

endmodule

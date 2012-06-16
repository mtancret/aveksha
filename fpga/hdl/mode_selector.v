/**
 * mode_selector.v
 * Purpose: Select operating mode.
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

module mode_selector(
    reset,
	mode_input,
	select,

	mode
);

input [1:0] mode_input;
input select;

output reg [1:0] mode;

always @(posedge reset or posedge select)
begin
    if (reset)
    begin
        mode <= 0;
    end else begin
        mode <= mode_input;
    end
end

endmodule

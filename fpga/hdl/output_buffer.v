/**
 * output_buffer.v
 * Purpose: Buffer data going to MCU.
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

module output_buffer (
    reset,
    enable,
    clk,
    input_data,
    load_next,
    cts,

    output_data,
    rts
);

input reset;
input enable;
input clk;
input [15:0] input_data;
input load_next;
input cts;

output reg [15:0] output_data;
output reg rts;

always @(posedge clk)
begin
    if (reset)
    begin
        output_data <= 0;
        rts <= 0;
    end
    else if (enable)
    begin
        
        //rts <= load_next;
        //output_data <= input_data;
    
        if (/*~cts &*/ (output_data != input_data))
        begin
            output_data <= input_data;
            rts <= 1;
        end
        else /*if (cts)*/
        begin
            rts <= 0;
        end
    
        //if (/*load_next &*/ ~cts)
        //begin
        //    output_data <= input_data;
            //output_data <= output_data + 1;
        //end
    end
end

endmodule

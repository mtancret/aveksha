/**
 * mem_manager.v
 * Purpose: Memory is used to hold the function search table.
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

module mem_manager(
    reset,
    load_reset,
    load_enable,
    load_clk,
    load_data,
    search_reset,
    search_enable,
    search_clk,
    find,

    result,
    done
);

input reset;
input load_reset;
input load_enable;
input load_clk;
input [15:0] load_data;
input search_reset;
input search_enable;
input search_clk;
input [15:0] find;

output [15:0] result;
output done;

wire [15:0] rd;
wire wen;
wire ren;
wire [9:0] waddr;
wire [9:0] raddr;
wire wclk;
wire rclk;

program_table_mem u0 (
.WD (load_data),
.RD (rd),
.WEN (wen),
.REN (ren),
.WADDR (waddr),
.RADDR (raddr),
.WCLK (wclk),
.RCLK (rclk)
);

program_table_loader u1 (
.reset (load_reset),
.enable (load_enable),
.clock (load_clk),
.write_en (wen),
.write_addr (waddr),
.write_clk (wclk)
);

function_search u2 (
.find (find),
.enable (search_enable),
.reset (reset), //(search_reset),
.clk (search_clk),
.result (result),
.done (done),
.read_data (rd),
.read_addr (raddr),
.read_en (ren),
.read_clk (rclk)
);

endmodule

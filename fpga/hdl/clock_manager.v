/**
 * clock_manager.v
 * Purpose: Divide 48Mhz source clock into required subclocks.
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

module clock_manager(
    osc48m,
    
    osc32k,
    osc4m,
    osc6m,
    osc8m,
    osc12m,
    osc24m,
    osc48m_out,
    osc96m,
    reset
);

input osc48m;

output osc32k;
assign osc32k = osc4m;
output reg osc4m = 0;
output osc6m;
output osc8m;
output reg osc12m = 0;
output reg osc24m = 0;
output reg osc48m_out = 0;
output osc96m;
output reg reset;

clocks u0 (
.POWERDOWN (1'b1),
.CLKA (osc48m),
//.LOCK (),
.GLA (osc6m),
.GLB (osc8m),
.GLC (osc96m)
);

always @(posedge osc96m)
begin
    if (osc48m_out)
    begin
        osc48m_out <= 0;
    end else begin
        osc48m_out <= 1;
    end
end

always @(posedge osc48m_out)
begin
    if (osc24m)
    begin
        osc24m <= 0;
    end else begin
        osc24m <= 1;
    end
end

always @(posedge osc24m)
begin
    if (osc12m)
    begin
        osc12m <= 0;
    end else begin
        osc12m <= 1;
    end
end

always @(posedge osc8m)
begin
    if (osc4m)
    begin
        osc4m <= 0;
    end else begin
        osc4m <= 1;
    end
end

reg [7:0] init = 8'h00;

always @(posedge osc96m)
begin
    if (init != 8'hFF)
    begin
        reset <= 1;
        init <= 8'hFF;
    end else begin
        reset <= 0;
    end
end

endmodule

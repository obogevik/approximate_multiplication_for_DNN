`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 26.01.2022 15:49:20
// Design Name:
// Module Name: final_summation
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module final_summation#(
    parameter INPUTWIDTH = 16,
    parameter TRUNCATED_BITS = 0,
    parameter LEASTSIGNIFCOL = 0
)(
    input logic [(INPUTWIDTH-1):LEASTSIGNIFCOL]pp_accum [1:0],
    output logic [INPUTWIDTH-1:TRUNCATED_BITS] r
    );
    logic [INPUTWIDTH:0] carry, r_temp;

    generate;
            half_adder half_adder(
                .a  (pp_accum[1][LEASTSIGNIFCOL]),
                .b  (pp_accum[0][LEASTSIGNIFCOL]),
                .s(r_temp[LEASTSIGNIFCOL]),
                .co (carry[LEASTSIGNIFCOL+1])
            );
        for(genvar i = LEASTSIGNIFCOL+1; i < INPUTWIDTH; i++) begin : adder_gen
            full_adder full_adder(
                .a  (pp_accum[1][i]),
                .b  (pp_accum[0][i]),
                .ci (carry[i]),
                .s(r_temp[i]),
                .co (carry[i+1])
            );
        end
    endgenerate
    assign r = r_temp[INPUTWIDTH-1:TRUNCATED_BITS];
endmodule

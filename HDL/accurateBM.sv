`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 25.01.2022 08:13:20
// Design Name:
// Module Name: accurateBM
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


module accurateBM(
    input logic [`BITWIDTH-1:0] a,
    input logic [`BITWIDTH-1:0] b,
    output logic [2*`BITWIDTH-1:0] r
    );

    logic [(`BITWIDTH/2)-1:0] corr;
    logic [`BITWIDTH:0] pp_array [(`BITWIDTH/2)-1:0];
    logic [((2*`BITWIDTH)-1):0] pp_accum [1:0];
    logic [(`BITWIDTH/2)+1:0] pp_reord [((2*`BITWIDTH)-1):0];
    `include "accurateBM.svh"

    generate_pp_row#(
        .BITWIDTH(`BITWIDTH)
    ) generate_pp_row (
        .a(a),
        .b(b),
        .pp_array(pp_array),
        .corr(corr)
    );

    pp_reorder #(
        .pps(pps), .plusone(plusone)
    )pp_reorder(
        .pp_array(pp_array),
        .corr(corr),
        .pp_reord(pp_reord)
    );

    accumulate_pp#(
        .pps(pps), .plusone(plusone), .co_size(co_size), .ci_size(ci_size)
    ) accumulate_pp(
        .pp_reord(pp_reord),
        .pp_accum(pp_accum)
    );

    final_summation #(
        .INPUTWIDTH(2*`BITWIDTH),
        .TRUNCATED_BITS(0)
    )final_summation(
        .pp_accum(pp_accum),
        .r(r)
    );
endmodule

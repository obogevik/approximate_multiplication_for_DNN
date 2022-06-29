`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 15.02.2022 12:51:43
// Design Name:
// Module Name: JFM
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
`include "ApproximateMultiplier.svh"


module JFM(
    input logic [`BITWIDTH-1:0] a,
    input logic [`BITWIDTH-1:0] b,
    output logic [`BITWIDTH-1:0] r
    );

    logic [(`BITWIDTH/2)-1:0] corr;
    logic [`BITWIDTH:0] pp_array [(`BITWIDTH/2)-1:0];
    logic [((2*`BITWIDTH)-1):`BITWIDTH] pp_accum [1:0];
    logic [(`BITWIDTH/2)+1:0] pp_reord [((2*`BITWIDTH)-1):0];
    `include "JFM.svh"

    generate_pp_row#(
        .BITWIDTH(`BITWIDTH)
    ) generate_pp_row (
        .a(a),
        .b(b),
        .pp_array(pp_array),
        .corr(corr)
    );

    pp_reorder #(
        .pps(pps), .plusone(plusone), .JFM(1)
    )pp_reorder(
        .pp_array(pp_array),
        .corr(corr),
        .pp_reord(pp_reord)
    );

    accumulate_pp#(
        .pps(pps), .plusone(plusone), .co_size(co_size),
        .ci_size(ci_size), .LEASTSIGNIFCOL(`BITWIDTH), .JFM(1)
    ) accumulate_pp(
        .pp_reord(pp_reord),
        .pp_accum(pp_accum)
    );

    final_summation #(
        .INPUTWIDTH(`BITWIDTH*2),
        .TRUNCATED_BITS(`BITWIDTH),
        .LEASTSIGNIFCOL(`BITWIDTH)
    )final_summation(
        .pp_accum(pp_accum),
        .r(r[`BITWIDTH-1:0])
    );
endmodule

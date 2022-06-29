`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 19.03.2022 15:04:55
// Design Name:
// Module Name: OSFMult
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

module OSFMult (
    input logic [1:0]shift_possible,
    input logic [`OSFM_BITWIDTH_I-1:0] a,
    input logic [`OSFM_BITWIDTH_I-1:0] b,
    output logic [2*`OSFM_BITWIDTH_I-1:0] r
    );

    logic [(`OSFM_BITWIDTH_I/2)-1:0] corr;
    logic [`OSFM_BITWIDTH_I:0] pp_array [(`OSFM_BITWIDTH_I/2)-1:0];
    logic [((2*`OSFM_BITWIDTH_I)-1):0] pp_accum [1:0];
    logic [(`OSFM_BITWIDTH_I/2)+1:0] pp_reord [((2*`OSFM_BITWIDTH_I)-1):0];

    `include "OSFM.svh"

    generate_pp_row#(
        .BITWIDTH(`OSFM_BITWIDTH_I)
    ) generate_pp_row (
        .a(a),
        .b(b),
        .pp_array(pp_array),
        .corr(corr)
    );

    OSFMreorder #(
        .pps(pps), .plusone(plusone), .SHIFTDISTANCE(`SHIFTDISTANCE)
    )OSFMreorder(
        .pp_array(pp_array),
        .corr(corr),
        .shift_possible(shift_possible),
        .pp_reord(pp_reord)
    );

    OSFMaccumulate_pp#(
        .pps(pps), .plusone(plusone), .co_size(co_size), .ci_size(ci_size)
    ) OSFMaccumulate_pp(
        .pp_reord(pp_reord),
        .pp_accum(pp_accum)
    );

    final_summation #(
        .INPUTWIDTH(2*`OSFM_BITWIDTH_I),
        .TRUNCATED_BITS(0)
    )final_summation(
        .pp_accum(pp_accum),
        .r(r)
    );
endmodule
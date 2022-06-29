`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 19.03.2022 12:09:00
// Design Name:
// Module Name: OSFM
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
// Operand Shifted Fixed-Width Multiplier
// A novel approach by Olav Bogevik
// (alternative name "Olav's Superior Fixed-Width Multiplier" haha)
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`include "ApproximateMultiplier.svh"

module OSFM(
    input logic [`BITWIDTH-1:0] a,
    input logic [`BITWIDTH-1:0] b,
    output logic [`BITWIDTH-1:0] r
    );
    logic [1:0]shift_possible;
    logic [`OSFM_BITWIDTH_I-1:0]shifted_a, shifted_b;
    logic [2*(`OSFM_BITWIDTH_I)-1:0]shifted_r;

    lowinputdetector lowinputdetector_a(
        .msbinput(a[`BITWIDTH-1:`OSFM_BITWIDTH_I-1]),
        .shift_possible(shift_possible[1])
    );

    lowinputdetector lowinputdetector_b(
        .msbinput(b[`BITWIDTH-1:`OSFM_BITWIDTH_I-1]),
        .shift_possible(shift_possible[0])
    );

    Inputshifter Shifter_a (
        .shiftin(a),
        .shift_possible(shift_possible[1]),
        .shiftout(shifted_a)
    );

    Inputshifter Shifter_b (
        .shiftin(b),
        .shift_possible(shift_possible[0]),
        .shiftout(shifted_b)
    );

    OSFMult OSFMult (
        .shift_possible(shift_possible),
        .a(shifted_a),
        .b(shifted_b),
        .r(shifted_r)
    );
//idea: output shift before final addition in OSFMult? will have narrower final adder but more MUXes
//improvement: truncate bits in final adder file(like with DTM) instead of in the outputshifter? probably removed in synthesis anyway
    Outputshifter Outputshifter(
        .shiftin(shifted_r),
        .shift_possible(shift_possible),
        .shiftout(r)
    );
endmodule

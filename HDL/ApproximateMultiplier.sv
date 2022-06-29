`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 07.02.2022 23:00:32
// Design Name:
// Module Name: ApproximateMultiplier
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

module ApproximateMultiplier(
    input logic [`BITWIDTH-1:0] a,
    input logic [`BITWIDTH-1:0] b,
`ifdef accBM
    output logic [2*`BITWIDTH-1:0] r
`else // Fixed-width output
    output logic [`BITWIDTH-1:0] r
`endif
    );
    `ifdef accBM
        accurateBM accurateBM (
            .a(a),
            .b(b),
            .r(r)
        );
    `elsif PTM
        PTM PTM (
            .a(a),
            .b(b),
            .r(r)
        );
    `elsif DTM
        DTM DTM (
            .a(a),
            .b(b),
            .r(r)
        );
    `elsif JFM
        JFM JFM (
            .a(a),
            .b(b),
            .r(r)
        );
    `elsif OSFM 
        OSFM OSFM (
            .a(a),
            .b(b),
            .r(r)
        );
    `endif
endmodule

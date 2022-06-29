`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 19.03.2022 10:20:27
// Design Name:
// Module Name: Inputshifter
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

module Inputshifter(
    input logic [`BITWIDTH-1:0] shiftin,
    input logic shift_possible,
    output logic [`OSFM_BITWIDTH_I-1:0] shiftout
    );

    // 2 input mux with shift_possible as select
    // if shift_possible output lower part of input
    // else output upper part of input, and in practice ignore/truncate lower bits
    assign shiftout = shift_possible ? shiftin[`OSFM_BITWIDTH_I-1:0] : {shiftin[`BITWIDTH-1:`SHIFTDISTANCE+1],shiftin[`SHIFTDISTANCE]||shiftin[`SHIFTDISTANCE-1]};
    // Comment: Setting lsb of shiftout when shift_possible==0 to 1'b1 seems to give better emean, but OR solution gives better overall and less max error.
    // the idea it to reduce rounding error when shifting
endmodule

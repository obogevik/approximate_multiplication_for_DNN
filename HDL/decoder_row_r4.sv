`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 25.01.2022 10:12:19
// Design Name:
// Module Name: decoder_row_r4
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


module dec_row_r4#(
    parameter BITWIDTH = 8
)(
    input logic [2:0] encin,
    input logic neg,
    input logic [BITWIDTH-1:0] ain,
    input logic [1:0] bin,
    output logic [BITWIDTH:0] pp
    );
    logic [BITWIDTH:0] ppint;
    logic [BITWIDTH+1:0] a_pad;
    assign a_pad = {ain[BITWIDTH-1],ain,1'b0}; // ainmsb & ain & 0

    assign ppint[0] = ain[0] & encin[2];
    generate
        for(genvar i = 1; i < BITWIDTH+1; i++) begin : dec_gen
            dec_r4 dec_r4(
                .ain   ( a_pad [i      +:2 ]),
                .encin ( encin),
                .neg   ( neg),
                .ppout ( ppint[i])
            );
        end
    endgenerate

    assign pp = {~ppint[BITWIDTH],ppint[BITWIDTH-1:0]};
endmodule

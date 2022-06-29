`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 26.01.2022 11:56:42
// Design Name:
// Module Name: generate_pp_row
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


module generate_pp_row#(
    parameter BITWIDTH = 8
    )(
    input logic [BITWIDTH-1:0] a,
    input logic [BITWIDTH-1:0] b,
    output logic [BITWIDTH:0] pp_array [(BITWIDTH/2)-1:0],
    output logic [(BITWIDTH/2)-1:0]corr
    );
    logic [BITWIDTH:0] b_pad;
    logic [(3*BITWIDTH/2)-1:0] encout; // 3 encoder outputs for every 2 bitwidth
    logic [(BITWIDTH/2)-1:0] neg;
    assign b_pad = {b,1'b0};

    generate
        for(genvar i = 0; i < BITWIDTH; i+=2) begin : enc_gen
            enc_r4 enc_r4(
                .bin    ( b_pad [i      +:3 ]),
                .encout ( encout[3*i/2  +:3 ]),
                .neg    ( neg   [i/2        ])
            );
        end
    endgenerate

    generate
        for(genvar i = 0; i < BITWIDTH; i+=2) begin : dec_row_gen
            dec_row_r4 #(
                .BITWIDTH(BITWIDTH)
            )dec_row_r4(
                .encin  ( encout[3*i/2  +:3 ]),
                .neg    ( neg   [i/2        ]),
                .ain    ( a),
                .bin    ( b_pad [i      +:2 ]),
                .pp     ( pp_array[i/2])
            );
        end
    endgenerate

     generate
        for(genvar i = 0; i < BITWIDTH; i+=2) begin : corr_bit_gen
            corr_bit corr_bit(
                .bin    ( b_pad [i  +:3]),
                .alsb   ( a[0]          ),
                .corr   ( corr  [i/2]   )
            );
        end
    endgenerate
endmodule

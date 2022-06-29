`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 26.01.2022 15:49:20
// Design Name:
// Module Name: OSFMaccumulate_pp
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

module OSFMaccumulate_pp#(
        parameter byte pps [2*`OSFM_BITWIDTH_I-1:0],
        parameter byte plusone[2*`OSFM_BITWIDTH_I-1:0],
        parameter byte co_size[2*`OSFM_BITWIDTH_I-1:0],
        parameter byte ci_size[2*`OSFM_BITWIDTH_I-1:0],
        parameter LEASTSIGNIFCOL = 0,
        parameter JFM = 0
    )(
        input logic [(`OSFM_BITWIDTH_I/2)+1:0] pp_reord [((2*`OSFM_BITWIDTH_I)-1):0],
        output logic [((2*`OSFM_BITWIDTH_I)-1):LEASTSIGNIFCOL]pp_accum [1:0]
    );
    logic [50:0]sum;
    logic [50:0]carry;
    logic [(`OSFM_BITWIDTH_I/2)+1:0] c [((2*`OSFM_BITWIDTH_I)):0];

    if (JFM == 1) assign c[LEASTSIGNIFCOL] = pp_reord[LEASTSIGNIFCOL-1][(pps[LEASTSIGNIFCOL-1]+plusone[LEASTSIGNIFCOL-1])-2:0]; // PPs from LSPPmajor feed directly to the carry in next column

    generate;
        for(genvar i = LEASTSIGNIFCOL; i < (`OSFM_BITWIDTH_I*2); i++) begin  
            if (pps[i]+plusone[i] != 0) begin :
               accum_gen accumulate_pp_column #(
                .plusone(plusone[i]),
                .pps(pps[i]),
                .cis(ci_size[i]), //carry output size from previous column is carry input size to current column
                .cos(co_size[i]),
                .BITWIDTH(`OSFM_BITWIDTH_I)
            )accumulate_pp_column(
                .pp_column(pp_reord[i][(pps[i]+plusone[i])-1:0]),
                .ci(c[i]),
                .co(c[i+1]),
                .s({pp_accum[0][i],pp_accum[1][i]})
            );            
            end
        end
    endgenerate
endmodule

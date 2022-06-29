`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 04.02.2022 14:59:35
// Design Name:
// Module Name: OSFMreorder
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
// Reshapes a square pp_array and correction bits into a pyramid array, and inserts 1 at correct places:
// * * * * * * * * *                  * * * * * * * * *       1 * 1 * * * 1 * * * * * * * * *
// * * * * * * * * *  =>          * * * * * * * * * c     =>      * * 1 * * * * * * * * * c
// * * * * * * * * *          * * * * * * * * * c                     * * * * * * * * c
// * * * * * * * * *      * * * * * * * * * c                             * * * * c
//                      1   1   1   1 1 c                                   1 c
// Each column will have partial products of the same magnitude.
// Data in a column can be accessed by ...
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`include "ApproximateMultiplier.svh"

module OSFMreorder#(
    parameter byte pps [2*`OSFM_BITWIDTH_I-1:0], //pps and plusone is different for every implementation, look in the .svh files
    parameter byte plusone [2*`OSFM_BITWIDTH_I-1:0],
    parameter LEASTSIGNIFCOL = 0,
    parameter JFM = 0,
    parameter SHIFTDISTANCE = 0
)(
        input logic [`OSFM_BITWIDTH_I:0] pp_array [(`OSFM_BITWIDTH_I/2)-1:0],
        input logic [(`OSFM_BITWIDTH_I/2)-1:0]corr,
        input logic [1:0]shift_possible,
        output logic [(`OSFM_BITWIDTH_I/2)+1:0] pp_reord [((2*`OSFM_BITWIDTH_I)-1):0]
    );

        generate
            for(genvar i = 0; i < `OSFM_BITWIDTH_I/2; i++)
            begin
                for(genvar j = 0; j < `OSFM_BITWIDTH_I+1; j++)
                begin
                    if ((pps[j+2*i]+plusone[j+2*i] > 0)) assign pp_reord[j+2*i][i%(pps[j+2*i]+plusone[j+2*i])] = pp_array[i][j];
                    // pp_reord[13][0] = pp_array[3][7];
                end
                if((pps[2*i+1]+plusone[2*i+1]) > 0 && JFM == 0) assign pp_reord[2*i+1][(i+1)%(pps[2*i+1]+plusone[2*i+1])] = corr[i];
                assign pp_reord[`OSFM_BITWIDTH_I+1+2*i][(`OSFM_BITWIDTH_I/2)%(pps[`OSFM_BITWIDTH_I+1+2*i]+plusone[`OSFM_BITWIDTH_I+1+2*i])] = 1'b1;
            end
            assign pp_reord[`OSFM_BITWIDTH_I][`OSFM_BITWIDTH_I/2] = 1'b1;
            if(SHIFTDISTANCE == 0) assign pp_reord[`OSFM_BITWIDTH_I-1][1+(`OSFM_BITWIDTH_I/2)] = 1'b1; //Insert a 1 in the column just below the truncated output to get "round-to-nearest half"
            else begin //This is OSFM only
                assign pp_reord[`OSFM_BITWIDTH_I-SHIFTDISTANCE-1][pps[`OSFM_BITWIDTH_I-SHIFTDISTANCE-1]] = ~(shift_possible[1]||shift_possible[0]);
                assign pp_reord[`OSFM_BITWIDTH_I-1][pps[`OSFM_BITWIDTH_I-1]] = shift_possible[1]^shift_possible[0];
                assign pp_reord[`OSFM_BITWIDTH_I+SHIFTDISTANCE-1][(1 + `OSFM_BITWIDTH_I/2)%(pps[`OSFM_BITWIDTH_I+SHIFTDISTANCE-1]+plusone[`OSFM_BITWIDTH_I+SHIFTDISTANCE-1])] = (shift_possible[1]&&shift_possible[0]);
                //pp_reord[13][(`OSFM_BITWIDTH_I/2)%(pps[`OSFM_BITWIDTH_I+SHIFTDISTANCE-1]+plusone[`OSFM_BITWIDTH_I+SHIFTDISTANCE-1]-1)] = (shift_possible[1]&&shift_possible[0]);
            end
        endgenerate
endmodule

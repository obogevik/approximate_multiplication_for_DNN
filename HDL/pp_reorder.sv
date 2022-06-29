`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 04.02.2022 14:59:35
// Design Name:
// Module Name: pp_reorder
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

module pp_reorder#(
    parameter byte pps [2*`BITWIDTH-1:0], //pps and plusone is different for every implementation, look in the .svh files
    parameter byte plusone [2*`BITWIDTH-1:0],
    parameter LEASTSIGNIFCOL = 0,
    parameter JFM = 0,
    parameter SHIFTDISTANCE = 0
)(
        input logic [`BITWIDTH:0] pp_array [(`BITWIDTH/2)-1:0],
        input logic [(`BITWIDTH/2)-1:0]corr,
        input logic [1:0]shift_possible,
        output logic [(`BITWIDTH/2)+1:0] pp_reord [((2*`BITWIDTH)-1):0]
    );

        generate
            for(genvar i = 0; i < `BITWIDTH/2; i++)
            begin
                for(genvar j = 0; j < `BITWIDTH+1; j++)
                begin
                    if ((pps[j+2*i]+plusone[j+2*i] > 0)) assign pp_reord[j+2*i][i%(pps[j+2*i]+plusone[j+2*i])] = pp_array[i][j];
                end
                if((pps[2*i+1]+plusone[2*i+1]) > 0 && JFM == 0) assign pp_reord[2*i+1][(i+1)%(pps[2*i+1]+plusone[2*i+1])] = corr[i];
                assign pp_reord[`BITWIDTH+1+2*i][(`BITWIDTH/2)%(pps[`BITWIDTH+1+2*i]+plusone[`BITWIDTH+1+2*i])] = 1'b1;
            end
            assign pp_reord[`BITWIDTH][`BITWIDTH/2] = 1'b1;
            if(SHIFTDISTANCE == 0) assign pp_reord[`BITWIDTH-1][1+(`BITWIDTH/2)] = 1'b1; //Insert a 1 in the column just below the truncated output to get "round-to-nearest half"
            else begin //This is OSFM only
                assign pp_reord[`BITWIDTH-SHIFTDISTANCE-1][pps[`BITWIDTH-SHIFTDISTANCE-1]] = ~(shift_possible[1]||shift_possible[0]);
                assign pp_reord[`BITWIDTH-1][pps[`BITWIDTH-1]] = shift_possible[1]^shift_possible[0];
                assign pp_reord[`BITWIDTH+SHIFTDISTANCE-1][(`BITWIDTH/2)%(pps[15]+plusone[15]-1)] = (shift_possible[1]&&shift_possible[0]);
            end
        endgenerate
endmodule

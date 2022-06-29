`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 26.01.2022 11:48:30
// Design Name:
// Module Name: corr_bit
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


module corr_bit(
    input logic [2:0] bin,
    input logic alsb,
    output logic corr
    );

    assign corr = bin[2] & (~(bin[0]|bin[1])|~(alsb|bin[1])|~(alsb|bin[0]));
endmodule

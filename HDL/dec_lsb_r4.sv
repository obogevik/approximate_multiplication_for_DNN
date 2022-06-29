`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 25.01.2022 14:29:02
// Design Name:
// Module Name: dec_lsb_r4
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


module dec_lsb_r4(
    input logic alsb,
    input logic [1:0]bin,
    output logic ppout
    );

    assign ppout = alsb & (bin[1] ^ bin[0]);
endmodule

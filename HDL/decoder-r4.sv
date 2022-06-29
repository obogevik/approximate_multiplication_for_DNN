`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 25.01.2022 08:13:20
// Design Name:
// Module Name: decoder-r4
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


module dec_r4(
    input logic [1:0] ain,
    input logic [2:0] encin,
    input logic neg,
    output logic ppout
    );
    logic [3:0] dec_int;

    assign dec_int[0] = ~(ain[1] ^ neg);
    assign dec_int[1] = ~(ain[0] ^ neg);
    assign dec_int[2] = (dec_int[0] | encin[1]);
    assign dec_int[3] = (dec_int[1] | encin[2] | encin[0]);
    assign ppout = ~(dec_int[3] & dec_int[2]);
endmodule

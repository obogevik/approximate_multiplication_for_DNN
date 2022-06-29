`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 25.01.2022 08:13:20
// Design Name:
// Module Name: encoder-r4
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


module enc_r4(
    input logic [2:0] bin,
    output logic [2:0] encout,
    output logic neg
    );

    assign encout[0] = ~(bin[2] ^ bin[1]);
    assign encout[1] = ~(bin[1] ^ bin[0]);
    assign encout[2] =  (bin[1] ^ bin[0]);
    assign neg       =   bin[2];
endmodule
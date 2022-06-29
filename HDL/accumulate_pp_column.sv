`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 03.02.2022 13:17:14
// Design Name:
// Module Name: accumulate_pp_column
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


module accumulate_pp_column#(
    parameter plusone = 0,
    parameter pps = 0,
    parameter cis = 0,
    parameter cos = 0,
    parameter BITWIDTH = 8
)(
    input logic [pps+plusone-1:0] pp_column ,
    input logic [(BITWIDTH/2)+1:0] ci,
    output logic [(BITWIDTH/2)+1:0] co,
    output logic [1:0]s
    );
    logic [50:0]sum;
    logic [50:0]carry;
    localparam num_in_col = pps + cis + plusone;
    logic [num_in_col-1:0] to_accumulate;

    generate
        if(pps+plusone > 0) begin
                if (cis > 0) assign to_accumulate = {ci[cis-1:0],pp_column [pps+plusone-1:0]};
                else assign to_accumulate = {pp_column [pps+plusone-1:0]};
                end
         else assign to_accumulate = {ci[cis-1:0]};

        case(num_in_col)
            1: assign s = {1'b0,to_accumulate[0]};
            2: assign s = {to_accumulate[1],to_accumulate[0]};
            3: begin
                half_adder HA1(to_accumulate[0],to_accumulate[1],sum[0],carry[0]);
                assign s = {to_accumulate[2],sum[0]};
                assign co = {carry[0]};
                end
            4: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                assign s = {to_accumulate[3],sum[0]};
                assign co = {carry[0]};
                end
            5: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                half_adder HA1(sum[0],to_accumulate[3],sum[1],carry[1]);
                assign s = {to_accumulate[4],sum[1]};
                assign co = {carry[1],carry[0]};
                end
            6: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],sum[0],to_accumulate[4],sum[1],carry[1]);
                assign s = {to_accumulate[5],sum[1]};
                assign co = {carry[1],carry[0]};
                end
            7: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                half_adder HA1(sum[0],sum[1],sum[2],carry[2]);
                assign s = {to_accumulate[6],sum[2]};
                assign co = {carry[2],carry[1],carry[0]};
                end
            8: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(sum[0],sum[1],to_accumulate[6],sum[2],carry[2]);
                assign s = {to_accumulate[7],sum[2]};
                assign co = {carry[2],carry[1],carry[0]};
                end
            9: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(sum[0],sum[1],to_accumulate[6],sum[2],carry[2]);
                half_adder HA1(sum[2],to_accumulate[7],sum[3],carry[3]);
                assign s = {to_accumulate[8],sum[3]};
                assign co = {carry[3],carry[2],carry[1],carry[0]};
                end
           10: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(sum[0],sum[1],to_accumulate[6],sum[2],carry[2]);
                full_adder FA4(sum[2],to_accumulate[7],to_accumulate[8],sum[3],carry[3]);
                assign s = {to_accumulate[9],sum[3]};
                assign co = {carry[3:0]};
                end
            11: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                half_adder HA1(sum[0],to_accumulate[8],sum[2],carry[2]);
                full_adder FA3(to_accumulate[6],sum[1],to_accumulate[7],sum[3],carry[3]);
                full_adder FA4(sum[2],sum[3],to_accumulate[9],sum[4],carry[4]);
                assign s = {to_accumulate[10],sum[4]};
                assign co = {carry[4:0]};
                end
            12: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(to_accumulate[6],to_accumulate[7],to_accumulate[8],sum[2],carry[2]);
                full_adder FA4(sum[0],sum[1],to_accumulate[9],sum[3],carry[3]);
                full_adder FA5(sum[2],sum[3],to_accumulate[10],sum[4],carry[4]);
                assign s = {to_accumulate[11],sum[4]};
                assign co = {carry[4:0]};
                end
            13: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(to_accumulate[6],to_accumulate[7],to_accumulate[8],sum[2],carry[2]);
                half_adder HA1(to_accumulate[9],to_accumulate[10],sum[3],carry[3]);
                full_adder FA4(sum[0],sum[1],sum[2],sum[4],carry[4]);
                full_adder FA5(sum[3],sum[4],to_accumulate[11],sum[5],carry[5]);
                assign s = {to_accumulate[12],sum[5]};
                assign co = {carry[5:0]};
                end
            14: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(to_accumulate[6],to_accumulate[7],to_accumulate[8],sum[2],carry[2]);
                full_adder FA4(to_accumulate[9],to_accumulate[10],to_accumulate[11],sum[3],carry[3]);
                full_adder FA5(sum[0],sum[1],sum[2],sum[4],carry[4]);
                full_adder FA6(sum[3],sum[4],to_accumulate[12],sum[5],carry[5]);
                assign s = {to_accumulate[13],sum[5]};
                assign co = {carry[5:0]};
                end
            15: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(to_accumulate[6],to_accumulate[7],to_accumulate[8],sum[2],carry[2]);
                full_adder FA4(to_accumulate[9],to_accumulate[10],to_accumulate[11],sum[3],carry[3]);
                half_adder HA2(to_accumulate[12],sum[3],sum[4],carry[4]);
                full_adder FA5(sum[0],sum[1],sum[2],sum[5],carry[5]);
                full_adder FA6(sum[4],sum[5],to_accumulate[13],sum[6],carry[6]);
                assign s = {to_accumulate[14],sum[6]};
                assign co = {carry[6:0]};
                end
            16: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(to_accumulate[6],to_accumulate[7],to_accumulate[8],sum[2],carry[2]);
                full_adder FA4(to_accumulate[9],to_accumulate[10],to_accumulate[11],sum[3],carry[3]);
                full_adder FA5(to_accumulate[12],to_accumulate[13],sum[3],sum[4],carry[4]);
                full_adder FA6(sum[0],sum[1],sum[2],sum[5],carry[5]);
                full_adder FA7(sum[4],sum[5],to_accumulate[14],sum[6],carry[6]);
                assign s = {to_accumulate[15],sum[6]};
                assign co = {carry[6:0]};
                end
            17: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(to_accumulate[6],to_accumulate[7],to_accumulate[8],sum[2],carry[2]);
                full_adder FA4(to_accumulate[9],to_accumulate[10],to_accumulate[11],sum[3],carry[3]);
                full_adder FA5(to_accumulate[12],to_accumulate[13],sum[3],sum[4],carry[4]);
                full_adder FA6(sum[0],sum[1],sum[2],sum[5],carry[5]);
                half_adder HA1(sum[5],to_accumulate[14],sum[6],carry[6]);
                full_adder FA7(sum[4],sum[6],to_accumulate[15],sum[7],carry[7]);
                assign s = {to_accumulate[16],sum[7]};
                assign co = {carry[7:0]};
                end
            18: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(to_accumulate[6],to_accumulate[7],to_accumulate[8],sum[2],carry[2]);
                full_adder FA4(to_accumulate[9],to_accumulate[10],to_accumulate[11],sum[3],carry[3]);
                full_adder FA5(to_accumulate[12],to_accumulate[13],sum[3],sum[4],carry[4]);
                full_adder FA6(sum[0],sum[1],sum[2],sum[5],carry[5]);
                full_adder FA7(sum[5],to_accumulate[14],to_accumulate[15],sum[6],carry[6]);
                full_adder FA8(sum[4],sum[6],to_accumulate[16],sum[7],carry[7]);
                assign s = {to_accumulate[17],sum[7]};
                assign co = {carry[7:0]};
                end
            19: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(to_accumulate[6],to_accumulate[7],to_accumulate[8],sum[2],carry[2]);
                full_adder FA4(to_accumulate[9],to_accumulate[10],to_accumulate[11],sum[3],carry[3]);
                full_adder FA5(to_accumulate[12],to_accumulate[13],to_accumulate[14],sum[4],carry[4]);
                full_adder FA6(sum[0],sum[1],sum[2],sum[5],carry[5]);
                half_adder HA1(sum[3],sum[5],sum[6],carry[6]);
                full_adder FA7(sum[4],to_accumulate[15],to_accumulate[16],sum[7],carry[7]);
                full_adder FA8(sum[6],sum[7],to_accumulate[17],sum[8],carry[8]);
                assign s = {to_accumulate[18],sum[8]};
                assign co = {carry[8:0]};
                end
            20: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(to_accumulate[6],to_accumulate[7],to_accumulate[8],sum[2],carry[2]);
                full_adder FA4(to_accumulate[9],to_accumulate[10],to_accumulate[11],sum[3],carry[3]);
                full_adder FA5(to_accumulate[12],to_accumulate[13],to_accumulate[14],sum[4],carry[4]);
                full_adder FA6(sum[0],sum[1],sum[2],sum[5],carry[5]);
                full_adder FA7(sum[3],sum[5],to_accumulate[15],sum[6],carry[6]);
                full_adder FA8(sum[4],to_accumulate[16],to_accumulate[17],sum[7],carry[7]);
                full_adder FA9(sum[6],sum[7],to_accumulate[18],sum[8],carry[8]);
                assign s = {to_accumulate[19],sum[8]};
                assign co = {carry[8:0]};
                end
            21: begin
                full_adder FA1(to_accumulate[0],to_accumulate[1],to_accumulate[2],sum[0],carry[0]);
                full_adder FA2(to_accumulate[3],to_accumulate[4],to_accumulate[5],sum[1],carry[1]);
                full_adder FA3(to_accumulate[6],to_accumulate[7],to_accumulate[8],sum[2],carry[2]);
                full_adder FA4(to_accumulate[9],to_accumulate[10],to_accumulate[11],sum[3],carry[3]);
                full_adder FA5(to_accumulate[12],to_accumulate[13],to_accumulate[14],sum[4],carry[4]);
                half_adder HA1(to_accumulate[15],to_accumulate[16],sum[5],carry[5]);
                full_adder FA6(sum[0],sum[1],sum[2],sum[6],carry[6]);
                full_adder FA7(sum[3],sum[4],sum[5],sum[7],carry[7]);
                full_adder FA8(sum[6],to_accumulate[17],to_accumulate[18],sum[8],carry[8]);
                full_adder FA9(sum[7],sum[8],to_accumulate[19],sum[9],carry[9]);                
                assign s = {to_accumulate[20],sum[9]};
                assign co = {carry[9:0]};
                end
        endcase
    endgenerate
endmodule

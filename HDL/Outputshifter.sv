`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 19.03.2022 10:20:27
// Design Name:
// Module Name: Outputshifter
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

module Outputshifter(
    input logic [2*(`OSFM_BITWIDTH_I)-1:0] shiftin,   // Output from multiplier
    input logic [1:0]shift_possible,                        // From both lowinputdetectors
    output logic [`BITWIDTH-1:0] shiftout                    // Back to correct output
    );
    logic [`BITWIDTH-1:0]shiftout_i;
    logic [`BITWIDTH-1:0]shiftout_temp;
    logic [`SHIFTDISTANCE-1:0]signextend_half;
    logic [2*`SHIFTDISTANCE-1:0]signextend_full;
    logic [`SHIFTDISTANCE-1:0]pad;

    assign pad = '0;
    generate
        // TODO: test if its better to get sign from checking MSB of input instead of getting sign from multiplier. Potentially less switching activity on mux
        for(genvar i = 0; i < `SHIFTDISTANCE; i++) begin
            assign signextend_half[i] = shiftin[2*(`OSFM_BITWIDTH_I)-1];
        end
        for(genvar i = 0; i < 2*`SHIFTDISTANCE; i++) begin
            assign signextend_full[i] = shiftin[2*(`OSFM_BITWIDTH_I)-1];
        end
    endgenerate
`ifdef OSFM_OUTPUTSHIFTER_VERSION_1
    always @ (signextend_full or signextend_half or shiftin or shift_possible) begin
        case (shift_possible)
            2'b00 : shiftout_i <= shiftin[2*`OSFM_BITWIDTH_I-1:2*`OSFM_BITWIDTH_I-`BITWIDTH]; // MSBs on both operands, so result is also MSBs
            2'b01 : shiftout_i <= {signextend_half, shiftin[2*`OSFM_BITWIDTH_I-1:2*`OSFM_BITWIDTH_I-`BITWIDTH+`SHIFTDISTANCE]}; // MSBs and LSBs on operands, so result is signextended
            2'b10 : shiftout_i <= {signextend_half, shiftin[2*`OSFM_BITWIDTH_I-1:2*`OSFM_BITWIDTH_I-`BITWIDTH+`SHIFTDISTANCE]}; // MSBs and LSBs on operands, so result is signextended
            2'b11 : shiftout_i <= {signextend_full, shiftin[2*`OSFM_BITWIDTH_I-1:2*`OSFM_BITWIDTH_I-`BITWIDTH+2*`SHIFTDISTANCE]}; // LSBs on both operands, so result is signextended
        endcase
    end
`elsif OSFM_OUTPUTSHIFTER_VERSION_2
    always @ (signextend_full or signextend_half or shiftin or shift_possible) begin       
        case (shift_possible[1]^shift_possible[0])
            1'b0 : shiftout_temp <= shiftin[2*`OSFM_BITWIDTH_I-1:2*`OSFM_BITWIDTH_I-`BITWIDTH]; // MSBs on both operands, so result is also MSBs
            1'b1 : shiftout_temp <= {signextend_half, shiftin[2*`OSFM_BITWIDTH_I-1:2*`OSFM_BITWIDTH_I-`BITWIDTH+`SHIFTDISTANCE]}; // MSBs and LSBs on operands, so result is signextended           
        endcase
    end
    always @ (signextend_full or signextend_half or shiftin or shift_possible or shiftout_temp) begin       
        case (shift_possible[1]&&shift_possible[0])
            1'b0 : shiftout_i <= shiftout_temp;
            1'b1 : shiftout_i <= {signextend_full, shiftin[2*`OSFM_BITWIDTH_I-1:2*`OSFM_BITWIDTH_I-`BITWIDTH+2*`SHIFTDISTANCE]}; // LSBs on both operands, so result is signextended
        endcase
    end
`elsif OSFM_OUTPUTSHIFTER_VERSION_3
    assign shiftout_temp = (shift_possible[1]^shift_possible[0]) ? 
    {signextend_half, shiftin[2*`OSFM_BITWIDTH_I-1:2*`OSFM_BITWIDTH_I-`BITWIDTH+`SHIFTDISTANCE]} : // MSBs and LSBs on operands, so result is signextended
    shiftout_temp <= shiftin[2*`OSFM_BITWIDTH_I-1:2*`OSFM_BITWIDTH_I-`BITWIDTH]; // MSBs on both operands, so result is also MSBs

    assign shiftout_i = (shift_possible[1]&&shift_possible[0]) ?
    {signextend_full, shiftin[2*`OSFM_BITWIDTH_I-1:2*`OSFM_BITWIDTH_I-`BITWIDTH+2*`SHIFTDISTANCE]} : // LSBs on both operands, so result is signextended
    shiftout_temp;
 `endif   
    assign shiftout[`BITWIDTH-1:0] = shiftout_i;// Upper half of result continued
    // Lower half of result truncated as it is fixed-width multiplication
endmodule

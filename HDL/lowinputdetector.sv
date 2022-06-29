`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 19.03.2022 10:20:27
// Design Name:
// Module Name: lowinputdetector
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
// Check if string of 0 or 1 at msb of input
// if so, that means that input magnitude is below a certain threshold, and input can be shifted to get better precision
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// input size - size multiplier = width, ex 16-bit external input - 12-bit internal multiplier = 4 shiftdistance
//////////////////////////////////////////////////////////////////////////////////
`include "ApproximateMultiplier.svh"

module lowinputdetector(
    input logic [`SHIFTDISTANCE:0] msbinput,    // Signbit & MSBs, one bit wider than SHIFTDISTANCE
    output logic shift_possible         // one if shifting is possible
    );
    assign shift_possible = &msbinput || ~|msbinput;  // All bits set or no bits set
endmodule

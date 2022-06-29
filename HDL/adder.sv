`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Olav Bogevik
//
// Create Date: 26.01.2022 11:34:59
// Design Name:
// Module Name: adder
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


module half_adder(
    input a, b,
    output s, co
    );
    assign {co, s} = a + b;
endmodule

module full_adder#(
    parameter ADDER_INTERNAL_VARIANT = 4
)(
    input a, b, ci,
    output s, co
    );
    logic co_n, s_n;

    case (ADDER_INTERNAL_VARIANT)
        0 : assign {co, s} = a + b + ci;
        1 : begin
                assign co_n = ~((a & b) | (ci & (a | b)));
                assign s_n = ~((a & b & ci) | ((a | b | ci) & co_n));
                assign co = ~(co_n);
                assign s = ~s_n;
            end
        2 : begin
                assign s = (a ^ b) ^ ci;
                assign co = ((a ^ b) & ci) | (a & b);
            end
        3 : begin
                assign s = (a ^ b) ^ ci;
                assign co = ~(~((a ^ b) & ci) & ~(a & b));
            end
        4 : begin
                assign s = a ^ b ^ ci;
                assign co = (a & b) | (a & ci) | (b & ci);
            end
    endcase
endmodule

// a + b + 1 = s + 2*co
// basically a full_adder with one input set to 1
module plusone_adder(
    input a, b,
    output s, co
    );
    assign s = ~(a ^ b);
    assign co = (a | b);
endmodule

// a + 1 = s + 2*co
// basically a half_adder with one input set to 1
module plusone_half_adder(
    input a,
    output s, co
    );
    assign s = ~a;
    assign co = a;
endmodule

module compressor42(
    input a, b, c, ci[1:0],
    output s, co[1:0]
    );
    logic s_temp;
    full_adder FA0(
        .a (a),
        .b (b),
        .ci (c),
        .s (s_temp),
        .co (co[0])
    );
    full_adder FA1(
        .a (s_temp),
        .b (ci[0]),
        .ci (ci[1]),
        .s (s),
        .co (co[1])
    );
endmodule
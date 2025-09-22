// Verilog module for D Flip-Flop
`timescale 1ns / 1ps

module d_ff(
    input clk,
    input d,
    output reg q
);

    always @(posedge clk) begin
        q <= d;
    end

endmodule
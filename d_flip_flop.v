// D Flip-Flop module
`timescale 1ns/1ps

module d_flip_flop (
  input clk,
  input reset,
  input d,
  output reg q,
  output wire q_bar
);

  // Main D Flip-Flop logic
  always @(posedge clk or posedge reset) begin
    if (reset)
      q <= 0;
    else
      q <= d;
  end
  
  // Inverted output
  assign q_bar = ~q;

endmodule
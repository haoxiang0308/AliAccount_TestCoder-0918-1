// Testbench for D Flip-Flop
`timescale 1ns/1ps

module dff_testbench;
  
  // D Flip-Flop inputs and outputs
  reg clk;
  reg reset;
  reg d;
  wire q;
  wire q_bar;
  
  // Instantiate the D Flip-Flop module
  dff dff_inst (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );
  
  // Generate clock signal (10ns period = 100MHz)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle every 5ns
  end
  
  // Test stimulus
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Wait for a few clock cycles with reset active
    #20;
    
    // Release reset
    reset = 0;
    
    // Test sequence: apply different values to D input
    #10;
    d = 1;      // Set D to 1
    #20;
    d = 0;      // Set D to 0
    #20;
    d = 1;      // Set D to 1 again
    #20;
    d = 0;      // Set D to 0 again
    #20;
    
    // Apply reset again
    reset = 1;
    #15;
    
    // Release reset and continue testing
    reset = 0;
    #20;
    d = 1;
    #20;
    
    // End simulation
    #20;
    $display("Simulation completed");
    $finish;
  end
  
  // Monitor signals
  initial begin
    $monitor("Time=%0t, CLK=%b, RESET=%b, D=%b, Q=%b, Q_bar=%b", 
             $time, clk, reset, d, q, q_bar);
  end

endmodule

// D Flip-Flop Module (for reference/testing - normally this would be in a separate file)
module dff(
  input clk,
  input reset,
  input d,
  output reg q,
  output wire q_bar
);

  assign q_bar = ~q;

  always @(posedge clk or posedge reset) begin
    if (reset)
      q <= 0;
    else
      q <= d;
  end

endmodule
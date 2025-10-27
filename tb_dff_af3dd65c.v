// Testbench for D Flip-Flop
`timescale 1ns/1ps

module dff_testbench;
  
  // Inputs
  reg clk;
  reg reset;
  reg d;
  
  // Outputs
  wire q;
  wire q_bar;
  
  // Instantiate the D Flip-Flop module
  d_flip_flop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );
  
  // Clock generation - 10ns period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Apply reset
    #10;
    reset = 0;
    
    // Test different input values
    #15;
    d = 1;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;
    d = 0;
    #10;
    
    // Test with reset in the middle
    reset = 1;
    #10;
    reset = 0;
    d = 1;
    #10;
    d = 0;
    #10;
    
    // Finish simulation
    $finish;
  end
  
  // Monitor signals
  initial begin
    $monitor("Time: %0t | Reset: %b | D: %b | Q: %b | Q_bar: %b", 
             $time, reset, d, q, q_bar);
  end
  
endmodule
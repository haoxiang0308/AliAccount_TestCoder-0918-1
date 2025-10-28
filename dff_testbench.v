// Testbench for D flip-flop
`timescale 1ns/1ps

module dff_testbench;
  
  // Inputs
  reg clk;
  reg reset;
  reg d;
  
  // Outputs
  wire q;
  wire q_bar;
  
  // Instantiate the D flip-flop module
  // Assuming the D flip-flop module is named 'dff'
  dff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );
  
  // Clock generation - 10ns period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clk every 5ns to get 10ns period
  end
  
  // Test stimulus
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Apply reset
    #10;
    reset = 0;
    
    // Test various input combinations
    #15;
    d = 1;  // Set D to 1
    #20;
    d = 0;  // Set D to 0
    #20;
    d = 1;  // Set D to 1
    #20;
    d = 0;  // Set D to 0
    #20;
    
    // Test reset functionality
    reset = 1;
    #15;
    reset = 0;
    d = 1;
    #20;
    
    // More tests
    d = 1;
    #20;
    d = 0;
    #20;
    
    // End simulation
    #20;
    $display("Simulation finished");
    $finish;
  end
  
  // Monitor outputs
  initial begin
    $monitor("Time=%0t | CLK=%b RESET=%b D=%b Q=%b Q_BAR=%b", 
             $time, clk, reset, d, q, q_bar);
  end
  
endmodule
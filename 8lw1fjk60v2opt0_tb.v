// Testbench for D-FlipFlop
`timescale 1ns/1ps

module d_flipflop_tb;

// Test signals
reg clk;
reg reset;
reg d;
wire q;
wire q_bar;

// Instantiate the D-FlipFlop module
d_flipflop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns period
end

// Test sequence
initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Reset the flip-flop
    #10;
    reset = 0;
    
    // Test different input values
    #10 d = 1;    // Set D to 1
    #20 d = 0;    // Set D to 0
    #20 d = 1;    // Set D to 1
    #20 d = 0;    // Set D to 0
    
    // Test reset
    #10 reset = 1; // Reset
    #20 reset = 0; // Release reset
    
    // More tests
    #10 d = 1;
    #20 d = 0;
    #20 d = 1;
    
    // End simulation
    #50 $finish;
end

// Monitor signals
initial begin
    $monitor("Time: %0t | Reset: %b | D: %b | Q: %b | Q_bar: %b", $time, reset, d, q, q_bar);
end

endmodule
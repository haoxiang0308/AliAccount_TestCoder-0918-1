// Testbench for D Flip-Flop
module d_flip_flop_tb;
  reg clk;
  reg reset;
  reg d;
  wire q;

  // Instantiate the D Flip-Flop module
  d_flip_flop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
  );

  // Generate clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 time unit clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    #10;

    // Deassert reset
    reset = 0;
    #10;

    // Test data input
    d = 1;
    #20;

    d = 0;
    #20;

    d = 1;
    #20;

    // End simulation
    $finish;
  end

  // Monitor outputs
  initial begin
    $monitor("Time: %0t, CLK: %b, RESET: %b, D: %b, Q: %b", $time, clk, reset, d, q);
  end

endmodule
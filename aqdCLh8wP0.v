// Testbench for D-flip-flop module
module d_flipflop_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the D-flip-flop module
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time unit period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        
        // Reset the flip-flop
        #10;
        reset = 0;
        
        // Test different input patterns
        #10 d = 1;     // Set D to 1
        #20 d = 0;     // Set D to 0
        #20 d = 1;     // Set D to 1
        #20 d = 0;     // Set D to 0
        #20 d = 1;     // Set D to 1
        
        // Test reset functionality
        #10 reset = 1; // Reset the flip-flop
        #10 reset = 0; // Remove reset
        #10 d = 1;     // Set D to 1 after reset
        
        // End simulation
        #30 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0t | Reset: %b | D: %b | Q: %b", $time, reset, d, q);
    end

endmodule
// Testbench for D-flipflop module
module testbench_dff;

    // Inputs
    reg clk;
    reg reset;
    reg d;
    
    // Output
    wire q;
    
    // Instantiate the D-flipflop module
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clock every 5 time units
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
        #10;
        d = 1;
        #10;
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        
        // Apply reset again
        #10;
        reset = 1;
        #10;
        reset = 0;
        
        // More tests
        d = 1;
        #20;
        d = 0;
        #20;
        
        // Finish simulation
        #20;
        $finish;
    end
    
    // Monitor signals
    initial begin
        $monitor("Time: %0t, Reset: %b, D: %b, Q: %b", $time, reset, d, q);
    end

endmodule
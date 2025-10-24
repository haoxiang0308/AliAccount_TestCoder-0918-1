module dff_testbench;
    reg clk;
    reg rst;
    reg d;
    wire q;

    // Instantiate the D flip-flop module
    d_flip_flop uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        d = 0;
        #10;
        rst = 0; // Release reset

        // Test various input combinations
        #10 d = 1;
        #20 d = 0;
        #20 d = 1;
        #20 d = 0;
        
        // Additional reset test
        #10 rst = 1;
        #10 rst = 0;
        #20 d = 1;
        
        #30 $finish; // End simulation
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t, CLK: %b, RST: %b, D: %b, Q: %b", $time, clk, rst, d, q);
    end
endmodule
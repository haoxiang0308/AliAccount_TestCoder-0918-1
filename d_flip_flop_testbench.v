`timescale 1ns / 1ps

module d_flip_flop_testbench;
    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop module
    dff uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Test stimulus
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        #10;
        reset = 0; // Release reset

        // Apply test vectors
        #10 d = 1;
        #20 d = 0;
        #20 d = 1;
        #20 d = 0;

        // Finish simulation
        #10 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t, D: %b, Q: %b", $time, d, q);
    end

endmodule
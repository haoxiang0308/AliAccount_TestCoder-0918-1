// Testbench for D-Flip-Flop
`timescale 1ns/1ps
module tb_d_flipflop;

    reg clk;
    reg rst;
    reg d;
    wire q;

    // Instantiate the D-Flip-Flop
    d_flipflop uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        d = 0;
        #10;

        // Release reset
        rst = 0;
        #10;

        // Test data
        d = 1;
        #20;
        d = 0;
        #20;
        d = 1;
        #20;

        // Assert reset
        rst = 1;
        #10;

        // De-assert reset and test again
        rst = 0;
        d = 1;
        #20;
        d = 0;
        #20;

        // Finish simulation
        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time: %0t, clk: %b, rst: %b, d: %b, q: %b", $time, clk, rst, d, q);
    end

endmodule
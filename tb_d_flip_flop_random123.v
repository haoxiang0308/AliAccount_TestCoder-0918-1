// Testbench for D Flip-Flop
`timescale 1ns / 1ps

module tb_d_flip_flop;
    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop
    d_flip_flop uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test stimulus
    initial begin
        // Initialize signals
        rst_n = 0;
        d = 0;
        #10;

        // Release reset
        rst_n = 1;
        #10;

        // Test data changes
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;

        // Finish simulation
        #20;
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t ns, D: %b, Q: %b", $time, d, q);
    end

endmodule
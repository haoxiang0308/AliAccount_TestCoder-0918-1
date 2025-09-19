// Testbench for D Flip-Flop
`timescale 1ns / 1ps

module tb_dff;

    // Declare inputs and outputs
    reg clk;
    reg rst;
    reg d;
    wire q;
    wire q_bar;

    // Instantiate the DFF module
    dff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test procedure
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        d = 0;

        // Reset the flip-flop
        #10 rst = 0;
        
        // Apply test vectors
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;
        
        // Finish simulation
        #10 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t | clk = %b | rst = %b | d = %b | q = %b | q_bar = %b", $time, clk, rst, d, q, q_bar);
    end

endmodule
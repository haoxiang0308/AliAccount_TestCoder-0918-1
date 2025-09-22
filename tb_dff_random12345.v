// Verilog Testbench for D Flip-Flop
`timescale 1ns / 1ps

module tb_dff;

    // Declare inputs and outputs
    reg clk;
    reg rst;
    reg d;
    wire q;
    wire qn; // Optional inverted output

    // Instantiate the D Flip-Flop
    // Assuming the DFF module is named 'dff'
    dff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 10ns clock period
    end

    // Test procedure
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        d = 0;

        // Release reset
        #15 rst = 0;

        // Apply test vectors
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;

        // Finish simulation
        #20 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t: clk = %b, rst = %b, d = %b, q = %b, qn = %b", $time, clk, rst, d, q, qn);
    end

endmodule
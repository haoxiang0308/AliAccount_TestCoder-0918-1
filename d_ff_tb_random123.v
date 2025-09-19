// Verilog Testbench for D Flip-Flop
// File: d_ff_tb_random123.v

`timescale 1ns / 1ps

module d_ff_tb;

    // Declare signals
    reg clk;
    reg d;
    reg rst;
    reg set;
    wire q;
    wire qn; // Assuming the DFF has a complement output

    // Instantiate the D Flip-Flop
    // Assuming the module is named d_ff and is in a file d_ff.v
    d_ff uut (
        .clk(clk),
        .d(d),
        .rst(rst),
        .set(set),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns period clock

    // Monitor outputs
    initial begin
        $monitor("Time = %0t: clk = %b, d = %b, rst = %b, set = %b, q = %b, qn = %b", $time, clk, d, rst, set, q, qn);
    end

    // Test sequence
    initial begin
        // Initialize inputs
        clk = 0;
        d = 0;
        rst = 1; // Active high reset
        set = 0;

        // Apply reset
        #15 rst = 0;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;

        // Test Set
        #10 set = 1;
        #10 set = 0;
        #10 d = 1;
        #10 d = 0;

        // Finish simulation
        #20 $finish;
    end

endmodule
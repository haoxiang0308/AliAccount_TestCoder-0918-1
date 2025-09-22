// Verilog Testbench for D Flip-Flop
`timescale 1ns / 1ps

module d_ff_tb;

    // Inputs
    reg clk;
    reg d;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    d_ff uut (
        .clk(clk),
        .d(d),
        .q(q)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 100MHz clock
    end

    // Test procedure
    initial begin
        // Initialize Inputs
        clk = 0;
        d = 0;

        // Display initial state
        $display("Time\tCLK\tD\tQ");
        $display("%0t\t%b\t%b\t%b", $time, clk, d, q);

        // Apply test vectors
        #10 d = 1;
        $display("%0t\t%b\t%b\t%b", $time, clk, d, q);

        #10 d = 0;
        $display("%0t\t%b\t%b\t%b", $time, clk, d, q);

        #10 d = 1;
        $display("%0t\t%b\t%b\t%b", $time, clk, d, q);

        #10 d = 0;
        $display("%0t\t%b\t%b\t%b", $time, clk, d, q);

        // Finish simulation
        #20 $finish;
    end

endmodule
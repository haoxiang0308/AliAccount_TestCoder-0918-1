// Testbench for D Flip-Flop
`timescale 1ns / 1ps

module tb_dff;

    // Inputs
    reg clk;
    reg rst_n;
    reg d;

    // Outputs
    wire q;
    wire qn;

    // Instantiate the DFF module
    dff uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test procedure
    initial begin
        // Initialize inputs
        clk = 0;
        rst_n = 0;
        d = 0;

        // Display header
        $display("Time\tclk\trst_n\td\tq\tqn");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk, rst_n, d, q, qn);

        // Release reset
        #15 rst_n = 1;

        // Apply test vectors
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;

        // Finish simulation
        #20 $finish;
    end

endmodule
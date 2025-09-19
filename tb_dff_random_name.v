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

        // Reset release
        #15 rst_n = 1;

        // Apply test vectors
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;

        // Finish simulation
        #20 $finish;
    end

    // Dump waveform for visualization
    initial begin
        $dumpfile("dff_waveform.vcd");
        $dumpvars(0, tb_dff);
    end

endmodule
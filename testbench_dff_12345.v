// Testbench for D Flip-Flop
`timescale 1ns / 1ps

module testbench_dff;
    reg clk;
    reg rst_n; // Asynchronous active-low reset
    reg d;
    wire q, q_bar;

    // Instantiate the D Flip-Flop module
    // Assuming the DFF module is named 'd_flip_flop' with ports clk, rst_n, d, q, q_bar
    d_flip_flop uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation: 10ns period -> 100MHz frequency
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clk every 5 time units (ns)
    end

    // Test stimulus
    initial begin
        // Initialize signals
        d = 0;
        rst_n = 0; // Assert reset

        // Wait for a bit to allow reset to take effect
        #15;

        // Deassert reset
        rst_n = 1;
        #10; // Wait for a few clock cycles after reset

        // Test sequence
        d = 0; // Set D to 0
        #20;  // Wait for 2 clock cycles (with 10ns period)
        d = 1; // Set D to 1
        #20;  // Wait for 2 clock cycles
        d = 0; // Set D to 0
        #20;  // Wait for 2 clock cycles
        d = 1; // Set D to 1
        #20;  // Wait for 2 clock cycles

        // Assert reset again to see its effect
        rst_n = 0;
        #15;

        // Deassert reset one final time
        rst_n = 1;
        #10;

        // Finish simulation
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t ns, CLK=%b, RST_N=%b, D=%b, Q=%b, Q_BAR=%b", $time, clk, rst_n, d, q, q_bar);
    end

endmodule
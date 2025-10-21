// Traffic Light Controller using Finite State Machine
// This module implements a traffic light controller with 4 states:
// - RED (for main road)
// - GREEN (for main road) 
// - YELLOW (for main road)
// - RED2 (for cross road)

module traffic_light_fsm (
    input wire clk,           // System clock
    input wire reset,         // Reset signal (active high)
    output reg [2:0] main_light,   // Main road light: [2]=Red, [1]=Yellow, [0]=Green
    output reg [2:0] cross_light  // Cross road light: [2]=Red, [1]=Yellow, [0]=Green
);

    // Define states
    parameter RED      = 3'b000;
    parameter GREEN    = 3'b001;
    parameter YELLOW   = 3'b010;
    parameter RED2     = 3'b011;

    // State register
    reg [2:0] current_state, next_state;

    // Timer for state duration
    reg [23:0] timer;  // 24-bit timer for longer delays
    parameter T_RED     = 24'd50000000;  // 50 million clock cycles ~ 500ms at 100MHz
    parameter T_GREEN   = 24'd30000000;  // 30 million clock cycles ~ 300ms at 100MHz
    parameter T_YELLOW  = 24'd5000000;   // 5 million clock cycles ~ 50ms at 100MHz

    // State register - synchronous reset
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= RED;
            timer <= 24'd0;
        end else begin
            if (timer == 0) begin
                current_state <= next_state;
                case (next_state)
                    RED:    timer <= T_RED;
                    GREEN:  timer <= T_GREEN;
                    YELLOW: timer <= T_YELLOW;
                    RED2:   timer <= T_RED;
                endcase
            end else begin
                timer <= timer - 1'b1;
            end
        end
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            RED:      next_state = GREEN;
            GREEN:    next_state = YELLOW;
            YELLOW:   next_state = RED2;
            RED2:     next_state = RED;
            default:  next_state = RED;
        endcase
    end

    // Output logic - assign light values based on current state
    always @(*) begin
        case (current_state)
            RED: begin
                main_light = 3'b100;   // Main road: RED
                cross_light = 3'b001;  // Cross road: GREEN
            end
            GREEN: begin
                main_light = 3'b001;   // Main road: GREEN
                cross_light = 3'b100;  // Cross road: RED
            end
            YELLOW: begin
                main_light = 3'b010;   // Main road: YELLOW
                cross_light = 3'b100;  // Cross road: RED
            end
            RED2: begin
                main_light = 3'b100;   // Main road: RED
                cross_light = 3'b010;  // Cross road: YELLOW
            end
            default: begin
                main_light = 3'b100;   // Default to RED for safety
                cross_light = 3'b100;  // Both red for safety
            end
        endcase
    end

endmodule

// Testbench for the traffic light controller
module tb_traffic_light_fsm;
    reg clk;
    reg reset;
    wire [2:0] main_light;
    wire [2:0] cross_light;

    // Instantiate the traffic light FSM
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .main_light(main_light),
        .cross_light(cross_light)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units period (5ns high, 5ns low)
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        #20;
        reset = 0;
        
        // Run simulation for multiple cycles
        #500000000;  // Run for a long time to see multiple cycles
        
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | Reset: %b | Main: R=%b Y=%b G=%b | Cross: R=%b Y=%b G=%b", 
                 $time, reset, 
                 main_light[2], main_light[1], main_light[0],
                 cross_light[2], cross_light[1], cross_light[0]);
    end

endmodule
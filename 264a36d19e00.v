// Traffic Light Controller using Finite State Machine
// Controls a simple traffic light system with Red, Yellow, Green lights
// for both North-South and East-West directions

module traffic_light_fsm (
    input wire clk,
    input wire reset,
    output reg [2:0] ns_light,    // North-South light: [2]Red, [1]Yellow, [0]Green
    output reg [2:0] ew_light     // East-West light: [2]Red, [1]Yellow, [0]Green
);

// Define states
parameter IDLE = 3'b000;
parameter NS_GREEN = 3'b001;
parameter NS_YELLOW = 3'b010;
parameter EW_GREEN = 3'b011;
parameter EW_YELLOW = 3'b100;

// State register
reg [2:0] current_state, next_state;

// Timer for controlling light durations
reg [23:0] timer;  // 24-bit timer for longer durations
parameter NS_GREEN_TIME = 24'd5000000;  // 5 seconds at 1MHz clock
parameter YELLOW_TIME = 24'd2000000;    // 2 seconds at 1MHz clock
parameter EW_GREEN_TIME = 24'd5000000;  // 5 seconds at 1MHz clock

// State register
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= IDLE;
        timer <= 24'd0;
    end else begin
        if (timer == 24'hFFFFFF) begin  // Timer overflow protection
            current_state <= next_state;
            timer <= 24'd0;
        end else begin
            current_state <= next_state;
            timer <= timer + 1'b1;
        end
    end
end

// Next state logic
always @(*) begin
    case(current_state)
        IDLE: next_state = NS_GREEN;
        NS_GREEN: 
            if (timer >= NS_GREEN_TIME) 
                next_state = NS_YELLOW;
            else 
                next_state = NS_GREEN;
        NS_YELLOW:
            if (timer >= YELLOW_TIME) 
                next_state = EW_GREEN;
            else 
                next_state = NS_YELLOW;
        EW_GREEN:
            if (timer >= EW_GREEN_TIME) 
                next_state = EW_YELLOW;
            else 
                next_state = EW_GREEN;
        EW_YELLOW:
            if (timer >= YELLOW_TIME) 
                next_state = NS_GREEN;
            else 
                next_state = EW_YELLOW;
        default: next_state = IDLE;
    endcase
end

// Output logic
always @(*) begin
    case(current_state)
        NS_GREEN: begin
            ns_light = 3'b001;  // Green
            ew_light = 3'b100;  // Red
        end
        NS_YELLOW: begin
            ns_light = 3'b010;  // Yellow
            ew_light = 3'b100;  // Red
        end
        EW_GREEN: begin
            ns_light = 3'b100;  // Red
            ew_light = 3'b001;  // Green
        end
        EW_YELLOW: begin
            ns_light = 3'b100;  // Red
            ew_light = 3'b010;  // Yellow
        end
        default: begin  // IDLE state
            ns_light = 3'b100;  // Red
            ew_light = 3'b100;  // Red
        end
    endcase
end

endmodule

// Testbench for the traffic light controller
module traffic_light_tb;
    reg clk, reset;
    wire [2:0] ns_light, ew_light;
    
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );
    
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        #100;
        reset = 0;
    end
    
    // Clock generation
    always #5 clk = ~clk;  // 100MHz clock (5ns period)
    
    // Monitor outputs
    initial begin
        $monitor("Time: %0t | NS Light: %b | EW Light: %b | State: %s", 
                 $time, ns_light, ew_light, 
                 (uut.current_state == uut.IDLE) ? "IDLE" :
                 (uut.current_state == uut.NS_GREEN) ? "NS_GREEN" :
                 (uut.current_state == uut.NS_YELLOW) ? "NS_YELLOW" :
                 (uut.current_state == uut.EW_GREEN) ? "EW_GREEN" :
                 "EW_YELLOW");
        
        #100000;  // Run simulation for 100us
        $finish;
    end
endmodule
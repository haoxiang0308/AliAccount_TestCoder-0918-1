// Traffic Light Controller using Finite State Machine
// Controls a simple traffic light system with pedestrian crossing
// States: Red, Red+Yellow, Green, Yellow

module traffic_light_controller (
    input wire clk,
    input wire reset,
    input wire pedestrian_request,  // Pedestrian button press
    output reg [2:0] light_control,  // RYG: Red=100, Yellow=010, Green=001
    output reg [2:0] pedestrian_light  // R/G for pedestrian: Red=100, Green=001
);

// Define states
parameter RED_STATE = 3'b001;
parameter RED_YELLOW_STATE = 3'b010;
parameter GREEN_STATE = 3'b011;
parameter YELLOW_STATE = 3'b100;

// Internal state register
reg [2:0] current_state, next_state;

// Timer for state duration
reg [15:0] timer;
reg timer_max_reached;

// Timer values for each state (in clock cycles)
parameter T_RED = 16'd50;      // Red light duration
parameter T_RED_YELLOW = 16'd5; // Red+Yellow duration
parameter T_GREEN = 16'd40;    // Green light duration
parameter T_YELLOW = 16'd5;    // Yellow light duration

// Counter for clock division (to make timing more realistic)
reg [23:0] clock_divider;
parameter CLOCK_DIV = 24'd1000000; // Assuming 100MHz clock, this gives ~10Hz effective clock

// Clock divider
always @(posedge clk) begin
    if (reset)
        clock_divider <= 24'd0;
    else if (clock_divider >= CLOCK_DIV)
        clock_divider <= 24'd0;
    else
        clock_divider <= clock_divider + 24'd1;
end

// Timer control
always @(posedge clk) begin
    if (reset || (clock_divider == 24'd0 && clock_divider !== 24'd0)) begin  // On clock division tick
        if (timer >= get_timer_limit(current_state) || timer_max_reached) begin
            timer <= 16'd0;
            timer_max_reached <= 1'b0;
        end else begin
            timer <= timer + 16'd1;
            if (timer >= get_timer_limit(current_state))
                timer_max_reached <= 1'b1;
        end
    end
end

// Function to get timer limit for each state
function [15:0] get_timer_limit;
    input [2:0] state;
    begin
        case(state)
            RED_STATE: get_timer_limit = T_RED;
            RED_YELLOW_STATE: get_timer_limit = T_RED_YELLOW;
            GREEN_STATE: get_timer_limit = T_GREEN;
            YELLOW_STATE: get_timer_limit = T_YELLOW;
            default: get_timer_limit = T_GREEN;
        endcase
    end
endfunction

// State transition logic
always @(posedge clk) begin
    if (reset)
        current_state <= RED_STATE;
    else
        current_state <= next_state;
end

// Next state logic
always @(*) begin
    case(current_state)
        RED_STATE: begin
            if (timer_max_reached || pedestrian_request)
                next_state = GREEN_STATE;
            else
                next_state = RED_STATE;
        end
        
        GREEN_STATE: begin
            if (timer_max_reached)
                next_state = YELLOW_STATE;
            else
                next_state = GREEN_STATE;
        end
        
        YELLOW_STATE: begin
            if (timer_max_reached)
                next_state = RED_STATE;
            else
                next_state = YELLOW_STATE;
        end
        
        default: next_state = RED_STATE;
    endcase
end

// Output logic
always @(*) begin
    case(current_state)
        RED_STATE: begin
            light_control = 3'b100;      // Red light on
            pedestrian_light = 3'b100;   // Pedestrian red
        end
        
        RED_YELLOW_STATE: begin
            light_control = 3'b110;      // Red + Yellow lights on
            pedestrian_light = 3'b100;   // Pedestrian red
        end
        
        GREEN_STATE: begin
            light_control = 3'b001;      // Green light on
            pedestrian_light = 3'b001;   // Pedestrian green
        end
        
        YELLOW_STATE: begin
            light_control = 3'b010;      // Yellow light on
            pedestrian_light = 3'b100;   // Pedestrian red
        end
        
        default: begin
            light_control = 3'b100;      // Default to red
            pedestrian_light = 3'b100;   // Pedestrian red
        end
    endcase
end

endmodule

// Testbench for the traffic light controller
module tb_traffic_light_controller;
    reg clk;
    reg reset;
    reg pedestrian_request;
    wire [2:0] light_control;
    wire [2:0] pedestrian_light;
    
    // Instantiate the traffic light controller
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .pedestrian_request(pedestrian_request),
        .light_control(light_control),
        .pedestrian_light(pedestrian_light)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units period
    end
    
    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        pedestrian_request = 0;
        #20;
        reset = 0;
        
        // Wait and observe normal cycle
        #1000;
        
        // Test pedestrian request during red
        pedestrian_request = 1;
        #10;
        pedestrian_request = 0;
        #1000;
        
        // Finish simulation
        #100;
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time: %0t | State: %b | Light: %b | Ped Light: %b | Ped Req: %b", 
                 $time, uut.current_state, light_control, pedestrian_light, pedestrian_request);
    end
    
endmodule
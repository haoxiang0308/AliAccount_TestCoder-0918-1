// Traffic Light Controller using Finite State Machine
// Designed for a simple traffic light system with pedestrian crossing

module traffic_light_fsm (
    input wire clk,
    input wire reset,
    input wire pedestrian_request,
    output reg [2:0] ns_light,  // North-South lights: [2]Red, [1]Yellow, [0]Green
    output reg [2:0] ew_light   // East-West lights: [2]Red, [1]Yellow, [0]Green
);

    // Define states for the traffic light FSM
    typedef enum logic [2:0] {
        NS_GREEN  = 3'b000,  // North-South Green, East-West Red
        NS_YELLOW = 3'b001,  // North-South Yellow, East-West Red
        EW_GREEN  = 3'b010,  // North-South Red, East-West Green
        EW_YELLOW = 3'b011,  // North-South Red, East-West Yellow
        ALL_RED   = 3'b100   // All directions Red (safety state)
    } state_t;

    state_t current_state, next_state;

    // Counter for timing control (assuming 1Hz clock for demo, adjust as needed)
    reg [23:0] counter;  // 24-bit counter for longer timing
    parameter NS_GREEN_TIME = 25'd5000000;  // 5 seconds at 10MHz clock
    parameter NS_YELLOW_TIME = 25'd2000000; // 2 seconds at 10MHz clock
    parameter EW_GREEN_TIME = 25'd5000000;  // 5 seconds at 10MHz clock
    parameter EW_YELLOW_TIME = 25'd2000000; // 2 seconds at 10MHz clock
    parameter ALL_RED_TIME = 25'd1000000;   // 1 second at 10MHz clock

    // State register
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= NS_GREEN;
            counter <= 0;
        end else begin
            current_state <= next_state;
            if (current_state != next_state) begin
                counter <= 0;  // Reset counter when changing states
            end else begin
                counter <= counter + 1;  // Increment counter
            end
        end
    end

    // Next state logic
    always_comb begin
        case (current_state)
            NS_GREEN: begin
                if (counter >= NS_GREEN_TIME || pedestrian_request)
                    next_state = NS_YELLOW;
                else
                    next_state = NS_GREEN;
            end
            
            NS_YELLOW: begin
                if (counter >= NS_YELLOW_TIME)
                    next_state = EW_GREEN;
                else
                    next_state = NS_YELLOW;
            end
            
            EW_GREEN: begin
                if (counter >= EW_GREEN_TIME)
                    next_state = EW_YELLOW;
                else
                    next_state = EW_GREEN;
            end
            
            EW_YELLOW: begin
                if (counter >= EW_YELLOW_TIME)
                    next_state = NS_GREEN;
                else
                    next_state = EW_YELLOW;
            end
            
            ALL_RED: begin
                if (counter >= ALL_RED_TIME)
                    next_state = NS_GREEN;
                else
                    next_state = ALL_RED;
            end
            
            default: next_state = NS_GREEN;
        endcase
    end

    // Output logic - set light values based on current state
    always_comb begin
        // Default: turn off all lights
        ns_light = 3'b000;
        ew_light = 3'b000;
        
        case (current_state)
            NS_GREEN: begin
                ns_light = 3'b001;  // NS Green ON
                ew_light = 3'b100;  // EW Red ON
            end
            
            NS_YELLOW: begin
                ns_light = 3'b010;  // NS Yellow ON
                ew_light = 3'b100;  // EW Red ON
            end
            
            EW_GREEN: begin
                ns_light = 3'b100;  // NS Red ON
                ew_light = 3'b001;  // EW Green ON
            end
            
            EW_YELLOW: begin
                ns_light = 3'b100;  // NS Red ON
                ew_light = 3'b010;  // EW Yellow ON
            end
            
            ALL_RED: begin
                ns_light = 3'b100;  // NS Red ON
                ew_light = 3'b100;  // EW Red ON
            end
            
            default: begin
                ns_light = 3'b100;  // NS Red ON (safety default)
                ew_light = 3'b100;  // EW Red ON (safety default)
            end
        endcase
    end

endmodule

// Testbench for the traffic light controller
module tb_traffic_light_fsm;
    reg clk;
    reg reset;
    reg pedestrian_request;
    wire [2:0] ns_light;
    wire [2:0] ew_light;
    
    // Instantiate the traffic light module
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .pedestrian_request(pedestrian_request),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );
    
    // Clock generation (10MHz clock for timing)
    initial begin
        clk = 0;
        forever #50 clk = ~clk;  // 10ns period = 100MHz, adjust as needed
    end
    
    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        pedestrian_request = 0;
        #100;
        reset = 0;
        
        // Normal operation - let it cycle through states
        #100000000;  // Run for a while
        
        // Test pedestrian request during NS_GREEN
        #1000;
        pedestrian_request = 1;
        #10000000;
        pedestrian_request = 0;
        
        // Continue running
        #50000000;
        
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time=%0t, State=%b, NS_Light=%b, EW_Light=%b, Ped_Req=%b", 
                 $time, uut.current_state, ns_light, ew_light, pedestrian_request);
    end
    
    // Write VCD file for waveform viewing
    initial begin
        $dumpfile("traffic_light_fsm.vcd");
        $dumpvars(0, tb_traffic_light_fsm);
    end
endmodule
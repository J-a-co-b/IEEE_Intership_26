`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026
// Design Name: 
// Module Name: system_top
// Project Name: 
// Target Devices: xc7s5ocsga324-1 (Spartan-7)
// Tool Versions: Vivado
// Description: Complete integration of the 100MHz to 1Hz clock divider, 
//              temperature/vibration comparators, warning generator, 
//              and final decision logic.
// 
//////////////////////////////////////////////////////////////////////////////////

module top_module(
    // 1. MODULE PORTS MUST BE THE PHYSICAL PADS
    input  wire       clk,     // 100 MHz base clock from FPGA
    input  wire       rst,
    input  wire [7:0] temp,
    input  wire [7:0] vib, 
    input valid,

    output reg       normal,
    output reg       repair,
    output reg       change
);

 

    wire       top_clk;

 
// 3. INTERNAL WIRES (Bridging Logic to Logic)
    wire clk_1hz_sig;       
    wire temp_comp_sig;
    wire vib_comp_sig;      

    wire t_low, t_mid, t_high;
    wire v_low, v_mid, v_high; 

    // =========================================================
    // 1. Clock Management
    // =========================================================
    clock_divider clk_div_inst (
        .clk(clk),
        .rst(rst),
        .clk_1hz(clk_1hz_sig)
    );

    // =========================================================
    // 2. Sensor Comparators
    // =========================================================
    comparator_temp temp_cmp_inst (
        .temp_value(temp),
        .temp_comp(temp_comp_sig)
    );

    comparator_vib vib_cmp_inst (
        .vib_value(vib),
        .vib_comp(vib_comp_sig)
    );

    // =========================================================
    // 3. Combined Warning Generator (Timers)
    // =========================================================
    warning_generator warn_gen_inst (
        .clk_1hz(clk_1hz_sig),    // Driven by the clock divider
        .rst(rst),
        
        // Inputs from comparators
        .temp_comp(temp_comp_sig),
        .vib_comp(vib_comp_sig),
        
        // Temperature warning outputs
        .temp_low(t_low),
        .temp_mid(t_mid),
        .temp_high(t_high),
        
        // Vibration warning outputs
        .vib_low(v_low),
        .vib_mid(v_mid),
        .vib_high(v_high)
    );


    // =========================================================
    // 4. Final Decision Logic
    // =========================================================
    reg [1:0] state_reg;
    
    localparam IDLE   = 2'b00,
               STATE1 = 2'b01,
               STATE2 = 2'b10,
               STATE3 = 2'b11;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            normal    <= 0;
            repair    <= 0;
            change    <= 0;
            state_reg <= IDLE;
        end 
        else begin
            case(state_reg)
                IDLE: begin
                    normal <= 0;
                    repair <= 0;
                    change <= 0;
                    state_reg <= STATE1; 
                end
                
                STATE1: begin
                    normal <= 0;
                    repair <= 0;
                    change <= 0;

                    // Healthy condition (using correct wire names from warn_gen_inst)
                    if ( !(t_low | t_mid | t_high | v_low | v_mid | v_high) ) begin
                        normal <= 1;
                    end
                    // Low + Low
                    else if (t_low && v_low) begin
                        normal <= 1;
                    end
                    // Change Needed Cases
                    else if ( (t_mid && v_high) || (t_high && v_mid) || (t_high && v_high) ) begin
                        change <= 1;
                    end
                    // Remaining valid cases
                    else begin
                        repair <= 1;
                    end
                    
                    // Note: You currently have no condition to leave STATE1. 
                    // It will remain here evaluating the inputs on every clock cycle.
                end
                
                default: state_reg <= IDLE;
            endcase
        end
    end

endmodule
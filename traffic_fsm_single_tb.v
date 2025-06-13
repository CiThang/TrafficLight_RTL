`timescale 1ns/1ps
`include "traffic_fsm_single.v"

module traffic_fsm_single_tb;

    reg clk;
    reg rst_n;
    wire [1:0] led;
    wire [5:0] timer_value;


    // Instantiate the DUT (Device Under Test)
    traffic_fsm_single uut (
        .clk(clk),
        .rst_n(rst_n),
        .led(led),
        .timer_value(timer_value)
    );

    // Clock generation: 1Hz = 1s period => toggle every 0.5s = 500,000,000 ns
    // But for simulation, we use faster clock for practicality
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock (10ns period)
    end

    // Stimulus
    initial begin
        // Dump waveform
        $dumpfile("traffic_fsm_single_tb.vcd");
        $dumpvars(0, traffic_fsm_single_tb);

        // Initial reset
        rst_n = 0;
        #20;         // Wait 20ns
        rst_n = 1;

        // Run simulation for enough time to see all light cycles
        #1000;       // Simulate 1000ns

        $finish;
    end

endmodule

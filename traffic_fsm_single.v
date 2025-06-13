module traffic_fsm_single(
    input clk,
    input rst_n,
    output reg [1:0] led, // 00: Red, 01: Green, 10: Yellow
    output reg [5:0] timer_value
);

    reg [1:0] state;
    reg [4:0] counter; // để đếm giây (1Hz)

    // Định nghĩa trạng thái
    localparam S_RED    = 2'b00,
               S_GREEN  = 2'b01,
               S_YELLOW = 2'b10;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_RED;
            counter <= 18;
            led <= 2'b00;
            timer_value <= 18;
        end else begin
            case (state)
                S_RED: begin
                    led <= 2'b00;
                    if (counter == 0) begin
                        state <= S_GREEN;
                        counter <= 15;
                    end else begin
                        counter <= counter - 1;
                    end
                end
                S_GREEN: begin
                    led <= 2'b01;
                    if (counter == 0) begin
                        state <= S_YELLOW;
                        counter <= 3;
                    end else begin
                        counter <= counter - 1;
                    end
                end
                S_YELLOW: begin
                    led <= 2'b10;
                    if (counter == 0) begin
                        state <= S_RED;
                        counter <= 18;
                    end else begin
                        counter <= counter - 1;
                    end
                end
                default: begin
                    state <= S_RED;
                    counter <= 18;
                    led <= 2'b00;
                end
            endcase
            timer_value <= counter;
        end
    end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2024 21:52:02
// Design Name: 
// Module Name: uart_rx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_rx(input clk, rst, data_in, data_ready, output [7:0] data_out);
    localparam IDLE = 0;
    localparam DATA_WAIT = 1;
    localparam RECIEVING = 2;

    localparam START_DELAY = 5200;
    localparam SAMPLE_DELAY = 10400;
    
    reg [7:0] recieved_data_buff = 0;
    reg [1:0] state = IDLE;
    reg [4:0] data_counter = 0;
    reg rx_complete = 0;
    
    integer delay_counter = 0;
    wire data_edge;
    
    edge_detector detector(clk, data_in, data_edge);
    
    assign data_out = recieved_data_buff;
    assign data_ready = rx_complete;
    always @ (posedge clk, posedge rst)begin
        
        if(rst) begin
             state = IDLE;
             recieved_data_buff = 0; //huh ?
             data_counter = 0;
             delay_counter = 0;
        end else begin
            case (state)
                IDLE: begin
                    rx_complete = 0;
                    if(data_edge)
                        state = DATA_WAIT;
                end
                
                DATA_WAIT : begin
                    delay_counter = delay_counter + 1;
                    if(delay_counter >= START_DELAY)begin
                        state = RECIEVING;
                        delay_counter = 0;
                    end
                end
                
                RECIEVING : begin
                    delay_counter = delay_counter + 1;
                    if(delay_counter >= SAMPLE_DELAY)begin
                        recieved_data_buff[data_counter] = data_in;
                        data_counter = data_counter + 1;
                        delay_counter = 0;
                    end
                    if(data_counter >= 8) begin
                        state = IDLE;
                        data_counter = 0;
                        rx_complete = 1;
                    end
                end
                
                default  : state = IDLE;
            endcase
        end
    end

endmodule

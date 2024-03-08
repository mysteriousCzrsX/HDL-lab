`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2024 21:51:45
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(input clk, rst, tx_enable, input [7:0] data_in, output data_out);
    localparam IDLE = 0;
    localparam TRANSMITING = 1;

    localparam START_DELAY = 5200;
    localparam SAMPLE_DELAY = 10400;
    
    reg serial_out = 1;
    reg state = IDLE;
    reg [4:0] data_counter = 0;
    reg [9:0] data_out_buff = 10'b1000000000;
    integer delay_counter = 0;
    wire tx_en_edge;
    
    edge_detector detector(clk, tx_enable, tx_en_edge);
    
    assign data_out = serial_out;
    
    always @ (posedge clk, posedge rst)begin
        
        if(rst) begin
             state = IDLE;
             serial_out = 1;
             data_counter = 0;
             delay_counter = 0;
        end else begin
            case (state)
                IDLE: begin
                    if(tx_en_edge)begin //fix this
                        state = TRANSMITING;
                        data_out_buff[8:1] = data_in;
                    end
                end
                
                TRANSMITING : begin
                    delay_counter = delay_counter + 1;
                    if(delay_counter >= SAMPLE_DELAY)begin
                        serial_out = data_out_buff[data_counter];
                        data_counter = data_counter + 1;
                        delay_counter = 0;
                    end
                    if(data_counter >= 10) begin
                        state = IDLE;
                        data_counter = 0;
                    end
                end
                
                default  : state = IDLE;
            endcase
        end
    end
endmodule

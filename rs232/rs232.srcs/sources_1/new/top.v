`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2024 21:32:42
// Design Name: 
// Module Name: top
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


module top(input clk_i, rst_i, RXD_i, output TXD_o);
wire [7:0] uart_data;
wire [7:0] uart_data_added;
wire data_ready;

assign uart_data_added = uart_data + 8'h20;

uart_rx reciever(clk_i, rst_i, RXD_i, data_ready, uart_data);
uart_tx transmiter(clk_i, rst_i, data_ready, uart_data_added, TXD_o);

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2024 22:43:40
// Design Name: 
// Module Name: rs232_tb
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



module rs232_tb();

    reg clk;
    reg rst;
    reg RXD;
    wire TXD;
    reg [7:0] serial_data = 8'b11001010;
    integer i = 0;
    parameter PERIOD = 104100;
    always #5 clk = ~clk;
    
    top u0(clk, rst, RXD, TXD);
    
    initial begin
        clk = 0;
        rst = 0;
        RXD = 1;
        #PERIOD;
        #PERIOD RXD = 0;
        for(i = 0; i < 8; i = i + 1) begin
            #PERIOD RXD = serial_data[i];
        end
        #PERIOD RXD = 1;
        #PERIOD $finish; 
     end
endmodule

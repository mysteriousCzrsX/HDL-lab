`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2024 13:07:28
// Design Name: 
// Module Name: counter_tb
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


module counter_tb();
    
    reg clk;
    reg rst;
    wire led;
    
    always #5 clk = ~clk;
    
    top u0(clk, rst, led);
    defparam u0.DIVISOR = 5;
    
    initial begin
        clk = 0;
        rst = 1;
        #500 rst = 0;
        #1 rst = 1;
        #500 $finish;
    end
    
endmodule

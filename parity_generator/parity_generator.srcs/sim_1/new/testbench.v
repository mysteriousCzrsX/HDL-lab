`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2024 18:23:41
// Design Name: 
// Module Name: testbench
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


module testbench();

    reg [15:0] sw_i;
    wire [7:0] seg_o;
    wire [7:0] an_o;
    integer i;
    top u0(sw_i, an_o, seg_o);
    initial begin
        sw_i = 16'b0;
        for(i = 0; i < 30; i = i+1)begin
            #5 sw_i = sw_i + 16'b1;
        end
        $finish;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2024 19:57:36
// Design Name: 
// Module Name: frequency_divider
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


module frequency_divider
#(parameter DIVISOR = 100000000)
(input clk_i, rst_i,output divided_out 
);
    
    reg divided = 0;
    integer counter = 0;

   // assign led_o = divided_out;
    
    always @ (posedge clk_i or posedge rst_i) begin
        if(rst_i) begin
            divided = 0;
            counter = 0;
        end else begin
            counter = counter + 1;
            if(counter == DIVISOR/2)
                divided = ~divided;
            if(counter >= DIVISOR)begin
                divided = ~divided;
                counter = 0;
            end
        end
    end
    
    assign divided_out = divided;
    
endmodule
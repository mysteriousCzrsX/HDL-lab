`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2024 23:39:56
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(input clk, input_signal, output edge_out);
    
    reg previous_signal;
    
    always @ (posedge clk) begin
        previous_signal =  input_signal;        
    end
    
    assign edge_out = ~input_signal & previous_signal;
    
endmodule

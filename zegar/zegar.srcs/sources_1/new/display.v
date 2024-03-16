`timescale 1ns / 1ps
`define divider_display 250000 
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2024 19:48:08
// Design Name: 
// Module Name: display
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

module display(
    input clk_i,      
    input rst_i,     
    input [16:0] timer,   
    output  [7:0] led7_seg_o,  
    output  [7:0] led7_an_o    
);

reg [3:0] number;      
reg [7:0] led7_seg;    
reg [7:0] led7_an;     

wire clk;             

integer counter = 0;   

divider d(clk_i, rst_i, `divider_display, clk);


always @(posedge clk_i or posedge rst_i) begin
    if (rst_i)
        counter <= 0;
    else
        counter <= counter + 1;
end

// Display Logic
always @(*) begin
    case(counter[19:18])
        2'b00: begin
            led7_an = 8'b11110111; 
            number = ((timer / 3600) % 60) / 10;
        end
        2'b01: begin
            led7_an = 8'b11111011; 
            number = ((timer / 3600) % 60) % 10;
        end
        2'b10: begin
            led7_an = 8'b11111101; 
            number = ((timer / 60) % 60) / 10;
        end
        2'b11: begin
            led7_an = 8'b11111110; 
            number = ((timer / 60) % 60) % 10;
        end
    endcase


    case(number)
        4'b0000: led7_seg = 8'b00000011;    
        4'b0001: led7_seg = 8'b10011111; 
        4'b0010: led7_seg = 8'b00100101; 
        4'b0011: led7_seg = 8'b00001101; 
        4'b0100: led7_seg = 8'b10011001; 
        4'b0101: led7_seg = 8'b01001001; 
        4'b0110: led7_seg = 8'b01000001; 
        4'b0111: led7_seg = 8'b00011111;
        4'b1000: led7_seg = 8'b00000001;     
        4'b1001: led7_seg = 8'b00001001; 
        default: led7_seg = 8'b00000011; 
    endcase

    
    if (led7_an == 8'b11111011)
        led7_seg[0] = ~counter[0];
end


assign led7_an_o = led7_an;
assign led7_seg_o = led7_seg;

endmodule

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.02.2024 00:31:52
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

module top(input [15:0] sw_i, output [7:0] an_o, seg_o);
    wire parity_bit;
    assign parity_bit = ^sw_i;
    assign an_o = 8'b11111110;
    assign seg_o = parity_bit ? 8'b00000011 : 8'b01100001; //O = 00000011 E = 01100001
endmodule

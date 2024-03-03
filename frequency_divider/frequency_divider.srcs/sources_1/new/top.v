//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2024 12:39:38
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

module top
#(parameter DIVISOR = 100000000)
(input clk_i, rst_i, output led_o);

    reg divided_out = 0;
    integer counter = 0;
    
    assign led_o = divided_out;
    
    always @ (posedge clk_i or negedge rst_i) begin
        if(!rst_i) begin
            divided_out = 0;
            counter = 0;
        end else begin
            counter = counter + 1;
            if(counter == DIVISOR/2)
                divided_out = ~divided_out;
            if(counter >= DIVISOR)begin
                divided_out = ~divided_out;
                counter = 0;
            end
        end
    end
    
endmodule

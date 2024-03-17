`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2024 18:37:04
// Design Name: 
// Module Name: zegar
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


module rtc(
    input clk_i,
    input rst_i,
    input button_hr_i,
    input button_min_i,
    input button_test_i,
    output [7:0] led7_seg_o,
    output [7:0] led7_an_o);
  
   reg [16:0] sec = 0;
   reg [16:0] min = 0;
   reg [16:0] h= 0;
   reg test = 1'b0;  
    
debouncer minutes(clk_i, rst_i, button_min_i, button_min);
    always @(posedge button_min or posedge rst_i) begin
        if (rst_i)
            min = 0;
        else
            min = (min + 60)% 3600;
        end
        
debouncer hours(clk_i, rst_i, button_hr_i, button_hr);
    always @(posedge button_hr or posedge rst_i) begin
        if (rst_i)
            h = 0;
        else
            h = (h + 3600) % 86400;
    end
    
 debouncer d_test(clk_i,rst_i,button_test_i, button_test);
    always @(posedge button_test or posedge rst_i) begin
        if (rst_i)
            test = 1'b0;
        else
            test = ~test;
    end

frequency_divider(clk_i, rst_i,divided_out); // do poprawy, ze f sie zmienia z testem
always @(posedge divided_out or posedge rst_i) begin //
        if (rst_i)
            sec = 'd0;
        else begin
            if (divided_out)      
                sec = sec + 1;                    
            sec = sec % 86400;
        end
    end

display dp(clk_i, rst_i, (sec + min + hours) % 86400, led7_seg_o, led7_an_o);

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2024 19:14:24
// Design Name: 
// Module Name: zegar_tb
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

module rtc_tb;

   reg clk_i;
   reg rst_i;
   reg button_hr_i;
   reg button_min_i;
   reg button_test_i;
   wire [7:0] led7_seg_o;
   wire [7:0] led7_an_o;
   
 real_time_clock t(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .button_hr_i(button_hr_i),
      .button_min_i(button_min_i),
      .button_test_i(button_test_i),
      .led7_seg_o(led7_seg_o),
      .led7_an_o(led7_an_o)
   );

 
   always #10 clk_i = ~clk_i;

 
   initial begin
      clk_i = 0;
      rst_i = 1;
      button_hr_i = 0;
      button_min_i = 0;
      button_test_i = 0;
      #100; 
      rst_i = 0;
      #1000; 
      button_hr_i = 1; 
      button_hr_i = 0;
      #500;
      button_min_i = 1; 
      #10;
      button_min_i = 0;
      #10000; 
   $finish; 
   end

endmodule
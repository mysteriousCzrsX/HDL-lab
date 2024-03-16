`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2024 19:53:34
// Design Name: 
// Module Name: debouncer
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
module debouncer (
    input clk_i,
    input input_i,
    output output_i
);

reg [21:0] licznik;

always @(posedge clk_i) begin
    if (input_i == 1'b0) begin
        licznik <= {22{1'b1}};
    end else begin
        if (licznik != 22'b0) begin
            licznik <= licznik - 1;
        end
    end
end

assign output_i = (licznik == 22'b0) ? 1'b1 : 1'b0;

endmodule



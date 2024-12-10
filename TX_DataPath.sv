`timescale 1ns / 1ps


module TX_DataPath(
    input clk,
    input reset_n,
    input load,
    input reg [8:0] TX,  
    output logic TX_out,CountSig
);
    logic [3:0] count;    

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            TX_out <= 1; 
            count <= 0;
        end 
        else if (load) begin
            TX_out <= 0; 
            count <= 1;  
        end 
        else if (count >= 0 && count < 10) begin
            TX_out <= TX[0]; 
            TX <= TX >> 1;   
            count <= count + 1;
        end else if (count == 10) begin
            TX_out <= 1; 
            count <= 0;  
            CountSig<=1;
        end
    end

endmodule
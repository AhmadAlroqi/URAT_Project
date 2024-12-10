`timescale 1ns / 1ps

module Top_Tx(
    input logic clk,
    input logic reset_n,
    input logic startBTNC,
    input logic TX_load,
    input reg [8:0] TX,  
    output logic TX_out,
    output logic CountSig
);

   

    TX_DataPath TX_DataPath_inst (
        .clk(clk),
        .reset_n(reset_n),
        .load(TX_load),
        .TX(TX),
        .TX_out(TX_out),
        .CountSig(CountSig)
    );

    Tx_Control Tx_Control_inst (
        .clk(clk),
        .reset_n(reset_n),
        .startBTNC(startBTNC),
        .COUNT(CountSig),
        .TX_load(TX_load)
    );

endmodule

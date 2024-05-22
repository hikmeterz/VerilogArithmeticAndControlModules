`timescale 1ns / 1ps

module boruhatti_toplama #(parameter N=8)(
    input clk,
    input [N-1:0] sayi1,
    input [N-1:0] sayi2,
    input [N-1:0] sayi3,
    input [N-1:0] sayi4,
    input [N-1:0] sayi5,
    input [N-1:0] sayi6,
    input [N-1:0] sayi7,
    input [N-1:0] sayi8,
    input giris_etkin,
    output reg[N+1:0] sonuc,//+2 fazla olmali N girisine gore.
    output reg sonuc_etkin
    );
endmodule

`timescale 1ns / 1ps

module duz_toplama #(parameter N=8)(
    input clk,
    input [N-1:0] sayi1,
    input [N-1:0] sayi2,
    input [N-1:0] sayi3,
    input [N-1:0] sayi4,
    input [N-1:0] sayi5,
    input [N-1:0] sayi6,
    input [N-1:0] sayi7,
    input [N-1:0] sayi8,
    input [N-1:0] sayi9,
    input [N-1:0] sayi10,
    input giris_etkin,
    output reg[N+1:0] sonuc,//+2 fazla olmali N girisine gore.5.cevrim sonunda cikacak olan deger olarak varsaydim.
    output reg sonuc_etkin

    );
    reg [2:0] sayac=0;//cevrimleri saymak icin kullanilan sayac.
    reg [N:0] toplanan_deger1;//toplamalarin tutulacagi deger. 
    reg [N:0] toplanan_deger2;
    reg [N:0] toplanan_deger1_next=0; 
    reg [N:0] toplanan_deger2_next=0;
    initial begin
        toplanan_deger1=sayi1;
        toplanan_deger2=sayi6;
        sonuc_etkin=0;
        sonuc=0;
    end   
    always@(*)begin
        toplanan_deger1_next=toplanan_deger1;
        toplanan_deger2_next=toplanan_deger2;
        if(giris_etkin==1'b1 && sayac==3'd0)begin//1.cevrim.
            toplanan_deger1_next=toplanan_deger1+sayi2;
            toplanan_deger2_next=toplanan_deger2+sayi7;
        end
        else if(giris_etkin==1'b1 && sayac==3'd1)begin//2.cevrim
            toplanan_deger1_next=toplanan_deger1+sayi3;
            toplanan_deger2_next=toplanan_deger2+sayi8;
        end   
        else if(giris_etkin==1'b1 && sayac==3'd2)begin//3.cevrim
            toplanan_deger1_next=toplanan_deger1+sayi4;
            toplanan_deger2_next=toplanan_deger2+sayi9;
        end   
        else if(giris_etkin==1'b1 && sayac==3'd3)begin//4.cevrim
            toplanan_deger1_next=toplanan_deger1+sayi5;
            toplanan_deger2_next=toplanan_deger2+sayi10;
        end
        else if(giris_etkin==1'b1 && sayac==3'd4)begin//cikarma islemi.
            if(toplanan_deger1_next>toplanan_deger2_next)begin
                sonuc=toplanan_deger1_next-toplanan_deger2_next;
            end
            else if(toplanan_deger2_next>toplanan_deger1_next)begin
                sonuc=toplanan_deger2_next-toplanan_deger1_next;
            end
            else begin
                sonuc=0;
            end
            sonuc_etkin=1;
        
        end   
    
    end
    
    
    always@(posedge clk) begin
        if(sayac==3'd5)begin
            sayac<=3'd0;//sayaci sifirla. 
            sonuc_etkin<=0;
            sonuc<=0;
        end
        else begin//sayaci bir artir.
            sayac<=sayac+1;
            toplanan_deger1<=toplanan_deger1_next;
            toplanan_deger2<=toplanan_deger2_next;    
        end
    end
    
    
endmodule

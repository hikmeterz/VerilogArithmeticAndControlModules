`timescale 1ns / 1ps
// Create Date: 13.11.2021 20:23:38


module kuyruk_denetleyicisi(
    input [31:0] kuyruk,
    input islem_yap,
    output reg [2:0] cevrim_sayisi,
    output reg[4:0] cikan_veri,
    output reg [31:0] yeni_kuyruk,
    output reg bitti
    
    );
    
    always@* begin
        bitti=1'b0;
        if(kuyruk[26:24]!=0)begin
            cevrim_sayisi= kuyruk[26:24]-1'b1;
            cikan_veri=0;
            yeni_kuyruk=kuyruk;
            yeni_kuyruk[26:24]=cevrim_sayisi;
            
        
        end
        else if(kuyruk[26:24]==0)begin
            cikan_veri=kuyruk[31:26];
            cevrim_sayisi= 1'b0;
            yeni_kuyruk=(kuyruk<<5);
        
        end
    
        bitti=1'b1;
    end
    
endmodule

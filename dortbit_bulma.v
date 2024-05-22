`timescale 1ns / 1ps 
// Create Date: 13.11.2021 19:03:34


module dortbit_bulma(
    input [3:0] sayi,
    output [2:0] basamak//rege izin vermedi.
    );
    
    wire [2:0] basamak1;//outputa reg vermemek icin.
    basamak_bulma b(.sayi(sayi[2:0]),.basamak(basamak1[1:0]));//4 bitlik sayiyi bulmada bu kisim hic degismiyor.O yuzden 
    //basamak cikisinin 0 ve 1. bitlerini wire ile bu metotun cikisindan aldim.
    
    wire k1,k2,k3,k4;
    not n1(k1,sayi[3]);
    not n2(k2,sayi[2]);
    not n3(k3,sayi[1]);
    not n4(k4,sayi[0]);
    and a1(basamak[2],k1,k2,k3,k4);
    
    buf b1(basamak[0],basamak1[0]);
    buf b2(basamak[1],basamak1[1]);
    
    
    
    
endmodule

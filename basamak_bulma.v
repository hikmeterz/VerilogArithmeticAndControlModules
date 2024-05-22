`timescale 1ns / 1ps
// Create Date: 13.11.2021 18:32:10
module basamak_bulma(
    input [2:0] sayi,
    output [1:0] basamak//rege izin vermedi.

    );
    //karnough sayi2 sayi1 sayi0|basamak1 basamak0
    wire k1,k2;
    not n1(k1,sayi[0]);
    not n2(k2,sayi[1]);
    and a1(basamak[1],k1,k2);
    
    wire k3,k4,k5,k7,k8;
    not n3(k3,sayi[0]);
    not n4(k4,sayi[2]);
    and a2(k7,k3,k4);
   
    not n5(k5,sayi[0]);
    and a3(k8,k5,sayi[1]);
    
    
    or o1(basamak[0],k7,k8);
    
    
endmodule

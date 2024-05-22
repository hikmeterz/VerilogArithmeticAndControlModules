`timescale 1ns / 1ps

module yaklasik_carpma(
    input clk,
    input [31:0]sayi1,
    input [31:0]sayi2,
    output reg [63:0] tahmini_sonuc 
    
    );
    //crpim durumunda en fazla olusaccak bit sayisi carpialacak  en fazl aiki sayinini  bit toplami kadar. oyuzden bellek satiri
    //4+4+(N+N)=64+8=72
    reg[2:0] sayac=0;
    reg [3:0]sira_sayma=0;
    reg [3:0]sira_sayma_next=0;
    reg bellek_kontrol=0;
    reg bellek_kontrol_next=0;
    reg [3:0]bellek_bulundu_kontrol_index;
    integer i;
    reg [71:0] bellek [7:0];
    initial begin
        for(i=0;i<8;i=i+1)begin//en basta 0 olarak doldurdum. 
            bellek[i]=0;
        end
    end
    integer tarama;
    always@(*)begin
          bellek_kontrol_next=bellek_kontrol;
          sira_sayma_next=sira_sayma;
          if(sayac==3'd0)begin
            for(tarama=0;tarama<8;tarama=tarama+1)begin
                if(bellek[tarama][71:68]==sayi1[31:28]&&bellek[tarama][67:64]==sayi2[31:28])begin
                    bellek_kontrol_next=1;//bulundu.
                    bellek_bulundu_kontrol_index=tarama;//tam atama yapiliyor mu emin deglim.
                end
            end
          end  
          else if(sayac==3'd1)begin
            if(bellek_kontrol_next==1)begin
                tahmini_sonuc=bellek[bellek_bulundu_kontrol_index][63:0];
            end
          
          end
          else if(sayac==3'd2)begin
            if(bellek_kontrol_next==0)begin
                tahmini_sonuc=sayi1*sayi2;//sonucu carp.
                bellek[sira_sayma_next][71:68]=sayi1[31:28];
                bellek[sira_sayma_next][67:64]=sayi2[31:28];
                bellek[sira_sayma_next][63:0]=sayi1*sayi2;
                if(sira_sayma_next<7)
                    sira_sayma_next=sira_sayma +1;
                else
                    sira_sayma_next=0;
            end
            else if(bellek_kontrol==1)begin
                //ikinci cevrimde bulunduysa ucuncu cevrimde hic bir sey yapma.
                tahmini_sonuc=sayi1*sayi2;//sonuc zaten aynidir.
                
            end
          end
                 
          
          

    end
    
    always@(posedge clk) begin
       if(sayac==3'd3)begin
            sayac<=3'd0;
            bellek_kontrol=0;
       
       end
       else begin
        sayac<=sayac+1;
       end
       bellek_kontrol<=bellek_kontrol_next;
       sira_sayma<=sira_sayma_next;
    end
endmodule

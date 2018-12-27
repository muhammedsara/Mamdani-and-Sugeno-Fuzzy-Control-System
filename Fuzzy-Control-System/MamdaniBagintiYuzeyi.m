global mu_giris CIKIS mu_CIKIS  ; 

altsinir_LDL=0; 
ustsinir_LDL=300;

altsinir_HDL=0; 
ustsinir_HDL=100;

altsinir_Risk=0; 
ustsinir_Risk=10;


X = altsinir_LDL:ustsinir_LDL;
Y = altsinir_HDL:ustsinir_HDL;
 

 for i=1:size(X,2)
    for j=1:size(Y,2)
        
         %1.Numerik Girisler
         
         x=X(i);
         y=Y(j); %her x-y noktasi icin sistemin z cikisi hesaplanir
         
         %GİRİŞ VE ÇIKIS ÜYELİK FONSİYONLARI

        %a.LDL-Duzeyi girisine ait uyelik fonksiyonlari ve bulaniklastirma

        YamukFISGiris(altsinir_LDL,0,0,90,110,ustsinir_LDL,x); 
        x_Dusuk_LDL=CIKIS;
        mu_xi_Dusuk_LDL=mu_giris;


        YamukFISGiris(altsinir_LDL,90,110,120,142,ustsinir_LDL,x);
        x_Dusuk_Sinirda_LDL=CIKIS;
        mu_xi_Dusuk_Sinirda_LDL=mu_giris;


        YamukFISGiris(altsinir_LDL,123,141,150,170,ustsinir_LDL,x);
        x_Sinirda_LDL=CIKIS;
        mu_xi_Sinirda_LDL=mu_giris;


        YamukFISGiris(altsinir_LDL,150,168,180,200,ustsinir_LDL,x);
        x_Sinirda_Yuksek_LDL=CIKIS;
        mu_xi_Sinirda_Yuksek_LDL=mu_giris;
        

        YamukFISGiris(altsinir_LDL,179,200,300,300,ustsinir_LDL,x);
        x_Yuksek_LDL=CIKIS;
        mu_xi_Yuksek_LDL=mu_giris;

        
        %b. HDL-Duzeyi girisine ait uyelik fonksiyonlari ve bulaniklastirma

        YamukFISGiris(altsinir_HDL,-45,-5,35,45,ustsinir_HDL,y); 
        y_Dusuk_HDL=CIKIS;
        mu_yi_Dusuk_HDL=mu_giris; 

        YamukFISGiris(altsinir_HDL,35,45,55,65,ustsinir_HDL,y); 
        y_Orta_HDL=CIKIS;
        mu_yi_Orta_HDL=mu_giris; 

        YamukFISGiris(altsinir_HDL,55,65,106,146,ustsinir_HDL,y); 
        y_Yuksek_HDL=CIKIS;
        mu_yi_Yuksek_HDL=mu_giris; 


        %c. Kalp-Hastaligi-Riski cikisina ait uyelik fonksiyonlari

        UcgenFISCikis(altsinir_Risk, 0, 0, 2.5,ustsinir_Risk)
        Z=CIKIS;  
        mu_Ekstra_Riskli=mu_CIKIS;  

        UcgenFISCikis(altsinir_Risk, 0, 2.5, 5, ustsinir_Risk)
        mu_Yuksek_Riskli=mu_CIKIS;

        UcgenFISCikis(altsinir_Risk,2.5, 5, 7.5, ustsinir_Risk)
        mu_Orta_Riskli=mu_CIKIS;

        UcgenFISCikis(altsinir_Risk, 5, 7.5, 10, ustsinir_Risk)
        mu_Dusuk_Riskli=mu_CIKIS;

        UcgenFISCikis(altsinir_Risk, 7.5, 10, 10, ustsinir_Risk)
        mu_Risk_Yok=mu_CIKIS;



        %3. KURAL TABANI
        
        %a KURAL GIRISLERI

        mu_kural1 = min(mu_xi_Dusuk_LDL, mu_yi_Dusuk_HDL);
        
        mu_kural2 = min(mu_xi_Dusuk_LDL, mu_yi_Orta_HDL);
        
        mu_kural3 = min(mu_xi_Dusuk_LDL, mu_yi_Yuksek_HDL);

        mu_kural4 = min(mu_xi_Dusuk_Sinirda_LDL, mu_yi_Dusuk_HDL);

        mu_kural5 = min(mu_xi_Dusuk_Sinirda_LDL, mu_yi_Orta_HDL);

        mu_kural6 = min(mu_xi_Dusuk_Sinirda_LDL, mu_yi_Yuksek_HDL);

        mu_kural7 = min(mu_xi_Sinirda_LDL, mu_yi_Dusuk_HDL);

        mu_kural8 = min(mu_xi_Sinirda_LDL, mu_yi_Orta_HDL);

        mu_kural9 = min(mu_xi_Sinirda_LDL, mu_yi_Yuksek_HDL);

        mu_kural10 = min(mu_xi_Sinirda_Yuksek_LDL, mu_yi_Dusuk_HDL);

        mu_kural11 = min(mu_xi_Sinirda_Yuksek_LDL, mu_yi_Orta_HDL);

        mu_kural12 = min(mu_xi_Sinirda_Yuksek_LDL, mu_yi_Yuksek_HDL);

        mu_kural13 = min(mu_xi_Yuksek_LDL, mu_yi_Dusuk_HDL);

        mu_kural14 = min(mu_xi_Yuksek_LDL, mu_yi_Orta_HDL);

        mu_kural15 = min(mu_xi_Yuksek_LDL, mu_yi_Yuksek_HDL);


        %b. GEREKTIRME 
        
        mu_sonuc1=mu_kural1*mu_Orta_Riskli;
        
        mu_sonuc2=mu_kural2*mu_Dusuk_Riskli;
        
        mu_sonuc3=mu_kural3*mu_Risk_Yok;
        
        mu_sonuc4=mu_kural4*mu_Orta_Riskli;
        
        mu_sonuc5=mu_kural5*mu_Dusuk_Riskli;
        
        mu_sonuc6=mu_kural6*mu_Dusuk_Riskli;
        
        mu_sonuc7=mu_kural7*mu_Yuksek_Riskli;
        
        mu_sonuc8=mu_kural8*mu_Orta_Riskli;
        
        mu_sonuc9=mu_kural9*mu_Dusuk_Riskli;
        
        mu_sonuc10=mu_kural10*mu_Yuksek_Riskli;
        
        mu_sonuc11=mu_kural11*mu_Yuksek_Riskli;
        
        mu_sonuc12=mu_kural12*mu_Orta_Riskli;
        
        mu_sonuc13=mu_kural13*mu_Ekstra_Riskli;
        
        mu_sonuc14=mu_kural14*mu_Yuksek_Riskli;
        
        mu_sonuc15=mu_kural15*mu_Orta_Riskli;
        

        %4.BIRLESTIRME 
        
      
        tmp1=max(max(mu_sonuc1,mu_sonuc2),max(mu_sonuc3,mu_sonuc4));
        tmp2=max(max(mu_sonuc5,mu_sonuc6),max(mu_sonuc7,mu_sonuc8));
        tmp3=max(max(mu_sonuc9,mu_sonuc10),max(mu_sonuc11,mu_sonuc12));
        tmp4=max(mu_sonuc13,mu_sonuc14);
        tmp5=max(max(tmp1,tmp2),max(tmp3,tmp4));
        tmp6=max(tmp5,mu_sonuc15);

        mu_birlestirme=tmp6;

        
         %5.DURULASTIRMA 
 
         toplam_alan = sum(mu_birlestirme);
         if toplam_alan == 0
            'Agirlik Merkezi Yonteminde Toplam Alan Sifirdir!';
         end
         
         z(j,i) = sum(mu_birlestirme.*Z)/toplam_alan;
         
         
    end   %j
    
 end  %i
 
    [X,Y]=meshgrid(X,Y);
    
    surf(X,Y,z) % X ve Y ye gore z leri cizer
    xlabel('x');
    ylabel('y');
    zlabel('z')






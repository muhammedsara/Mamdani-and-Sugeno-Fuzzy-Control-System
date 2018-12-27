global mu_giris;

altsinir_LDL=0; 
ustsinir_LDL=300;

altsinir_HDL=0; 
ustsinir_HDL=100;


X = altsinir_LDL:ustsinir_LDL;
Y = altsinir_HDL:ustsinir_HDL;



for i=1:size(X,2)
    for j=1:size(Y,2)

     toplam_alan=0;

    
     x=X(i);
     y=Y(j); %her x-y noktasi icin sistemin z cikisi hesaplanir


    YamukFISGiris(altsinir_LDL,0,0,90,110,ustsinir_LDL,x); 
    mu_xi_Dusuk_LDL=mu_giris;


    YamukFISGiris(altsinir_LDL,90,110,120,142,ustsinir_LDL,x);
    mu_xi_Dusuk_Sinirda_LDL=mu_giris;


    YamukFISGiris(altsinir_LDL,123,141,150,170,ustsinir_LDL,x);
    mu_xi_Sinirda_LDL=mu_giris;


    YamukFISGiris(altsinir_LDL,150,168,180,200,ustsinir_LDL,x);
    mu_xi_Sinirda_Yuksek_LDL=mu_giris;


    YamukFISGiris(altsinir_LDL,179,200,300,300,ustsinir_LDL,x);
    mu_xi_Yuksek_LDL=mu_giris;


    %b . HDL-Duzeyi girisine ait uyelik fonksiyonlari ve bulaniklastirma

    YamukFISGiris(altsinir_HDL,-45,-5,35,45,ustsinir_HDL,y); 
    mu_yi_Dusuk_HDL=mu_giris; 

    YamukFISGiris(altsinir_HDL,35,45,55,65,ustsinir_HDL,y); 
    mu_yi_Orta_HDL=mu_giris; 

    YamukFISGiris(altsinir_HDL,55,65,106,146,ustsinir_HDL,y); 
    mu_yi_Yuksek_HDL=mu_giris; 


    z1=0;
    z2=2.5;
    z3=5;
    z4=7.5;
    z5=10;



    w1 = min(mu_xi_Dusuk_LDL, mu_yi_Dusuk_HDL);

    w2 = min(mu_xi_Dusuk_LDL, mu_yi_Orta_HDL);

    w3 = min(mu_xi_Dusuk_LDL, mu_yi_Yuksek_HDL);

    w4 = min(mu_xi_Dusuk_Sinirda_LDL, mu_yi_Dusuk_HDL);

    w5 = min(mu_xi_Dusuk_Sinirda_LDL, mu_yi_Orta_HDL);

    w6 = min(mu_xi_Dusuk_Sinirda_LDL, mu_yi_Yuksek_HDL);

    w7 = min(mu_xi_Sinirda_LDL, mu_yi_Dusuk_HDL);

    w8 = min(mu_xi_Sinirda_LDL, mu_yi_Orta_HDL);

    w9 = min(mu_xi_Sinirda_LDL, mu_yi_Yuksek_HDL);

    w10 = min(mu_xi_Sinirda_Yuksek_LDL, mu_yi_Dusuk_HDL);

    w11 = min(mu_xi_Sinirda_Yuksek_LDL, mu_yi_Orta_HDL);

    w12 = min(mu_xi_Sinirda_Yuksek_LDL, mu_yi_Yuksek_HDL);

    w13 = min(mu_xi_Yuksek_LDL, mu_yi_Dusuk_HDL);

    w14 = min(mu_xi_Yuksek_LDL, mu_yi_Orta_HDL);

    w15 = min(mu_xi_Yuksek_LDL, mu_yi_Yuksek_HDL);



    SAT=w1*z3+w2*z4+w3*z5+w4*z3+w5*z4+w6*z4+w7*z2+w8*z3+w9*z4+w10*z2+w11*z2+w12*z3+w13*z1+w14*z2+w15*z3;

    toplam_agirlik = w1+w2+w3+w4+w5+w6+w7+w8+w9+w10+w11+w12+w13+w14+w15;

    if toplam_agirlik == 0
        'Agirlik Merkezi Yonteminde Toplam Alan Sifirdir!';
    end

     z(j,i) = SAT/toplam_agirlik;

     

     end
end
         
 
        [X,Y]=meshgrid(X,Y);
  
        surf(X,Y,z) % X ve Y ye gore z leri cizer
        xlabel('x');
        ylabel('y');
        zlabel('z')
         
         
         


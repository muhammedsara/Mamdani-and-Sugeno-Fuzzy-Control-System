global X mu_X mu_xi;

altsinir_LDL=0; 
ustsinir_LDL=300;

altsinir_HDL=0; 
ustsinir_HDL=100;

altsinir_Risk=0; 
ustsinir_Risk=10;

xi=166;
yi=58;
zi=0;

%Bulanik Kumelerin Tanimlanmasi

%1. LDL-Duzeyi girisine ait uyelik fonksiyonlari ve bulaniklastirma

Yamuk(altsinir_LDL,0,0,90,110,ustsinir_LDL,xi); 
x_Dusuk_LDL=X;
mu_Dusuk_LDL=mu_X;
mu_xi_Dusuk_LDL=mu_xi;



Yamuk(altsinir_LDL,90,110,120,142,ustsinir_LDL,xi);
x_Dusuk_Sinirda_LDL=X;
mu_Dusuk_Sinirda_LDL=mu_X;
mu_xi_Dusuk_Sinirda_LDL=mu_xi;


Yamuk(altsinir_LDL,123,141,150,170,ustsinir_LDL,xi);
x_Sinirda_LDL=X;
mu_Sinirda_LDL=mu_X;
mu_xi_Sinirda_LDL=mu_xi;


Yamuk(altsinir_LDL,150,168,180,200,ustsinir_LDL,xi);
x_Sinirda_Yuksek_LDL=X;
mu_Sinirda_Yuksek_LDL=mu_X;
mu_xi_Sinirda_Yuksek_LDL=mu_xi;

Yamuk(altsinir_LDL,179,200,300,300,ustsinir_LDL,xi);
x_Yuksek_LDL=X;
mu_Yuksek_LDL=mu_X;
mu_xi_Yuksek_LDL=mu_xi;

%2. HDL-Duzeyi girisine ait uyelik fonksiyonlari ve bulaniklastirma

Yamuk(altsinir_HDL,-45,-5,35,45,ustsinir_HDL,yi); 
y_Dusuk_HDL=X;
mu_Dusuk_HDL=mu_X;
mu_yi_Dusuk_HDL=mu_xi; 

Yamuk(altsinir_HDL,35,45,55,65,ustsinir_HDL,yi); 
y_Orta_HDL=X;
mu_Orta_HDL=mu_X;
mu_yi_Orta_HDL=mu_xi; 

Yamuk(altsinir_HDL,55,65,106,146,ustsinir_HDL,yi); 
y_Yuksek_HDL=X;
mu_Yuksek_HDL=mu_X;
mu_yi_Yuksek_HDL=mu_xi; 


%3. Kalp-Hastaligi-Riski cikisina ait uyelik fonksiyonlari

Ucgen(altsinir_Risk, 0, 0, 2.5,ustsinir_Risk,zi)
z_Ekstra_Riskli=X; 
mu_Ekstra_Riskli=mu_X; 

Ucgen(altsinir_Risk, 0, 2.5, 5, ustsinir_Risk,zi)
z_Yuksek_Riskli=X;
mu_Yuksek_Riskli=mu_X;

Ucgen(altsinir_Risk,2.5, 5, 7.5, ustsinir_Risk,zi)
z_Orta_Riskli=X;
mu_Orta_Riskli=mu_X;

Ucgen(altsinir_Risk, 5, 7.5, 10, ustsinir_Risk,zi)
z_Dusuk_Riskli=X;
mu_Dusuk_Riskli=mu_X;

Ucgen(altsinir_Risk, 7.5, 10, 10, ustsinir_Risk,zi)
z_Risk_Yok=X;
mu_Risk_Yok=mu_X;



%Kurallarin giris kismindaki
%oncul onermeleri baglayan Tnorm(burada VE) baglaci
% ve baglaci olarak burada min operatoru kullanildi

%1.Kural --> LDL düşük ve HDL düşük ise kalp hastalığı riski orta riskli
%ateslenme derecesi

mu_kural1 = min(mu_xi_Dusuk_LDL, mu_yi_Dusuk_HDL);

%2.Kural --> LDL düşük ve HDL orta ise kalp hastalığı riski düşük riskli
%ateslenme derecesi

mu_kural2 = min(mu_xi_Dusuk_LDL, mu_yi_Orta_HDL);
 
%3.Kural --> LDL düşük ve HDL yüksek ise kalp hastalığı riski yok
%ateslenme derecesi

mu_kural3 = min(mu_xi_Dusuk_LDL, mu_yi_Yuksek_HDL);

%4.Kural --> LDL düşük sınırda ve HDL düşük kalp hastalığı riski orta
%ateslenme derecesi

mu_kural4 = min(mu_xi_Dusuk_Sinirda_LDL, mu_yi_Dusuk_HDL);

%5.Kural -->LDL düşük sınırda ve HDL orta kalp hastalığı riski düşük
%ateslenme derecesi

mu_kural5 = min(mu_xi_Dusuk_Sinirda_LDL, mu_yi_Orta_HDL);

%6.Kural -->LDL düşük sınırda ve HDL yüksek kalp hastalığı riski düşük
%ateslenme derecesi

mu_kural6 = min(mu_xi_Dusuk_Sinirda_LDL, mu_yi_Yuksek_HDL);

%7.Kural -->LDL sınırda ve HDL düşük kalp hastalığı riski yüksek
%ateslenme derecesi

mu_kural7 = min(mu_xi_Sinirda_LDL, mu_yi_Dusuk_HDL);

%8.Kural -->LDL sınırda ve HDL orta kalp hastalığı riski orta
%ateslenme derecesi

mu_kural8 = min(mu_xi_Sinirda_LDL, mu_yi_Orta_HDL);

%9.Kural -->LDL sınırda ve HDL yüksek kalp hastalığı riski düşük
%ateslenme derecesi

mu_kural9 = min(mu_xi_Sinirda_LDL, mu_yi_Yuksek_HDL);

%10.Kural -->LDL yüksek sınırda ve HDL düşük kalp hastalığı riski yüksek
%ateslenme derecesi

mu_kural10 = min(mu_xi_Sinirda_Yuksek_LDL, mu_yi_Dusuk_HDL);

%11.Kural -->LDL yüksek sınırda ve HDL orta kalp hastalığı riski yüksek
%ateslenme derecesi

mu_kural11 = min(mu_xi_Sinirda_Yuksek_LDL, mu_yi_Orta_HDL);

%12.Kural -->LDL yüksek sınırda ve HDL yüksek kalp hastalığı riski orta
%ateslenme derecesi

mu_kural12 = min(mu_xi_Sinirda_Yuksek_LDL, mu_yi_Yuksek_HDL);

%13.Kural -->LDL yüksek HDL düşük kalp hastalığı riski ekstra
%ateslenme derecesi

mu_kural13 = min(mu_xi_Yuksek_LDL, mu_yi_Dusuk_HDL);

%14.Kural -->LDL yüksek HDL orta kalp hastalığı riski yüksek
%ateslenme derecesi

mu_kural14 = min(mu_xi_Yuksek_LDL, mu_yi_Orta_HDL);

%15.Kural -->LDL yüksek HDL yüksek kalp hastalığı riski orta
%ateslenme derecesi

mu_kural15 = min(mu_xi_Yuksek_LDL, mu_yi_Yuksek_HDL);



%GEREKTİRME operatoru olarak prod(*) kullanilmistir

%1.Kural --> LDL düşük ve HDL düşük ise kalp hastalığı riski orta riskli
%ise o halde Kalp-Hastaligi-Riski = Orta_Riskli

mu_sonuc1=mu_kural1*mu_Orta_Riskli;
 
%2.Kural --> LDL düşük ve HDL orta ise kalp hastalığı riski düşük riskli
%ise o halde Kalp-Hastaligi-Riski = Dusuk_Riskli

mu_sonuc2=mu_kural2*mu_Dusuk_Riskli;
%plot(z_Dusuk_Riskli,mu_sonuc2)

%3.Kural --> LDL düşük ve HDL yüksek ise kalp hastalığı riski yok
%ise o halde Kalp-Hastaligi-Riski = Risk_Yok

mu_sonuc3=mu_kural3*mu_Risk_Yok;

%4.Kural --> LDL düşük sınırda ve HDL düşük kalp hastalığı riski orta
%ise o halde Kalp-Hastaligi-Riski = Risk_Yok

mu_sonuc4=mu_kural4*mu_Orta_Riskli;

%5.Kural --> LDL düşük sınırda ve HDL orta kalp hastalığı riski düşük
%ise o halde Kalp-Hastaligi-Riski = Dusuk_Riskli

mu_sonuc5=mu_kural5*mu_Dusuk_Riskli;

%6.Kural --> LDL düşük sınırda ve HDL yüksek kalp hastalığı riski düşük
%ise o halde Kalp-Hastaligi-Riski = Dusuk_Riskli

mu_sonuc6=mu_kural6*mu_Dusuk_Riskli;

%7.Kural --> LDL sınırda ve HDL düşük kalp hastalığı riski yüksek
%ise o halde Kalp-Hastaligi-Riski = Yuksek_Riskli

mu_sonuc7=mu_kural7*mu_Yuksek_Riskli;

%8.Kural --> LDL sınırda ve HDL orta kalp hastalığı riski orta
%ise o halde Kalp-Hastaligi-Riski = Orta_Riskli

mu_sonuc8=mu_kural8*mu_Orta_Riskli;

%9.Kural --> LDL sınırda ve HDL yüksek kalp hastalığı riski düşük
%ise o halde Kalp-Hastaligi-Riski = Dusuk_Riskli

mu_sonuc9=mu_kural9*mu_Dusuk_Riskli;

%10.Kural --> LDL yüksek sınırda ve HDL düşük kalp hastalığı riski yüksek
%ise o halde Kalp-Hastaligi-Riski = Yuksek_Riskli

mu_sonuc10=mu_kural10*mu_Yuksek_Riskli;

%11.Kural --> LDL yüksek sınırda ve HDL orta kalp hastalığı riski yüksek
%ise o halde Kalp-Hastaligi-Riski = Yuksek_Riskli

mu_sonuc11=mu_kural11*mu_Yuksek_Riskli;

%12.Kural --> LDL yüksek sınırda ve HDL yüksek kalp hastalığı riski orta
%ise o halde Kalp-Hastaligi-Riski = Orta_Riskli

mu_sonuc12=mu_kural12*mu_Orta_Riskli;

%13.Kural --> LDL yüksek HDL düşük kalp hastalığı riski ekstra
%ise o halde Kalp-Hastaligi-Riski = Ekstra_Riskli

mu_sonuc13=mu_kural13*mu_Ekstra_Riskli;

%14.Kural --> LDL yüksek HDL orta kalp hastalığı riski yüksek
%ise o halde Kalp-Hastaligi-Riski = Yuksek_Riskli

mu_sonuc14=mu_kural14*mu_Yuksek_Riskli;

%15.Kural --> LDL yüksek HDL yüksek kalp hastalığı riski orta
%ise o halde Kalp-Hastaligi-Riski = Yuksek_Riskli

mu_sonuc15=mu_kural15*mu_Orta_Riskli;

%plot(X,mu_sonuc1);
%plot(X,mu_sonuc1,X,mu_sonuc2,X,mu_sonuc3,X,mu_sonuc4,X,mu_sonuc5,X,mu_sonuc6,X,mu_sonuc7X,mu_sonuc8X,mu_sonuc8,X,mu_sonuc9,X,mu_sonuc10,X,mu_sonuc11,X,mu_sonuc13,X,mu_sonuc12,X,mu_sonuc14,X,mu_sonuc15)


%BIRLESTIRME operatoru olarak max kullanildi

mu_birlestirme_max=[mu_sonuc1 mu_sonuc2 mu_sonuc3 mu_sonuc4 mu_sonuc5 mu_sonuc6 mu_sonuc7 mu_sonuc8 mu_sonuc9 mu_sonuc10 mu_sonuc11 mu_sonuc12 mu_sonuc13 mu_sonuc14 mu_sonuc15];


tmp1=max(max(mu_sonuc1,mu_sonuc2),max(mu_sonuc3,mu_sonuc4));
tmp2=max(max(mu_sonuc5,mu_sonuc6),max(mu_sonuc7,mu_sonuc8));
tmp3=max(max(mu_sonuc9,mu_sonuc10),max(mu_sonuc11,mu_sonuc12));
tmp4=max(mu_sonuc13,mu_sonuc14);
tmp5=max(max(tmp1,tmp2),max(tmp3,tmp4));
tmp6=max(tmp5,mu_sonuc15);

mu_birlestirme=tmp6;

plot(X,mu_birlestirme);


%DURULASTIRMA operatoru olarak agirlik merkezi kullanilmistir

toplam_alan = sum(mu_birlestirme);
if toplam_alan == 0
   'Agirlik Merkezi Yonteminde Toplam Alan Sifirdir!';
end
z = sum(mu_birlestirme.*X)/toplam_alan;
line([z z],[0 1]); %durulastirma





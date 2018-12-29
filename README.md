## Proje Konusu:

Bulanık mantık ile Kalp hastalığı riskini belirleyen, bir fuzzy  controller yapısı oluşturmak.

## Teknik Terimlerin Tanımlanması

+ **HDL kolesterol (iyi kolesterol):**  HDL, dokulardaki kolesterolü toplayarak dışarı atılmasını sağladığı için iyi kolesterol olarak bilinir. Yalnızca vücutta bulunur, besinler içerisinde bulunmaz.
+ **LDL kolesterol (kötü kolesterol)​:** Kolesterolü dokulara taşıyarak arter ve diğer kan damarlarının duvarlarında birikmesine neden olduğu için LDL, kötü kolesterol olarak da bilinir.

Kalp hastalığı riskini belirleyen iki ana etmen HDL ve LDL düzeyleridir. Buna göre iki giriş ve bir çıkış olacaktır.

![](https://raw.githubusercontent.com/muhammedsara/Mamdani-and-Sugeno-Fuzzy-Control-System/master/images/1.png?token=ARGwNbMvwEDKNL1MqrKRxRHP9ABubNfkks5cK31LwA%3D%3D)

## Girişlerin ve Çıkışların Üyelik Kümelerinin Oluşturulması

+ 1.Giriş: LDL Düzeyi beş dereceye ayırılır;
Bunlar: Düşük, Düşük Sınırda, Sınırda, Yüksek Sınırda ve Yüksek

+ 2.Giriş : HDL Düzeyi  üç dereceye ayrılır;
 Bunlar: Düşük-HDL, Orta-HDL, Yüksek-HDL

+ Çıkış : Kalp hastalığı riski  beş dereceye ayrılır. Ekstra riskli, Yüksek riskli, Orta riskli, Düşük riskli,  Risk yok

### 1. Giriş LDL-Duzeyi

![](https://raw.githubusercontent.com/muhammedsara/Mamdani-and-Sugeno-Fuzzy-Control-System/master/images/2.png?token=ARGwNaO7YAOD-DQS88CGjVXYEv-e6-Ejks5cK36DwA%3D%3D)
### 2. Giriş HDL-Duzeyi

![](https://raw.githubusercontent.com/muhammedsara/Mamdani-and-Sugeno-Fuzzy-Control-System/master/images/3.png?token=ARGwNRlzrQ2aa5Bu81XiKe-Dv6xUgIjyks5cK36ywA%3D%3D)

### Çıkış
![](https://raw.githubusercontent.com/muhammedsara/Mamdani-and-Sugeno-Fuzzy-Control-System/master/images/4.png?token=ARGwNc35-wdHOGjOgjvu5g2K8PrdaBTHks5cK37owA%3D%3D)

## Kurallar
**1.** LDL düşük ve HDL düşük ise kalp hastalığı riski orta riskli

**2.** LDL düşük ve HDL orta ise kalp hastalığı  riski düşük riskli

**3.** LDL düşük ve HDL yüksek ise kalp hastalığı riski yok

**4.** LDL düşük sınırda ve HDL düşük kalp hastalığı riski orta

**5.** LDL düşük sınırda ve HDL orta kalp hastalığı riski düşük

**6.** LDL düşük sınırda ve HDL yüksek kalp hastalığı riski düşük

**7.** LDL sınırda ve HDL düşük kalp hastalığı riski yüksek

**8.** LDL sınırda ve HDL orta kalp hastalığı riski orta

**9.** LDL sınırda ve HDL yüksek kalp hastalığı riski düşük

**10.** LDL yüksek sınırda ve HDL düşük kalp hastalığı riski yüksek

**11.** LDL yüksek sınırda ve HDL orta kalp hastalığı riski yüksek

**12.** LDL yüksek sınırda ve HDL yüksek kalp hastalığı riski orta

**13.** LDL yüksek HDL düşük kalp hastalığı riski ekstra

**14.** LDL yüksek HDL orta kalp hastalığı riski yüksek

**15.** LDL yüksek HDL yüksek kalp hastalığı riski orta


## Kural Tablosu

![](https://raw.githubusercontent.com/muhammedsara/Mamdani-and-Sugeno-Fuzzy-Control-System/master/images/5.png?token=ARGwNRLBNTIgdAw0DF25NbptWMPqAA7cks5cK3-KwA%3D%3D)

Tüm kuralları eksiksiz bir biçimde programa girdikten sonra program çalıştırılır. Kalp hastalığı riski 0-10 arasında değerler almaktadır.

![](https://raw.githubusercontent.com/muhammedsara/Mamdani-and-Sugeno-Fuzzy-Control-System/master/images/6.png?token=ARGwNe3Yh08jUZUHA2BPIr8qpDASa9tcks5cK4GgwA%3D%3D)

## Mamdani Grafiği 
![](https://raw.githubusercontent.com/muhammedsara/Mamdani-and-Sugeno-Fuzzy-Control-System/master/images/8.png?token=ARGwNY1X019Qw71R-Zx1wW4gkjZtTpJqks5cK4IDwA%3D%3D)
## Mamdani Bağıntı Yüzeyi

![](https://raw.githubusercontent.com/muhammedsara/Mamdani-and-Sugeno-Fuzzy-Control-System/master/images/12.png?token=ARGwNbEdrvUJAx7Yfj02prvPYuMHojIzks5cK4OmwA%3D%3D)

## Sugeno Çıkış
![](https://raw.githubusercontent.com/muhammedsara/Mamdani-and-Sugeno-Fuzzy-Control-System/master/images/10.png?token=ARGwNcW1b37__FD3zuHjHPvyRw0ZqExbks5cK4NbwA%3D%3D)

## Sugeno Bağıntı Yüzeyi
![](https://github.com/muhammedsara/Mamdani-and-Sugeno-Fuzzy-Control-System/blob/master/images/11.png?raw=true)

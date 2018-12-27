function UcgenFISCikis(altsinir,a,c,b,ustsinir)
global  CIKIS mu_CIKIS  ; 

alfa=1; 
X1=altsinir:0.001:a-0.001; 
X2=a:0.001:c-0.001;
X3=c:0.001:b-0.001;
X4=b:0.001:ustsinir;

mu_X1=zeros(size(X1));
mu_X2=alfa*(X2-a)/(c-a);
mu_X3=alfa*(X3-b)/(c-b);
mu_X4=zeros(size(X4));

CIKIS=[X1 X2 X3 X4]; mu_CIKIS=[mu_X1 mu_X2 mu_X3 mu_X4]; %plot(X,mu_X)


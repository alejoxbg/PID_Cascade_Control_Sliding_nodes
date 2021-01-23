clear all
clc
% num1=1
% den1=[40 10 1]
% 
% [A1,B1,C1,D1]=tf2ss(num1,den1)
% syms s
% sa=s*eye(2)
% det(sa-A1)
% roots([1 1/4 1/40])
% % 
   tm=0.5;                                            %   Tiempo de muestreo
%   [adis,bdis,cdis,ddis]=c2dm(A1,B1,C1,D1,tm,'zoh');        %   Sistema en variables de estado discreto
% % % %% diseño el seguidor discreto
% %  polosdiscredes=[exp(polosdeseados(1)*tm),exp(polosdeseados(2)*tm)];
% %  polosdiscredesaum=[polosdiscredes,exp(-30*tm),exp(-40*tm)];
% % %  aadis=[adis,bdis;zeros(2),zeros(2)]
% % % badis=[zeros(2);ones(2)]
% % aadis=[adis,zeros(2);-cdis,eye(2)]
% % badis=[bdis;-zeros(2)]
% % coadis=ctrb(aadis,badis);rango=rank(coadis)
% % 
% % ktdis=place(aadis,badis,polosdiscredesaum)
% % kpdis=ktdis(:,1:2)
% % kidis=ktdis(:,3:4)
% % % %% observador de estados discreto
% polosobservadordis=[exp((-0.1250 + 0.0968i)*tm),exp((-0.1250 - 0.0968i)*tm)];
% hdis=place(adis',cdis',polosobservadordis)
% hdis=hdis'
% 
% polosobservadorcon=[-0.1250 + 0.0968i,-0.1250 - 0.0968i];
%  h=acker(A1',C1',polosobservadorcon);                   %   Càlculo de la matriz h en continuo
%  h=h'


num2=1.125
den2=[9765625     1953125      156250        6250         125           1]
[A2,B2,C2,D2]=tf2ss(num2,den2)
syms s
sa=s*eye(5)
det(sa-A2)
roots([1 4/5 2/3125 1/78125 7737125245533627/75557863725914323419136])
[A,B,C,D]=linmod('calculo_nodos')

syms s
sa=s*eye(9)
det(sa-A)
roots([1  6705607265279641/1407374883553280 1497914238614332521/281474976710656000 4750261941167176422999151477426301/1980704062856608439838598758400000  1578035226832501482873346247849873107/3169126500570573503741758013440000000  168309646215681822602574470330773559/3169126500570573503741758013440000000 5234443224392819630127466898044952607707/1661534994731144841129758825350430720000000 1404824625140952952152091010473991450379/13292279957849158729038070602803445760000000 7043776916248787883854566717109908837166310139405239/3741444191567111470601433171753684530319187310018560000000  42531299706761336562397685823316766430963620997/3064991081731777716716694054300618367237478244367204352])

[adis,bdis,cdis,ddis]=c2dm(A,B,C,D,tm,'zoh');
polosobservadordis=[exp((-3.3917)*tm),exp((-5.6010e-01)*tm),exp(( -4.5657e-01)*tm),exp((-1.5624e-01)*tm),exp((-4.0086e-02)*tm),exp((-4.0027e-02 + 8.2214e-05i)*tm),exp((-4.0027e-02 - 8.2214e-05i)*tm),exp((-3.9930e-02 + 5.0663e-05i)*tm),exp((-3.9930e-02 - 5.0663e-05i)*tm)];
hdis=acker(adis',cdis',polosobservadordis)
 hdis=hdis'
 
a=-2.0000e-01
b=-1.6000e-02
c=-6.4000e-04
d=-1.2800e-05
e=-1.0240e-07
g1=2.5000e-02
g2=1.0000e+00
h=1.0000e+00
i=1.0000e+00
j=1.0000e+00
k=-2.5000e-01
l=-3.3141e+00
m=-4.3146e+00
n=1.0000e+00
o=1.0000e+00
p=-2.9862e+00
q=-4.3146e+00
r=-3.1408e-02
s=1.3156e+02
t=1.1945e+02
v=1.2563e+00
u=1.1520e-07
%%
 z0=0.5
 z1=0.00000001
 z2=0.00000001
 z3=0.00000001
 z4=0.00000001
 z5=0.00000001
 z6=0.00000001
 z7=0.00000001
 eta=0.7375

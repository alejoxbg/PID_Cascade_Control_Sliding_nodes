clear all
clc

num1=1
den1=[40 10 1]
[A1,B1,C1,D1]=tf2ss(num1,den1)
syms s
sa=s*eye(2)
det(sa-A1)
roots([1 1/4 1/40])
mp1=10;
ts1=10;
cita=sqrt((log(mp1/100)^2)/(pi^2+log(mp1/100)^2));
wn1=4/(cita*ts1);
dendeseado1=[1 2*cita*wn1 wn1^2]
polosdeseados1=roots(dendeseado1)

[m,n]=size(A1);
[o,p]=size(C1);
aa=[A1 zeros(m,o);-C1 zeros(o)];
ba=[B1;zeros(o)];
%Polos deseados Aumentados
pda=[polosdeseados1', -40]

%Calculo Controlador
ka=place(aa,ba,pda)
kp=ka(1:end,1:m)
ki=ka(1:end,m+1:end)

num2=1.125
den2=[9765625     1953125      156250        6250         125           1]
[A2,B2,C2,D2]=tf2ss(num2,den2)
syms s
sa=s*eye(5)
det(sa-A2)
roots([1 4/5 2/3125 1/78125 7737125245533627/75557863725914323419136])
[A,B,C,D]=linmod('seguidor_primero')

syms s
sa=s*eye(8)
det(sa-A)
roots([1 41 (357419068626812983)/8796093022208000  
    (5598439402581438013)/219902325555200000  
    (2891852695070155903)/687194767360000000  
    (9276950254805721309838358619)/29514790517935282585600000000  
    (17916121046358504293313353)/1475739525896764129280000000  
    (493765901547657676778748575038647682129)/2076918743413931051412198531688038400000000  
    24927379539605112025747951639239/13292279957849158729038070602803445760])








mp2=10;
ts2=400;
cita=sqrt((log(mp2/100)^2)/(pi^2+log(mp2/100)^2));
wn2=4/(cita*ts2);
dendeseado2=[1 2*cita*wn2 wn2^2]
polosdeseados2=roots(dendeseado2)

tm2=10                                     %   Tiempo de muestreo
[adis2,bdis2,cdis2,ddis2]=c2dm(A,B,C,D,tm2,'zoh');        %   Sistema en variables de estado discreto

  % %% diseño el seguidor discreto
[m,n]=size(adis2);
[o,p]=size(cdis2);
[q,r]=size(bdis2);
polosdiscredes2=[exp(polosdeseados2(1)*tm2),exp(polosdeseados2(2)*tm2)];
polosdiscredesaum2=[polosdiscredes2,exp(-2.25*tm2),exp(-2.35*tm2),
exp(-2.45*tm2),exp(-2.55*tm2),exp(-2.65*tm2),exp(-2.75*tm2),exp(-2.85*tm2)];
% aadis2=[adis2,bdis2;zeros(r,n),zeros(r)]
% badis2=[zeros(q,r);eye(r)]
aadis2=[adis2,zeros(m,o);-cdis2,eye(r)]
badis2=[bdis2;zeros(r)]
coadis2=ctrb(aadis2,badis2);rango=rank(coadis2)

ktdis2=acker(aadis2,badis2,polosdiscredesaum2)
kpdis2=ktdis2(:,1:m)
kidis2=ktdis2(:,m+1:end)
% %% observador de estados discreto
polosobservadordis2=[exp((-4.0000e+01)*tm2),exp((-4.0000e-01)*tm2),
    exp((-4.0000e-01)*tm2),exp((-4.0042e-02)*tm2),exp((-4.0042e-02)*tm2),
    exp((-3.9984e-02)*tm2),exp((-3.9984e-02)*tm2),exp((-3.9948e-02)*tm2)];

hdis2=acker(adis2',cdis2',polosobservadordis2)
hdis2=hdis2'

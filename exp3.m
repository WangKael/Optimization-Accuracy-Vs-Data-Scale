clc;clear;close all;

for i=1:20
pd=0.9999999;pfa=0.001;N=i;
Im=6.79*(1+0.235*pd)*(1-log10(pfa)/46.6)*log10(N)*(1-0.140*log10(N)+0.01831*(log10(N))^2);
I(i)=10^(Im/10);
t(i)=i;
tm(i)=sqrt(i);
ts(i)=i^(3/4);
end
figure;plot(I,'b');hold on;plot(t,'r');plot(tm,'g');plot(ts,'y');

% 这是非起伏目标
pfa=0.000001;
A=log(0.62/pfa);
sn=110;
B=(sn-A)/(0.12*A+1.7);
pe=1/(exp(B)+1);

% 这是非起伏目标
pfa=0.00000000001;
pd=0.999999999999999;
A=log(0.62/pfa);
B=log(pd/(1-pd));
sn=A+0.12*A*B+1.7*B

% 这是起伏目标，Lr损耗在积累脉冲大量增加时，差别不大，趋近于1.Lr^(1/ne).
pfa=0.00001;
pe=0.2;
pd=1-pe;
sn=log(pfa)/log(pd)-1



clc;clear;close all;

Sigma=1;
Miu=0;
LowLimit=-10*Sigma;
HighLimit=10*Sigma;
Interval=1/100;

x=LowLimit:Interval:HighLimit;
y=normpdf(x,Miu,Sigma)*Interval;

figure;plot(x,y);
SumProb=sum(y)

[temp,index1]=min(abs(x-3*Sigma));
Scope=index1:1:length(x);
Exp3SigmaPrin=(1-sum(y(Scope))*2)*100

% Start Discretization
asnr=5;
nr=1/(1+asnr);
InitialAccuracy=nr*100

Num_Log=3:1:10;
DirectAccuracy=zeros(size(Num_Log));
GeneratedAccuracy=zeros(size(Num_Log));

for ii=1:length(Num_Log)
    
Threshold=10^(-Num_Log(ii));
DisY=floor(y/Threshold);
TotalDataNumber=sum(DisY);

Noise=DisY*nr;
% figure;plot(x,DisY,'b');hold on;plot(x,Noise,'r');
DirectAccuracy(ii)=sum(Noise)/sum(DisY)*100;

Noise_G=DisY*1./(asnr*sqrt(DisY)+1);
figure;plot(x,DisY,'b');hold on;plot(x,Noise_G,'r');title(['Num\_log: ',num2str(Num_Log(ii))]);
figure;plot(x,Noise_G./DisY);title('Ratio of Noise');
GeneratedAccuracy(ii)=sum(Noise_G)/sum(DisY)*100;
end
figure;plot(Num_Log,DirectAccuracy);title('DirectAccuracy');
figure;plot(Num_Log,GeneratedAccuracy);title('GeneratedAccuracy');
figure;plot(Num_Log,100-GeneratedAccuracy);title('GeneratedAccuracy,order 1/2');xlabel('number of data,order 10');ylabel('accuracy');

pk=zeros(length(Num_Log)-1,1);
for ii=1:length(GeneratedAccuracy)-1
    pk(ii)=GeneratedAccuracy(ii)/GeneratedAccuracy(ii+1);
end
figure;plot(Num_Log(1:length(Num_Log)-1),pk);
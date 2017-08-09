clc;clear;close all;
NUM=35;
num=1.2.^(0:1:NUM-1);
BASIC_num=1000;

sigma1=0.4;
bias1=0.1;
error1=bias1+sigma1./(num).^(1);
error1=(1-error1)*100;

sigma2=0.5;
bias2=0.0;
error2=bias2+sigma2./sqrt(num);
error2=(1-error2)*100;

% figure;plot(num,error);
figure;semilogx(BASIC_num*num,error1,'r');
hold on; semilogx(BASIC_num*num,error2,'b');ylabel('Accuracy');xlabel('number of data');


num2=1.2.^(0:1:NUM-1);
sigma3=0.2;
bias3=0.1;
error3=bias3+sigma3./(num2).^(1);
error3=(1-error3)*100;

sigma4=0.4;
bias4=0.0;
error4=bias4+sigma4./sqrt(num2);
error4=(1-error4)*100;

% figure;plot(num,error);
figure;semilogx(BASIC_num*num2,error3,'r');
hold on; semilogx(BASIC_num*num2,error4,'b');ylabel('Accuracy');xlabel('number of data');title('not 1/2 order');



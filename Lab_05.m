clear all
close all
clc
%1
A=2;
N=1024;
w=50;
d=300;
t=0:1:49;
x1=(A/w)*t;
x1=[x1 zeros(1,N-w)];
%2
x2=[zeros(1,d) x1];
x2=x2(1:1:N);
%3
x2c=x2+randn(1,N);
int=-(N-1):1:N-1;
R=xcorr(x2c,x1);
figure
subplot(3,1,1)
plot(x1)
title 'x1'
subplot(3,1,2)
plot(x2c)
title 'x2c'
subplot(3,1,3)
plot(int,R)
title 'R(x2c,x1)'
estimated_delay=find(R==max(R))-N
clear all
close all
clc

%% 1
N=1000;
x1=rand(1,N);
x2=randn(1,N);
n=0:1:N-1;
f=10;
fs=100; %sampling frequency
x3=sin(2*pi*(f/fs)*n); %bcz when samplint, t=n*Ts
% for i=1:2:N
%     x4(i)=0;
%     x4(i+1)=1;
% end
x4=square(2*pi*(f/fs)*n);
figure
subplot(4,1,1)
plot(x1)
subplot(4,1,2)
plot(x2)
subplot(4,1,3)
plot(x3)
subplot(4,1,4)
plot(x4)

%% 2
clc
close all
X=[x1' x2' x3' x4'];
R=corrcoef(X)
%only sine and square signals are somewhat correlated
%3
C=cov(X)
%4
int=-(N-1):1:N-1; %x axis, bcz in autocorrelation max is at 0
R1=xcorr(x1);
R2=xcorr(x2);
R3=xcorr(x3);
R4=xcorr(x4);
figure
subplot(4,1,1)
plot(int,R1)
subplot(4,1,2)
plot(int,R2)
subplot(4,1,3)
plot(int,R3)
subplot(4,1,4)
plot(int,R4)

%% 5
clc
close all
%noise is created using randn or wgn
%xn=x3+randn(1,N);
xn=x3+wgn(1,N,0); %p is power in dB
Rn=xcorr(xn);
figure
subplot(2,1,1)
plot(xn)
subplot(2,1,2)
plot(int,Rn)
% we can find the frequency of the original sine signal from Rn (power
% spectral density)

%% 6
clc
close all
CC1=xcorr(x1,x2);
CC2=xcorr(x1,x3);
CC3=xcorr(x1,x4);
CC4=xcorr(x2,x3);
CC5=xcorr(x2,x4);
CC6=xcorr(x3,x4);
figure
subplot(6,1,1)
plot(int,CC1)
subplot(6,1,2)
plot(int,CC2)
subplot(6,1,3)
plot(int,CC3)
subplot(6,1,4)
plot(int,CC4)
subplot(6,1,5)
plot(int,CC5)
subplot(6,1,6)
plot(int,CC6)
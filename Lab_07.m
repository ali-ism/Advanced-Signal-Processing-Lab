%%Part I
clear all
close all
clc
f0=10;
fs=100;
Ts=1/fs;
N=512;
n=0:1:N-1;
nTs=n*Ts;
x1=sin(2*pi*f0*nTs);
plot(nTs,x1)

X1=fft(x1);
fr=linspace(0,fs,length(X1));
figure
plot(fr,abs(X1))

%% to plot positive part
X1pos=X1(1:length(X1)/2);
frpos=linspace(0,fs/2,length(X1pos));
figure
plot(frpos,abs(X1pos))

%% to plot positive and negative parts
X1neg=fftshift(X1);
frneg=linspace(-fs/2,fs/2,length(X1neg));
figure
plot(frneg,abs(X1neg))

%% 2
close all
clc
f2=11;
x2=x1+sin(2*pi*f2*nTs);
X2=fft(x2);
plot(fr,abs(X2))
figure
my_fft_pos(x2,nTs);

nfft=512;
[s2,f2]=psd(x2,nfft,fs);
figure
plot(f2,s2)
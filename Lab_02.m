clc
clear all
close all
%Probability density function
%objective: draw pdf uniform and normal
%cumulative density function (fonction de repartition)
%pdf and cdf functions

%Part I

%% ideal pdf and cdf for uniform distribution
int=linspace(0,3,1000); %x axis
y=pdf('unif',int,1,2);
z=cdf('unif',int,1,2);
figure
subplot(2,1,1)
plot(int,y)
subplot(2,1,2)
plot(int,z)

%% ideal pdf and cdf for gaussian function
int1=linspace(-4,4,1000); %we must increase the width of int accordingly to the STD of the function
n1=pdf('normal',int1,0,1);
m1=cdf('normal',int1,0,1);

int2=linspace(-10,10,1000);
n2=pdf('normal',int2,0,4);
m2=cdf('normal',int2,0,4);

int3=linspace(6,14,1000);
n3=pdf('normal',int3,10,1);
m3=cdf('normal',int3,10,1);

int4=linspace(0,20,1000);
n4=pdf('normal',int4,10,4);
m4=cdf('normal',int4,10,4);

figure
subplot(2,1,1)
plot(int1,n1)
hold on
plot(int2,n2,'r')
hold on
plot(int3,n3)
hold on
plot(int4,n4,'r')
hold off

subplot(2,1,2)
plot(int1,m1)
hold on
plot(int2,m2,'r')
hold on
plot(int3,m3)
hold on
plot(int4,m4,'r')
hold off

%% Finding the estimated pdf and cdf of a signal, Part II
close all
clear all
clc
xu=random('unif',1,2,1,1000);
[N,Mx]=hist(xu,10);
figure
bar(Mx,N) %bar of hist
N1=N/1000; %proba for each number
figure
bar(Mx,N1)
k=(max(xu)-min(xu))/10; %xu or Mx, 10 is nbins
Npdf=N1/k; %to obtain pdf, bcz N1 has amplitude 0.1==k but it must be 1/(b-a)==1
figure
bar(Mx,Npdf) %to obtain sth close to ideal pdf we increase the number of points (here 1000)
hold on
int=linspace(0,3,1000);
y=pdf('unif',int,1,2);
plot(int,y,'r')
hold off

%estimated cdf of signal
Ncdf(1)=N1(1);
for i=2:1:length(N1)             %i=1:1:nbins
    Ncdf(i)=N1(i)+Ncdf(i-1);     %Ncdf(i)=sum(N1(1:i));
end
%OR Ncdf=cumsum(N1);
figure
bar(Mx,Ncdf)
hold on
z=cdf('unif',int,1,2);
plot(int,z)
hold off

%% Part III
%1. matrix (1000 signal,10000samples)
close all
clear all
clc
for i=1:1:1000
    var3(i,:)=random('normal',2,4,1,10000); %no for: var3=random('normal',2,4,1000,10000);
    mean_(i)=mean(var3(i,:));
    variance(i)=var(var3(i,:));
end
% or mean(var3') transpose bcz by default mean calculates the mean for each column not each line, same for variance
%3
%estimated pdf of mean
nbins=10;
[N,Mx]=hist(mean_,nbins);
Nproba=N/1000;
k=(max(mean_)-min(mean_))/nbins;
Npdf3=Nproba/k;
figure
subplot(2,1,1)
plot(mean_)
subplot(2,1,2)
bar(Mx,Npdf3)
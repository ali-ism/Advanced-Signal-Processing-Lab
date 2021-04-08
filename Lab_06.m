%% Part I
clc
clear all
close all
%1
%we need 100 phis for 100 signals
elem=100; %rows
obs=1000; %columns
A=2;
f=1;
fs=100;
nTs=(0:1:obs-1)/fs;
for i=1:1:elem
    phi=random('unif',0,2*pi,1,1);
    x(i,:)=A*cos(2*pi*f*nTs+phi);
    B=random('unif',A,2*A,1,1);
    z(i,:)=B*cos(2*pi*f*nTs);
end
%2
i1=randi(obs); %or randi(1000, 1 row, 3 columns)
i2=randi(obs);
i3=randi(obs);
x1=x(:,i1);
x2=x(:,i2);
x3=x(:,i3);
z1=z(:,i1);
z2=z(:,i2);
z3=z(:,i3);
figure
subplot(3,1,1)
hist(x1)
subplot(3,1,2)
hist(x2)
subplot(3,1,3)
hist(x3)
figure
subplot(3,1,1)
hist(z1)
subplot(3,1,2)
hist(z2)
subplot(3,1,3)
hist(z3)

%% Part II
clear all
close all
clc
elem=100; %rows
obs=1000; %columns
x=ones(elem,obs);
for i=1:1:elem
    r=randi([-12 12]);
    x(i,:)=r.*x(i,:);
end
clc
clear all
close all

% uniformly distributed random variable
% rand and random

x=rand(1,1000); % min is 0 and max is 1. characteristics are max and min
plot(x)
figure
hist(x,10) %if we increase number of points the hist is more uniform

x2=random('unif',1,2,1,1000); %we can choose min and max
figure
subplot(2,1,1)
plot(x2)
subplot(2,1,2)
hist(x2,10)

% normally distributed random variable
%randn

y=randn(1,1000); %characteristics: mean is ~0, if we increase nb of points mean->0 (func mean(y))
                 %                 standard deviation is ~1 (func std(y))
figure
subplot(2,1,1)
plot(y)
subplot(2,1,2)
hist(y,10)

y2=random('normal',0,5,1,1000); %we can choose mean and std
figure
subplot(2,1,1)
plot(y2)
subplot(2,1,2)
hist(y2,10)
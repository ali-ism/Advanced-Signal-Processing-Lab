%% Part I
clc
clear all
close all
N=1000; %number of points
X=rand(1,N);
Y=randn(1,N);

scatter(X,Y) %plot(X,Y,'.')
xlabel('X')
ylabel('Y')
%X and Y are not dependant
figure
hist3([X' Y'],[100 100])

%% Part II
clear all
clc
close all
N=1000;
X=random('unif',-2,2,1,N);
Y=X.^2;
plot(X,Y,'.')
%X and Y are dependant but not linearly depnedant so they are not correlated
%Covariance
xx=[X' Y'];
C=cov(xx);
%Correlation coefficient (normalized)
R=corrcoef(xx);

X2=random('unif',0,0.5,1,N);
Y2=X2.^2;
figure
plot(X2,Y2,'.')
xx2=[X2' Y2'];
C2=cov(xx2);
R2=corrcoef(xx2);

X3=random('unif',5,10,1,N);
Y3=X3.^2;
figure
plot(X3,Y3,'.')
xx3=[X3' Y3'];
C3=cov(xx3);
R3=corrcoef(xx3);

X4=random('unif',-10,-5,1,N);
Y4=X4.^2;
figure
plot(X4,Y4,'.')
xx4=[X4' Y4'];
C4=cov(xx4);
R4=corrcoef(xx4);

%% Part III
clear all
clc
close all
N=1000;
X1=rand(1,N);
X2=rand(1,N);

plot(X1,X2,'o')
title('X1,X2')

Y=X1+X2;
figure
plot(Y,'.')
title('Y')
nbins=100;
figure
[Npdf,Mx]=distribution(Y,nbins);
title('pdf Y')
figure
[Npdf1,Mx]=distribution(X1,nbins);
title('pdf X1')
figure
[Npdf2,Mx]=distribution(X2,nbins);
title('pdf X2')
Npdfy=conv(Npdf1,Npdf2);
Npdfy=Npdfy/max(Npdfy);
Mxy=linspace(0,2,length(Npdfy));
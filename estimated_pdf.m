function [N,Mx]=estimated_pdf(x,nbins)
binwidth=(max(x)-min(x))/nbins;
k=1;
for i=min(x):binwidth:max(x)-binwidth
    N(k)=length(find(x>=i & x<i+binwidth));
    k=k+1;
end
Mx=min(x)+(binwidth/2):binwidth:max(x)-(binwidth/2);
N=N/length(x);
N=N/binwidth;
bar(Mx,N)
end
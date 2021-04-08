function [N,Mx]=distribution(x,nbins)
mn=min(x);
mx=max(x);
binwidth=(mx-mn)/nbins; %step
k=1; %index for the N vector
for i=mn:binwidth:mx-binwidth
    N(k)=length(find(x>=i & x<=i+binwidth));
    k=k+1;
end
Mx=mn+(binwidth/2):binwidth:mx-(binwidth/2);
bar(Mx,N)
end
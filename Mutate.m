function y=Mutate(x,mu,sigma,VarMin,VarMax)

    nVar=numel(x);
    
    nMu=ceil(mu*nVar);

    j=randsample(nVar,nMu);
    
    y=x;
    
    y(j)=x(j)+sigma*randn(size(j));
    
    y=min(max(y,VarMin),VarMax);

end
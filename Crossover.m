function [y1, y2]=Crossover(x1,x2,VarMin,VarMax)

    alpha=rand(size(x1));
    
    y1=alpha.*x1+(1-alpha).*x2;
    y2=alpha.*x2+(1-alpha).*x1;
    
    y1=min(max(y1,VarMin),VarMax);
    y2=min(max(y2,VarMin),VarMax);
    
end
function preci = Precision(X, Y, layer)
    X=[ones(size(X,1),1) X];
   
    z = layer * X';
    [proba id]= max(sigmoid(z));
   
    preci = id' ;
    preci = mean(double(Y == preci)*100);
end
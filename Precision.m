function preci = Precision(X, Y, layer)
    X=[ones(size(X,1),1) X];
   
    z = layer * X';
    display(z);
    yprd= Sigmoid(z);
    display(yprd);
    yprd=round(yprd);
   preci = mean(double(Y ==  yprd')*100);
end
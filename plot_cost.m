
function [] = plot_cost(cost)
  figure
   subplot(1,2,1);
   plot(cost(:,1))
   subplot(1,2,2);
    plot(cost(:,2))    
 
end


function [retval] = plot_resultat (input,w1,w2,y)
  in = importdata('caesarian.txt',',');
  resultat_validation=[];
  resultat_test=[];
  
  
   for i=65:75
    [xx,output]= feedforward(input(i,:),w1,w2);
    
    resultat_test=[resultat_test;y(i),round(output)];
   end 
   figure
   
   subplot(2,2,1);
   plot(resultat_test(:,1),'r');
   title('y test');
   subplot(2,2,2);
   plot(resultat_test(:,2),'b');
   title('output');
  
end

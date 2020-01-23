
Donnee = load('caesarian.txt');
x = Donnee(1:78, [1:5]);
y = Donnee(1:78, 6);
XTest = Donnee(55:78, [1:5]);
YTest = Donnee(55:78, 6);


for j=1:78 %nombre dechantillon a parcourir 
 x(j,1)= (max(x(:,1))-x(j,1))/(max(x(:,1))-min(x(:,1)));
 x(j,2)= (max(x(:,2))-x(j,2))/(max(x(:,2))-min(x(:,2)));
 x(j,3)= (max(x(:,3))-x(j,3))/(max(x(:,3))-min(x(:,3)));
 x(j,4)= (max(x(:,4))-x(j,4))/(max(x(:,4))-min(x(:,4)));
end


nb_output=1;

nb_noeud=6;
layer1 = zeros(1,nb_noeud); %tableau de la couche caché





weight1= rand(size(x,2),nb_noeud); %generer aleatoirement le tableau des poids de la premiere couche
weight2 = rand(nb_noeud,nb_output); %generer aleatoirement le tableau des poifs de la 2eme couche
coste=[];

%entrainement
for k=1:500 %nombre iterration
  c =[];
for j=1:size(x,1)-22 %nombre dechantillon a parcourir 
  [layer1,output]= feedforward(x(j,:),weight1,weight2); %caclule du output 'hypothese' avec les poid en entrer
  display(layer1);
  [weight1,weight2]=BackProbagation(x(j,:),layer1,weight1,weight2,y(j,:),output); %modifier les poids en fonctions du output trouvÃ©
  c= [c; (y(j)-output).^2];
 
end
coste=[coste;sum(c)];

end
coste=coste/(size(x,1)*2);

plot_cost(coste);
plot_resultat(x,weight1,weight2,y);


P=Precision(x, y, layer1);
PrecisionTest=Precision(XTest, YTest, layer1);
    
display(P);
display(PrecisionTest);



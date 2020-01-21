%x = importdata('zoo.txt',',');
Donnee = load('caesarian.txt');
x = Donnee(1:75, [1:5]);
y = Donnee(1:75, 6);
%XTest = Donnee(76:108, [1:5]);
%YTest = Donnee(76:108, 6);

%x(:,0)=[];
nb_output=2;
%y=zeros(size(x,1),nb_output);%tableau pour le nombre de output
nb_noeud=6;
layer1 = zeros(1,nb_noeud); %tableau de la couche caché



 %for i=1:size(y,1) %modifier le features en une valeur entiere en tableau de 1 et 0
   % y(i,x(i,17))=1;
  %end
%x(:,17) = [];%enlever la colonne de y de la matrice des input

weight1= rand(size(x,2),nb_noeud); %generer aleatoirement le tableau des poids de la premiere couche
weight2 = rand(nb_noeud,nb_output); %generer aleatoirement le tableau des poifs de la 2eme couche
coste=[]

%entrainement
for k=1:100 %nombre iterration
  c =[];
for j=1:size(x,1)-32 %nombre dechantillon a parcourir 
  [layer1,output]= feedforward(x(j,:),weight1,weight2); %caclule du output 'hypothese' avec les poid en entrer
  [weight1,weight2]=backProbagation(x(j,:), layer1,weight1,weight2,y(j,:),output); %modifier les poids en fonctions du output trouvÃ©
  c= [c; (y(j,:)-output).^2];
 
end
coste=[coste;sum(c)];

end
coste=coste/(size(x,1)*2)

plot_cost(coste)
preci=Precision(XTest, YTest, layer1);

    

display(preci);



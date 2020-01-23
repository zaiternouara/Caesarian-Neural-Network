function [Weight21,Weight22] = BackProbagation(Input,Layer1,Weight1,Weight2,y,Output)
    
    d_weight2=Layer1'*(2*(y(1,:)-Output).*SigmoidDerive(Output))  ;
    d_weight1=Input'*(((2*(y(1,:)-Output).*SigmoidDerive(Output))*Weight2').*SigmoidDerive(Layer1)); 


    Weight22=Weight2+d_weight2*0.2;%Alpha = 01
    Weight21=Weight1+d_weight1*0.2;
end

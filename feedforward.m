function [Layer1,Output] = feedforward (Input,Weight1,Weight2)
    
    Layer1 = Sigmoid(Input*Weight1); 
    
    Output= Sigmoid(Layer1*Weight2);
    
end

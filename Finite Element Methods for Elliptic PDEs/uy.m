function value = uy(x,y)
    
%     % Question A, Case1
%     value=pi*sin(pi*x)*cos(pi*y); 
    
    
    
%     % Question A, Case2
%     value=pi*sin(pi*x)*cos(pi*y);
    

    
    % Question B
    if x <= 1/2
        value=(3*(x^2))*(y^2)-x*sin(x*y);
    else
        value=(3*(y^2))*(((2*x+9)/20)^2)-sin(((2*x+9)/20)*y)*((2*x+9)/20);
    end

end
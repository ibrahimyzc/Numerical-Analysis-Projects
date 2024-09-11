function value = g(x,y)

%     % Question A, Case1
%     value=sin(pi*x)*sin(pi*y); 
    
    
    
%     % Question A, Case2
%     value=sin(pi*x)*sin(pi*y); 
    

    
    % Question B
    if x <= 1/2
        value=(x^2)*(y^3)+cos(x*y);
    else
        value=(((2*x+9)/20)^2)*(y^3)+cos(((2*x+9)/20)*y);
    end

end
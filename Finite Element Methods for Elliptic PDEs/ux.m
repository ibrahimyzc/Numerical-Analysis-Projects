function value = ux(x,y)
    
%     % Question A, Case1
%     value=pi*cos(pi*x)*sin(pi*y); 
    
    
    
%     % Question A, Case2
%     value=pi*cos(pi*x)*sin(pi*y); 
    
    

    % Question B
    if x <= 1/2
        value=(2*x)*(y^3)-y*sin(x*y);
    else
        value=((y^3)/5)*((2*x+9)/20)-sin(((2*x+9)/20)*y)*(y/10);
    end

end
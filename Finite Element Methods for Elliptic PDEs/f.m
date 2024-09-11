function value = f(x,y)
   
%     % Question A, Case1
%     value=(2*pi^2+1)*sin(pi*x)*sin(pi*y);
    
    
    
%     % Question A, Case2
%     aa=1/(1+10*(x^2+y^2));
%     aax=(-20*x)*((1+10*(x^2+y^2))^(-2));
%     aay=(-20*y)*((1+10*(x^2+y^2))^(-2));
%     uux=pi*cos(pi*x)*sin(pi*y);
%     uuy=pi*sin(pi*x)*cos(pi*y);
%     uuxx=(-pi^2)*sin(pi*x)*sin(pi*y);
%     uuyy=(-pi^2)*sin(pi*x)*sin(pi*y);
%     value=-(aax*uux+aa*uuxx)-(aay*uuy+aa*uuyy); 
    

    
    % Question B
    if x <= 1/2
        value=(y^2)*cos(x*y)-2*(y^3)+(x^2)*cos(x*y)-6*(x^2)*y;
    else
        value=10*(cos(((2*x+9)/20)*y)*((y^2)/100)-(y^3)/50+(cos(((2*x+9)/20)*y)-6*y)*(((2*x+9)/20)^2));
    end

end
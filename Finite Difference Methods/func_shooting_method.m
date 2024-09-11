function uapp1=func_shooting_method(c,hstep,N)
%this function is used to implement AB2 in the application of the shooting method

%coefficients of the advection-diffusion boundary value problem
alpha=0;
eps=0.01;
a=1;

%implementation of AB2 method(euler method is used for the second point approximation)
uapp1=zeros(N,1);
uapp2=zeros(N,1);
uapp1(1)=alpha;
uapp2(1)=c;
uapp1(2)=uapp1(1)+hstep*(uapp2(1));
uapp2(2)=uapp2(1)+hstep*((a*uapp2(1))/eps);
for n=3:N
    uapp1(n)=uapp1(n-1)+(hstep/2)*(3*uapp2(n-1)-uapp2(n-2));
    uapp2(n)=uapp2(n-1)+(hstep/2)*(3*((a*uapp2(n-1))/eps)-((a*uapp2(n-2))/eps));
end
end
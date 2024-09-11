%this code solves the advection-diffusion boundary value problem with the shooting method

%input data for shooting method
alpha=0;
beta=1;
b=1;
MAXIT=10000;
RELTOL=10^(-12);

%coefficients of the advection-diffusion boundary value problem
eps=0.01;
a=1;
R=a/eps;

%step size and discritization of the interval [0,1]
hstep=1/80;
t=alpha:hstep:beta;
N=size(t);
N=N(2);

%application of the shooting method
cprev=(beta-alpha)/(4*b);
c=cprev;
uapp1=func_shooting_method(c,hstep,N);
hprev=uapp1(N)-beta;
c=cprev-0.2*sign(hprev);
for k=1:MAXIT
    uapp1=func_shooting_method(c,hstep,N);
    h=uapp1(N)-beta;
    s=-h*((c-cprev)/(h-hprev));
    cprev=c;
    hprev=h;
    c=c+s;
    if abs(s) <= RELTOL*abs(c)
        break
    end
end
uapp1=func_shooting_method(c,hstep,N);

%finding the true solution of u(t)
uexct=(1-exp(R*t))/(1-exp(R));
uexct=uexct';

%finding the maximum error
max_error=max(abs(uexct-uapp1))

%plotting the true and numerical solutions
plot(t,uexct,t,uapp1,'--')
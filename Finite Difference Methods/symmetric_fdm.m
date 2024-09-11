%this code solves the advection-diffusion boundary value problem with the symmetric finite difference method

%coefficients of the advection-diffusion boundary value problem
eps=0.01;
a=1;
R=a/eps;

%step size and discritization of the interval [0,1]
hstep=1/80;
t=0:hstep:1;
N=size(t);
N=N(2);

%application of the symmetric finite difference method
uapp=zeros(N,1);
uapp(1)=0;
uapp(N)=1;
A=zeros((N-2),(N-2));
for i=1:N-2
    A(i,i)=(2*eps)/(hstep^2);
end
for i=1:N-3
    A(i,i+1)=-(eps/(hstep^2))+(a/(2*hstep));
end
for i=1:N-3
    A(i+1,i)=-(eps/(hstep^2))-(a/(2*hstep));
end
c=zeros(N-2,1);
c(1)=0*(-(eps/(hstep^2))-(a/(2*hstep)));
c(N-2)=-(-(eps/(hstep^2))+(a/(2*hstep)));
uapp2=A\c;
for i=1:N-2
    uapp(i+1)=uapp2(i);
end


%finding the true solution of u(t)
uexct=(1-exp(R*t))/(1-exp(R));
uexct=uexct';

%finding the maximum error
max_error=max(abs(uexct-uapp))

%plotting the true and numerical solutions
plot(t,uexct,t,uapp,'--')
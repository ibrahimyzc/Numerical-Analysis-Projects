function uapp1=func_nonuniform_adaptive_fdm(h1,N)
%this function is used to implement the finite difference method for nonuniform mesh

%coefficients of the advection-diffusion boundary value problem
eps=0.01;
a=1;

%application of the finite difference method
uapp1=zeros(N,1);
uapp1(1)=0;
uapp1(N)=1;
A=zeros((N-2),(N-2));
for i=1:N-2
    A(i,i)=((2*eps)/h1(i+1))+((2*eps)/h1(i+2));
end
for i=1:N-3
    A(i,i+1)=(-2*eps)/(h1(i+2))+a;
end
for i=1:N-3
    A(i+1,i)=(-2*eps)/(h1(i+2))-a;
end
c=zeros(N-2,1);
c(1)=0*((-2*eps)/(h1(i+2))-a);
c(N-2)=-((-2*eps)/(h1(N))+a);
uapp2=A\c;
for i=1:N-2
    uapp1(i+1)=uapp2(i);
end
end
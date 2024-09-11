%this code solves the advection-diffusion boundary value problem 
%using finite difference method with error estimation and adaptive mesh refinement

%coefficients of the advection-diffusion boundary value problem
eps=0.01;
a=1;
R=a/eps;

%input data for adaptive mesh refinement
ETOL=0.01;

%forming a coarse uniform initial mesh on [0,1]
hstep=1/80;
t=0:hstep:1;
N=size(t);
N=N(2);

%forming the initial mesh for h and h/2
h1=zeros(N,1);
h2=zeros(2*N,1);
h1=h1+hstep;
h2=h2+(hstep/2);

%implementation of error estimation and adaptive mesh refinement
while 1
uapp1=func_nonuniform_adaptive_fdm(h1,N); %solving BVP on nonuniform mesh for u(h)

h2=zeros(2*N-1,1); %forming the mesh for h/2 unsing the mesh for h
for i=2:N
    h2(2*i-2)=h1(i)/2;
    h2(2*i-1)=h1(i)/2;
end

uapp2=func_nonuniform_adaptive_fdm(h2,2*N-1); %solving BVP on nonuniform mesh for u_(h/2)

uapp3=zeros(N,1); %creating a vector of values of u(h/2), to compare with the corresponding values of u(h)
for i=1:N
    uapp3(i)=uapp2(2*i-1);
end

err=zeros(N,1); %comparing the values of u(h) and u(h/2), and finding the error
err=(4/3)*(uapp1-uapp3);

if max(abs(err)) <= ETOL %doing the error estimation
    break
end

hnew=zeros(2*N-1,1); %creating an empty vector which will store the values of the new mesh

count=2; %adaptive mesh refinement
for i=1:N-1
    if max(abs(err(i)),abs(err(i+1))) >= (1/2)*max(abs(err))
        hnew(count)=h2(2*i);
        count=count+1;
        hnew(count)=h2(2*i+1);
        count=count+1;
    else
        hnew(count)=h1(i+1);
        count=count+1;
    end
end

h1=zeros(count-1,1); %forming the vector of new mesh
for i=1:count-1
h1(i)=hnew(i);
end

N=count-1; %step size and discritization of the interval [0,1] using the new nonuniform mesh 
t=zeros(count-1,1);
for i=1:count-2
    t(i+1)=t(i)+h1(i+1);
end

end

%finding the true solution of u(t)
uexct=(1-exp(R*t))/(1-exp(R));

%finding the maximum error
max_error=max(abs(uexct-uapp1))

%plotting the true and numerical solutions
plot(t,uexct,t,uapp1,'--')
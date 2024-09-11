% creating the triangular mesh
h=1/32;
N=1/h+1;
NT=2*((N-1)^2);
SQ=zeros((N-1)^2,4);
AR=(h^2)/2;
for i=1:N-1
    for j=1:N-1;
        SQ((i-1)*(N-1)+j,1)=(i-1)*N+j;
    end
end
for i=1:(N-1)^2
    SQ(i,2)=SQ(i,1)+1;
    SQ(i,3)=SQ(i,2)+N-1;
    SQ(i,4)=SQ(i,3)+1;
end
TR=zeros(NT,3);
for i=1:(N-1)^2
    TR(2*i-1,1)=SQ(i,1);
    TR(2*i,1)=SQ(i,1);
end
for i=1:(N-1)^2
    TR(2*i-1,3)=SQ(i,4);
    TR(2*i,3)=SQ(i,4);
end
for i=1:(N-1)^2
    TR(2*i-1,2)=SQ(i,2);
    TR(2*i,2)=SQ(i,3);
end
CR=zeros(N^2,2);
for i=1:N
    for j=1:N
        CR((i-1)*N+j,1)=(j-1)*h;
    end
end
for i=1:N
    for j=1:N
        CR((i-1)*N+j,2)=(i-1)*h;
    end
end

% determining the constrained nodes
Nc=zeros((N^2)-((N-2)^2),1);
for i=1:N
    Nc(i)=i;
end
for i=1:N
    Nc(N^2-(N-2)^2-N+i)=N^2-N+i;
end
for i=1:N-2
    Nc(N+1+2*(i-1))=i*N+1;
end
for i=1:N-2
    Nc(N+2*i)=(i+1)*N;
end

% implementing the combined algorithm to form A and F
A=zeros(N^2,N^2);
F=zeros(N^2,1);
for i=1:NT
    z1=TR(i,1);
    z2=TR(i,2);
    z3=TR(i,3);
    x1=CR(z1,1);
    x2=CR(z2,1);
    x3=CR(z3,1);
    y1=CR(z1,2);
    y2=CR(z2,2);
    y3=CR(z3,2);
    AT=zeros(3,3);
    c1=(y2-y3)^2+(x3-x2)^2;
    AT(1,1)=(c1/(12*AR))*(a(x1,y1)+a(x2,y2)+a(x3,y3))+(AR/3)*(b(x1,y1));
    c2=(y3-y1)^2+(x1-x3)^2;
    AT(2,2)=(c2/(12*AR))*(a(x1,y1)+a(x2,y2)+a(x3,y3))+(AR/3)*(b(x2,y2));
    c3=(y1-y2)^2+(x2-x1)^2;
    AT(3,3)=(c3/(12*AR))*(a(x1,y1)+a(x2,y2)+a(x3,y3))+(AR/3)*(b(x3,y3));
    c4=(y2-y3)*(y3-y1)+(x3-x2)*(x1-x3);
    AT(1,2)=(c4/(12*AR))*(a(x1,y1)+a(x2,y2)+a(x3,y3));
    c5=(y3-y1)*(y1-y2)+(x1-x3)*(x2-x1);
    AT(2,3)=(c5/(12*AR))*(a(x1,y1)+a(x2,y2)+a(x3,y3));
    c6=(y2-y3)*(y1-y2)+(x3-x2)*(x2-x1);
    AT(1,3)=(c6/(12*AR))*(a(x1,y1)+a(x2,y2)+a(x3,y3));
    AT(3,1)=AT(1,3);
    AT(3,2)=AT(2,3);
    AT(2,1)=AT(1,2);
    z=[z1 z2 z3];
    for i=1:3
        mu=z(i);
        if ismember(mu,Nc) == 0
            F(mu)=F(mu)+(AR/3)*f(CR(mu,1),CR(mu,2));
            for j=1:3
                nu=z(j); 
                if ismember(nu,Nc) == 0
                    A(mu,nu)=A(mu,nu)+AT(i,j);
                else
                    F(mu)=F(mu)-AT(i,j)*g(CR(nu,1),CR(nu,2));
                end
            end
        end
    end
end

% changing rows of A and elements of F corresponding to constrained nodes
for i=1:(N^2)-((N-2)^2)
    A(Nc(i),Nc(i))=1;
end
for i=1:(N^2)-((N-2)^2)
    F(Nc(i))=g(CR(Nc(i),1),CR(Nc(i),2));
end

% calculating U that gives the approximate soln by FEM
Uapp=A\F;

% finding the exact solutions at the nodes
Uexct=zeros(N^2,1);
for i=1:N^2
    Uexct(i)=u(CR(i,1),CR(i,2));
end

%finding the L2 error
sum1=0;
for i=1:NT
    sum1=sum1+(AR/3)*((Uexct(TR(i,1))-Uapp(TR(i,1)))^2+(Uexct(TR(i,2))-Uapp(TR(i,2)))^2+(Uexct(TR(i,3))-Uapp(TR(i,3)))^2);
end
L2err=sum1^(1/2)

% finding the H1 error
sum2=0;
for i=1:NT
    z1=TR(i,1);
    z2=TR(i,2);
    z3=TR(i,3);
    x1=CR(z1,1);
    x2=CR(z2,1);
    x3=CR(z3,1);
    y1=CR(z1,2);
    y2=CR(z2,2);
    y3=CR(z3,2);
    gr1=zeros(2,1);
    gr1(1)=Uapp(z1)*(1/(2*AR))*(y2-y3);
    gr1(2)=Uapp(z1)*(-1/(2*AR))*(x2-x3);
    gr2=zeros(2,1);
    gr2(1)=Uapp(z2)*(1/(2*AR))*(y3-y1);
    gr2(2)=Uapp(z2)*(-1/(2*AR))*(x3-x1);
    gr3=zeros(2,1);
    gr3(1)=Uapp(z3)*(1/(2*AR))*(y1-y2);
    gr3(2)=Uapp(z3)*(-1/(2*AR))*(x1-x2);
    GR=gr1+gr2+gr3;
    if rem(i, 2) == 0
        GR=-GR;
    end
    sum2=sum2+(AR/3)*(dot([ux(x1,y1)-GR(1);uy(x1,y1)-GR(2)],[ux(x1,y1)-GR(1);uy(x1,y1)-GR(2)])+dot([ux(x2,y2)-GR(1);uy(x2,y2)-GR(2)],[ux(x2,y2)-GR(1);uy(x2,y2)-GR(2)])+dot([ux(x3,y3)-GR(1);uy(x3,y3)-GR(2)],[ux(x3,y3)-GR(1);uy(x3,y3)-GR(2)]));  
end
H1err=(sum1+sum2)^(1/2)

% plotting the numerical solution
x=CR(:,1);
y=CR(:,2);
z=Uapp;
plot3(x,y,z,'-')
title('FEM Solutions to Question B when h = 1/32')


    
             
    
    
    
    
    

    
    


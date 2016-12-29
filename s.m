f=@(x) sin(x);
df=@(x) cos(x);
%x=newton(2,f,df);
%x=secant(1,1.5,f);

%A=[5 0 0;1 2 0;-1 3 2];
%b=[15 ;7; 5];
%A=[1 1 1;1 1 2;1n 2 2];
%b=[1 2 1];
%x=gebs(A,b);
A=[4 3 0;3 4 -1;0 -1 4];
b=[24;30;-24];
%A=[2 -1 0;-1 2 -1;0 -1 2]
%[P,L,U]=LU(A);
%[L]=LL(A)
%A=[3 -1 1;3 6 2;3 3 7];
%w=1.1;
x=[0;0;0];
%b=[1;0;4];
%x=[2;3;4];
%y=[4;9;16];
%U=[1;5];
%w=1.5;
%b=[15;7;5];
%b=[1;2;1];
%y=SOR(A,b,w,x);
%M=diag(diag(A));
%M=w * tril(A, -1) + diag(diag(A));
M=eye(3,3);
y=PCG(A ,b,M,x);
%x=[1;2;4];

%y=[1;3;3];
%u=[1;3];
%v=NewtonDD(x,y,u);
%v=PLI(x,y,u);
%v=CubicSpline();
x=(0:0.1:1)';
y=sin(2*pi*x);
U=(-0.05:0.1:1.05)';
%v=NewtonDD(x,y,U);
V=CubicSpline( x,y,U );
y=sin(2*pi*u);
plot(x,y,'ro',U,V,'b-')
fprintf('%.15f',x);
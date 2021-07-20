%Eduardo de Jesús Gasca Laguna
%14/07/2021

n = 800;
A = 1.995653;
B = 1.27689;
C = 9;

r = linspace(0,1,n);
theta = linspace(-2,20*pi,n);
[R,THETA] = ndgrid(r,theta);

%Numero de petalos por ciclo
Npetalos = 3.6;

x = 1-(1/2)*((5/4)*(1-mod(Npetalos*THETA,2*pi)/pi).^2 - 1/4).^2;
phi = (pi/2)*exp(-THETA/(C*pi));
y = A*(R.^2).*(B*R-1).^2.*sin(phi);
R2 = x.*(R.*sin(phi)+y.*cos(phi));

X = R2.*sin(THETA);
Y = R2.*cos(THETA);
Z = x.*(R.*cos(phi) - y.*sin(phi));

%Color del mapeado
clf
surf(X,Y,Z,'LineStyle','none')
view([-40.50 42.00])
colormap(spring)

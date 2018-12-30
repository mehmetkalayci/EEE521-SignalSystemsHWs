clc;
clear all;


%% 1.A
syms z
F = (8 - 4*(z^-1)) / ((z^-2) + 6*(z^-1) + 8);
iztrans(F);
z=tf('s');


F = (8 - 4*(z^-1)) / ((z^-2) + 6*(z^-1) + 8);
h=tf([-4 8],[1 6 8]);

[r,p,k] = residuez([-4 8],[1 6 8]);
[b,a] = residuez(r,p,k);

zplane(b,a)
hold on
plot(p,'^r')
hold off


% 1.B
% 1.C



%% 2.A

% Y/X  = (1+3*R)    / (2*R+1)
% H(z) = (1+3*z^-1) / (2*z^-1 + 1);
syms z
H = (1+3*z^-1) / (2*z^-1 + 1);
iztrans(H);


% 2.B
% 2.C

%% 3.A
syms t
f = (4- 4*exp(1) -2*t*cos(t) + 2*exp(1) -2*t*sin(t)) * heaviside(t);
laplace(f)

%% 4.A

syms t s
F=(s+5)/(s*(s-2)^2);
ilaplace(F);

% 4.B

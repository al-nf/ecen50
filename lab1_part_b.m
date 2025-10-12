% Name: Alan Fung 
% Lab Number: 1B
% Class: ECEN 50L
% Date: 09/29/2025
% Section Time: 2:15 PM

%% Part 1: basic symbolic math
syms x y % declare x and y as symbolic variables
f = (x+y)^3 % define a function f using x and y
expand(f) % use expand to multiply out and expand the expression
factor(ans) % use factor to find factors of the long algebraic expression
z = sin(x+y); % define a trig expression z
z1 = expand(z)
z2 = subs(z, y, pi-x) % substitute y = pi-x in the expression z

%% Part 2: use symbolic math to perform differentiation
clear % clear all variables
syms x
f = (exp(2*x^2) - 8*sin(x+3) + 5^(x+1))/(20 * cos(5*x+2))
pretty(f) % shows the equation in typeset mathematics
Df1 = diff(f, x) % differentiate f with respect to x
pretty(Df1)

%% Part 3: use symbolic math to perform a definite integral
clear
syms t
g = exp(-4*t)
Int1 = int(g, t, 0, 10) % calculates a definite integral, precise output
% integral limits can be written in several ways
% Int1 = int(g, t, [0, 10]), or Int1 = int(g, t, [0 10])
Int1 = double(Int1) % show the output in a decimal (double precision)

%% Part 4: deliverable
clear
syms x;
f = (exp(-3*x) + 10*sin(x+1))/cos(x+1);
g = (exp(-2*x))/(1+exp(-2*x));

pretty(diff(f,x))
pretty(diff(g,x))

h = -4*x^2;
double(int(h, x, [-2 2]))
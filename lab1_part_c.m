% Name: Alan Fung 
% Lab Number: 1C
% Class: ECEN 50L
% Date: 09/29/2025
% Section Time: 2:15 PM


%% Part 1: use the solver to solve an equation
syms x a % tell Matlab that x and a are symbols
f = (x-1) * (x-a) * (x + pi) * (x+2) * (x+3) % define f
soln = solve(f,x) % find all 5 zeros of f(x)
check = subs(f,x,soln(5)) % check the fifth solution (which is -pi)

%% Part 2: use the solver to solve a system of linear equations
% put the solution in symbols
clear
syms x y z
exp1 = x + 3*y - z == 2; % first expression as the equation
exp2 = x - y + z - 3 == 0; % expression as the zero of an expression
exp3 = 3*x - 5*y - 4; % expression that is not an equation: solver will seek its zero
[x y z] = solve(exp1,exp2,exp3,x,y,z) % solve these expressions
[x y z] = solve(exp1,exp2,exp3) % also works
x1 = double(x) % shows x as a double precision value of 33/16
y1 = double(y)
z1 = double(z)

%% Part 3: group equations and symbols together
clear
syms x y z
eq1 = x + 3*y - z == 2; % expression is an equation
eq2 = x - y + z == 3;
eq3 = 3*x - 5*y == 4;
eqns = [eq1,eq2,eq3]; % group the 3 equations together as eqns
vars = [x,y,z]; % group the 3 symbols x, y, z together as var
results = solve(eqns, vars); % stores solution in a results structure
x = double(results.x ) % extract x from the results structure
y = double(results.y)
z = double (results.z)
% [x y z] = solve(eqns,vars) % also works
% [x y z] = solve(eqns) % works too

%% Part 4: using defined variables
clear
a = 10;
b = 5;
c = 4;
d = 12.5;
e = 6;
f = 2;
syms X1 X2 X3 % unknown variables
eq1 = (X1 - X2)/a + X3/b + (X1 - X3)/c == d; % expression is an equation
eq2 = X2/a + (X3 - X1)/b + (X2 - X3)/c == e;
eq3 = X1 + X2 == f;
eqns = [eq1,eq2,eq3]; % group the 3 equations together as eqns
vars = [X1, X2, X3]; % group the unknown variables together as vars
results = solve(eqns, vars); % solve and stores solutions in a results structure
X1 = double(results.X1) % extract X1 from the results structure
X2 = double(results.X2) % extract X1 from the results structure
X3 = double(results.X3) % extract X1 from the results structure

%% Part 5: deliverable
clear
clc
r1=1e3;
r2=1e3;
r3=2e3;
r4=1e3;
vs1=6;
vs2=12;
is1=2e-3;
is2=4e-3;
is3=6e-3;
syms va vb vc vd;
eq1 = (va-vb)/r1 - is1 + (va-vd)/r2 - is3 == 0;
eq2 = (vb-va)/r1 + is1 + (vd-va)/r2 + vb/r3 + is2 + vd/r4 == 0;
eq3 = vb-vc == vs1;
eq4 = vd-vc == vs2;

results = solve([eq1,eq2,eq3,eq4]);
double(results.va)
double(results.vb)
double(results.vc)
double(results.vd)


disp('------------------------------------------------------')

clear
syms va vb vc vd;
r1=1e3;
r2=2e3;
r3=3e3;
r4=4e3;
vs1=12;
vs2=24;
is1=4e-3;
is2=8e-3;
is3=12e-3;
eq1 = (va-vb)/r1 - is1 + (va-vd)/r2 - is3 == 0;
eq2 = (vb-va)/r1 + is1 + (vd-va)/r2 + vb/r3 + is2 + vd/r4 == 0;
eq3 = vb-vc == vs1;
eq4 = vd-vc == vs2;

results = solve([eq1,eq2,eq3,eq4]);
double(results.va)
double(results.vb)
double(results.vc)
double(results.vd)
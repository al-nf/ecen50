% Name: Alan Fung 
% Lab Number: 6
% Class: ECEN 50L
% Date: 11/10/2025
% Section Time: 2:15 PM

%% 2a
clear
clc

c1 = 1e-6;
c2 = 2.2e-6;
c3 = 4.7e-6;

ceq = (c1*c2*c3)/(c1*c2 + c1*c3 + c2*c3);
v1 = ceq/c1
v2 = ceq/c2
v3 = ceq/c3

%% 2b
clear
clc

r1 = 0.5e3;
r2 = 0.75e3;
c = 1e-6;

tau1 = r1*c
tau2 = r2*c
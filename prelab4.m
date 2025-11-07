% Name: Alan Fung 
% Lab Number: 4
% Class: ECEN 50L
% Date: 10/20/2025
% Section Time: 2:15 PM

%% Part 1: Figure 1 - Resistive Network
clear
clc
vs = 12;
r1 = 6.8e3;
r2 = 3.9e3;
r3 = 1e3;
r4 = 4.7e3;
r5 = 10e3;
r6 = 2.5e3;

syms ia ib ic;
eq1 = ia*r1 + (ia-ib)*r3 + ia*r6 == vs;
eq2 = (ib-ia)*r3 + (ib-ic)*r4 == 0;
eq3 = (ic-ib)*r4 + ic*r2 + ic*r5 == 0;
results = solve(eq1, eq2, eq3);

v4 = double((results.ib - results.ic)*r4);
v5 = double(results.ic * r5);
i4 = double(results.ib - results.ic);
i5 = double(results.ic);
p4 = double(v4 * i4);
p5 = double(v5 * i5);

format shortE;
Table1 = table(v4, v5, i4, i5, p4, p5)

%% Part 2: Figure 3 - Wheatstone Bridge
clear
clc
vs = 10;
r1 = 6.8e3;
r2 = 3.9e3;
radj = 9.1e3;

rx = (r2*radj)/r1;
is = vs * (r1 + r2 + radj + rx)/( (r1+radj) * (r2+rx) );

format shortE;
Table2 = table(r1, r2, radj, rx, is)
% Name: Alan Fung 
% Lab Number: 2
% Class: ECEN 50L
% Date: 10/04/2025
% Section Time: 2:15 PM

%% Part 2a: Calculate i1, v1, and v2 for the circuit in fig. 1
clear
clc
syms i1 v1 v2;
vs = 10;
r1 = 2e3;
r2 = 1e3;
eq1 = vs - i1*(r1+r2) == 0;
eq2 = v1 == i1*r1;
eq3 = v2 == i1*r2;
format shortE;
results = solve(eq1, eq2, eq3);
double(results.i1)
double(results.v1)
double(results.v2)

%% Part 2b: Calculate i1, i2, i3, v1, v2, and v3 for the circuit in fig. 2
clear
clc
syms i1 i2 i3 v1 v2 v3;
vs = 10;
r1 = 2e3;
r2 = 1e3;
r3 = 7.5e3;
eq1 = i1*r1 + i2*r2 == vs;
eq2 = i2*r2 == i3*r3;
eq3 = i2+i3 == i1;
eq4 = vs/(r1 + (r2*r3)/(r2+r3)) == i1;
eq5 = i1*r1 == v1;
eq6 = i2*r2 == v2;
eq7 = v3 == v2;
format shortE;
results = solve(eq1, eq2, eq3, eq4, eq5, eq6, eq7);
double(results.i1)
double(results.i2)
double(results.i3)
double(results.v1)
double(results.v2)
double(results.v3)

%% Part 2c: Calculate i1, i2, i3, i4, v1, v2, v3, and v4 for the circuit in fig. 2 with another resistor r4 in parallel with r2 and r3
clear
clc
syms i1 i2 i3 i4 v1 v2 v3 v4;
vs = 10;
r1 = 2e3;
r2 = 1e3;
r3 = 7.5e3;
r4 = 3e3;
eq1 = i1*r1 + i2*r2 == vs;
eq2 = i1 == vs/(r1 + (r2*r3*r4)/(r3*r4 + r2*r4 + r2*r3));
eq3 = i2+i3+i4 == i1;
eq4 = i1*r1 == v1;
eq5 = i2*r2 == v2;
eq6 = i3*r3 == v3;
eq7 = v3 == v2;
eq8 = v4 == v2;
format shortE;
results = solve(eq1, eq2, eq3, eq4, eq5, eq6, eq7, eq8);
double(results.i1)
double(results.i2)
double(results.i3)
double(results.i4)
double(results.v1)
double(results.v2)
double(results.v3)
double(results.v4)

%% Part 3a: Calculate req seen by the voltage source vs for the circuit in fig. 3
clear
clc
r1 = 2e3;
r2 = 1e3;
r3 = 7.5e3;
r4 = 3e3;
r5 = 1e3;
r6 = 1e4;
format shortE;
req = r1 + ( r2 * ( r3 + ( r4 * ( r5+r6 ) / ( r4+r5+r6 ) ) ) / ( r2 + r3 + ( r4 * ( r5 + r6 ) / ( r4 + r5 + r6) ) ) )

%% Part 3b: Calculate i1, i2, i3, i4, i5, v1, v2, v3, v4, v5, and v6 for the circuit in fig. 3
clear
clc
syms i1 i2 i3 i4 i5 v1 v2 v3 v4 v5 v6
vs = 10;
r1 = 2e3;
r2 = 1e3;
r3 = 7.5e3;
r4 = 3e3;
r5 = 1e3;
r6 = 1e4;
eq1 = vs == v1 + v2;
eq2 = i3 == i1-i2;
eq3 = i5 == i3-i4;
eq4 = v1 == i1*r1;
eq5 = v2 == i2*r2;
eq6 = v3 == i3*r3;
eq7 = v4 == i4*r4;
eq8 = v5 == i5*r5;
eq9 = v6 == i5*r6;
eq10 = v2 == v3+v4;
eq11 = v4 == v5+v6;
format shortE;
results = solve(eq1,eq2,eq3,eq4,eq5,eq6,eq7,eq8,eq9,eq10,eq11);

% store in global for later
global i1 i2 i3 i4 i5;
global v1 v2 v3 v4 v5 v6;
i1 = double(results.i1)
i2 = double(results.i2)
i3 = double(results.i3)
i4 = double(results.i4)
i5 = double(results.i5)
v1 = double(results.v1)
v2 = double(results.v2)
v3 = double(results.v3)
v4 = double(results.v4)
v5 = double(results.v5)
v6 = double(results.v6)

% for parts 3c and 3d
global i1 i2 i3 i4 i5;
i1 = double(results.i1);
i2 = double(results.i2);
i3 = double(results.i3);
i4 = double(results.i4);
i5 = double(results.i5);

global v1 v2 v3 v4 v5 v6;
v1 = double(results.v1);
v2 = double(results.v2);
v3 = double(results.v3);
v4 = double(results.v4);
v5 = double(results.v5);
v6 = double(results.v6);

%% Part 3c: Confirm values using KCL
i1 - (i2+i3)
i3 - (i4+i5)
i1 - (i2+i4+i5)

%% Part 3d: Confirm values using KVL
v1 + v2 - 10
v3 + v4 - v2
v5 + v6 - v4

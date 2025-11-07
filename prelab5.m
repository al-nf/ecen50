% Name: Alan Fung 
% Lab Number: 5
% Class: ECEN 50L
% Date: 10/27/2025
% Section Time: 2:15 PM

%%
clear
clc
vs1 = 10;
vs2 = 4;
r1 = 6.814e3;
r2 = 3.881e3;
r3 = 0.976e3;
r4 = 4.638e3;
r5 = 9.84e3;
r6 = 2.676e3;
r7 = 14.77e3;
r8 = 26.68e3;
r9 = 7.529e3;

syms v2 v3 v5 voc;

rla = [0.15e3, 0.32e3, 0.73e3, 1.3e3, 2e3, 3.2e3, 5e3, 8.7e3, 19e3, 40e3];
v = zeros(1, length(rla)+1);
i = zeros(1, length(rla)+1);

% shortcircuit
eq1 = (vs1-v2)/r1 - (v2-v3)/r2 - v2/r5 - v2/r9 == 0;
eq2 = (vs1-v3)/r2 + (v2-v3)/r3 - (v3-vs2)/r4 - v3/r7 == 0;
results = solve(eq1,eq2);
v(1) = 0;
i(1) = (vs2/r8 + results.v3/r7 + results.v2/r5)*1e3;

% normal
for k = 1:length(rla)
    rl = rla(k);
    eq1 = (vs1-v2)/r1 - (v2-v3)/r3 - (v2-v5)/r5 - v2/r9 == 0;
    eq2 = (vs1-v3)/r2 + (vs2-v3)/r6 - (v3-v2)/r3 - (v3-v5)/r7 == 0;
    eq3 = (v2-v5)/r5 + (v3-v5)/r7 - (vs2-v5)/r8 - v5/rl == 0;
    results = solve(eq1, eq2, eq3);
    v(k+1) = double(results.v5);
    i(k+1) = double(results.v5)/rl * 1e3;
    double(vs1 * ((vs1-vs2)/r4 + (vs1-results.v3)/r2 + (vs1-results.v2)/r1))
    double(vs2 * ((vs2-vs1)/r4 + (vs2-results.v3)/r6 + (vs2-results.v5)/r8))
    double(((vs2-results.v5)/r8 + (results.v3-results.v5)/r7 + (results.v2-results.v5)/r5)^2 * rl)
end


figure;
plot(i, v, '-o', 'LineWidth', 1.5);
xlabel('Current (mA)');
ylabel('Voltage (V)');
title('Thevenin Voltage vs Current');
grid on;

rla = [0, rla]; % sneak in the short circuit resistance
Table3 = table(rla', v', i', 'VariableNames', {'rl', 'v (V)', 'i (mA)'})


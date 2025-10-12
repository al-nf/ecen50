% Name: Alan Fung 
% Lab Number: 3
% Class: ECEN 50L
% Date: 10/13/2025
% Section Time: 2:15 PM

%% Part 1: Impact of voltmeter with a non-ideal, low internal resistance
clc
vs = 10;
rs = 100e3;
rvm = 250e3;

fprintf('\n --TABLE A--\n\n');
fprintf('   r1 (k%s)      v1 (V)        v1l (V)       e1 (%%)      rvml (k%s)\n', char(937),char(937));
fprintf('-----------------------------------------------------------------\n');
syms v1 v1l;
r1_array = [15e3, 40e3, 50e3, 85e3, 95e3];  

for k = 1:length(r1_array)
    r1 = r1_array(k);
    eq1 = v1 == vs*(1-rs/(rs+r1));
    eq2 = v1l == vs*(1-(rs*(r1+rvm))/(rs*r1+rs*rvm+r1*rvm));
    results = solve(eq1, eq2);
    fprintf('   %d           %.2f          %.2f          %.3g%%      %d\n', 1e-3*r1, double(results.v1), double(results.v1l), double((results.v1l - results.v1)/results.v1 * 100), 1e-3*double(results.v1l*rs*r1/(r1*(vs-results.v1l) - results.v1l*rs)));
end

%% Part 2: Impact of ammeter with a high internal resistance
clc
vs = 2;
rs = 100;
ram = 5;

fprintf('\n --TABLE B--\n\n');
fprintf('   r2 (%s)       i2 (mA)       i2l (mA)          e2 (%%)      raml (%s)\n',char(937),char(937));
fprintf('--------------------------------------------------------------------\n');
syms i2 i2l;
r2_array = [50, 100, 150, 300, 500];

for k = 1:length(r2_array)
    r2 = r2_array(k);
    eq1 = i2 == vs/(rs+r2);
    eq2 = i2l == vs/(rs+r2+ram);
    results = solve(eq1, eq2);
    fprintf('   %#.3g         %#.3g          %#.3g              %.2f%%      %d\n',r2,double(1e3*results.i2),double(1e3*results.i2l),double((results.i2l - results.i2)/results.i2 * 100),double(vs/results.i2l - rs - r2));
end



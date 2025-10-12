%% 1
clear;
close all;

t = 0:0.01:10;
f = exp(-t/3);
plot(t, f);
xlabel('t');
ylabel('f(t) = e^{-t/3}');
title('f = exp(-t/3)');
grid on;

%% 2
clear;
close all;

a = linspace(0, 12*pi, 241);
g = cos(a);
plot(a, g);
xlabel('a');
ylabel('g(a) = cos(a)');
title('g = cos(a)');
grid on;

%% 3
clear;
close all;

w = 3;
t = 0:0.01:10;
a = w*t;
y = exp(-t/3) .* cos(a);
plot(t, y);
xlabel('t');
ylabel('y(t) = f(t) * g(a(t))');
title('y = f * g');
grid on;

%% 4
clear;
close all;

scores = [3.7 3.0 2.3];
units = [4 5 3];

format bank;
gpa = sum(scores .* units)/sum(units)

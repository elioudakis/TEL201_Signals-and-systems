%
% TEL201 - Lab Exam #2
%

clear all;
close all;

%% 1.1

fs = 1000;
Ts = 1/fs;
% Constructing the signal - Part 1/3
t1= [-3:Ts:-2-Ts];
x1 = (-2)*sin(30*pi*t1)-1;
% Constructing the signal - Part 2/3
t2 = [-2:Ts:2-Ts];
x2 = 1-abs(t2)/2;
% Constructing the signal - Part 3/3
t3 = [2:Ts:3];
x3 = 2*abs(sin(80*pi*t3))-1;

%Combining the three parts, to make the signal x(t).
t=[t1 t2 t3];
x=[x1 x2 x3];

%Ploting x(t);
figure(1);
plot(t,x);
title('Question 1.1 -plot of x(t)');

%% 1.2
NF=2^13; 
F = [-fs/2:fs/NF:fs/2-fs/NF];
X = fftshift(fft(x, NF)*Ts);

figure(2);
plot(F,abs(X));
title('Question 1.2 -plot of |X(f)|');

%% 1.3

tsinc = [-1.5 : Ts : 1.5];
ffil = 36;
y = ffil*sinc(ffil*tsinc);

figure(3);
plot(tsinc, y);
title('Question 1.3 -plot of y(t)');

axis([-2 2 -15 50]); % limiting the axis to show the [-1.5, 1.5]

%% 1.4

Y = fftshift(fft(y, NF)*Ts);
figure(4);
plot(F, abs(Y));
title('Question 1.4 -plot of |Y(f)|');

%% 1.5

tz = t(1)+tsinc(1):Ts:t(end)+tsinc(end);
z = conv(x, y)*Ts;

figure(5);
plot(tz, z);
title('Question 1.5 -plot of z(t)');

%% 1.6

Z = fftshift(fft(z, NF)*Ts);
figure(6);
plot(F, abs(Z));
title('Question 1.6 -plot of |Z(f)|');
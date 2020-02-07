clear all
close all

%% 1st exercise
n=[-27:13];

% 1st signal--x1[n]
x1=2.*(-n+3>=0).*(cos(3*n)).*(exp(abs(n/20)))+((1/2).*(7+n).*(7+n>=0));

figure(1);
stem(n,x1);
title('x1[n]');

% 2nd signal--x2[n]
n2=-n(end:-1:1)-2;
x2=x1(end:-1:1);

figure(2);
stem(n2,x2);
title('x2[n]');

% 3rd signal--x3[n]
n3=n(1)+n2(1):n(end)+n2(end);
y3=conv(x1,x2);

figure(3);
stem(n3, y3);
title('x3[n]');

%% 2nd exercise
DT=0.01;
t=[-2:DT:5];

% 1st signal--y1(t)
y1=((abs(t/2)).^(-(abs(2*t)))).*sin(4*pi*t);

figure(4);
plot(t, y1);
title('y1(t)');

% 2nd signal--y2(t)
t2=-t(end:-1:1);
y2=y1(end:-1:1);

figure(5);
plot(t2, y2);
title('y2(t)');

% 3rd signal--y4(t)=y1(t)*y2(t)
t4=t(1)+t2(1):DT:t(end)+t2(end);
y4=conv(y1, y2)*DT;

figure(6);
plot(t4, y4);
title('y4(t)=y1(t)*y2(t)');




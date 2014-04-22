data = [1 1; 2 0;1.5 1;1.4 1; 1.9 0; 1.8 0; 1.9 1; 1.2 0];
x = [2 1];
b = x(1);
eta = x(2);
[T,m] = size(data);
d = calcLinearGradient(x,data)
db = d(1);
de = d(2);

comp = db*ones(T,1) - de*data(:,1)

this = calcLinearStepSize(x,d,data);
% alph = calcLinearStepSize(x,d,data)
% xnew = x + alph*d
% x = xnew
% d2 = calcLinearGradient(x,data)
% alph = calcLinearStepSize(x,d2,data)

% xp = 1:20;
% xp = 0.1*xp;
% yp = xnew(1)*ones(size(xp)) - xnew(2)*xp;
% 
% plot(xp,yp);
% hold on;




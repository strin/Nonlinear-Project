function [ d ] = calcLogisticGradient(x,data)

a = x(1);
b = x(2);

[T,m] = size(data);

d = zeros(1,2);

for t=1:T
    p = data(t,1);
    y = data(t,2);
    temp = exp((a-p)/b);
    d(1) = d(1) + y/b - temp/b/(1+temp);
    d(2) = d(2) + y*(p-a)/b^2 - (p-a)*temp/b^2/(1+temp);
end

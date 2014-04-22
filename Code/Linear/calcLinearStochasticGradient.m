function [ d ] = calcLinearStochasticGradient(x,data)

b = x(1);
eta = x(2);

[T,m] = size(data);

d = zeros(1,2);

numSamples = 1;

for t=1:numSamples
    index = randi(T);
    p = data(index,1);
    y = data(index,2);
    temp = b - eta*p;
    if y == 1
        if temp > 0.000001 && temp < 0.999999
            d(1) = d(1) + 1/temp;
            d(2) = d(2) - p/temp;
        elseif temp <=0.000001
            d(1) = 100000;
            d(2) = 100000;
            display('Warning: Outside feasible region');
            break
        end        
    else
        if temp > 0.000001 && temp < 0.999999
            d(1) = d(1) - 1/(1-temp);
            d(2) = d(2) + p/(1-temp);
        elseif temp >=0.999999
            d(1) = 100000;
            d(2) = 100000;
            display('Warning: Outside feasible region');
            break
        end 
    end
end
d = 1/numSamples*d;
end

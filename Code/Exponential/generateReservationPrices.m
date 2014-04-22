function [ rPrices ] = generateReservationPrices( dType, n, params )
% Generate the (x_t), total of n;
% dType is the demand function type, with pdf as uniform, exponential,
% logistic, weibull.
% params is the parameters. 
% uniform: params = a,b, i.e., uniform between a and b
% Return: reservation prices of the n customers based on the demand
% distribution.

rPrices = zeros(n,1);


if (strcmp(dType, 'uniform'))
    a = params(1);
    b = params(2);    
    rPrices = unifrnd(a,b,n,1);
end

if (strcmp(dType, 'logistic'))
    a = params(1);
    b = params(2);
    r = unifrnd(0,1,n,1);
    rPrices = a - b * log((1-r)./r);
end

if (strcmp(dType, 'linear'))
    b = params(1);
    eta = params(2);
    rPrices = unifrnd((b-1)/eta,b/eta,n,1);
end

if (strcmp(dType, 'exponential'))
    lambda = params(1);
    rPrices = exprnd(lambda, n, 1);
end

end


function [ prices ] = generateOfferPrices( n, a, b)
    % Generate the prices that are set by the sellers, n prices.
    % a and b are lower and upper bounds.
    % For now we just generate the prices randomly between a and b.
    if nargin == 1
        a = 1;
        b = 3;
    end
    prices = unifrnd(a,b,n,1);
%     prices = 30*randi([a,b],n,1);
end


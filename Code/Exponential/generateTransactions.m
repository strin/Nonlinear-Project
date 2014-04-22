function [ transactions ] = generateTransactions( dType, params, a, b, n)
% generatePurchaseRecord 
% Matrix with dimensions n by 2
% Each row is a offered price followed by the purchase decision (0/1)
% dType is the demand function type
% params are for the demand function parameters
% a and b are lower and upper bounds for the prices offered
% n is the number of transactions

p = generateOfferPrices(n,a,b);
r = generateReservationPrices(dType, n, params);

transactions = [p, p < r];

end


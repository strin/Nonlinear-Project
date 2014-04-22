T = 31415;
lb = 0; % lowerbound for the price offered
ub = 50; % upperbound for the price offered
dType = 'logistic'; % underlying demand function type 
params = [2; 3]; % params for the underying demand function
optType = 'stochastic'; % choose between basic and stochastic gradient methods
transactions = generateTransactions(dType, params, lb, ub, T);

x0 = [50 50];

[ X, D ] = gradientDescent(x0,transactions,optType);

scatter(X(:,1),X(:,2),'.');
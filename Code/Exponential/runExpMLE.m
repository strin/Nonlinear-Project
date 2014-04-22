data = generateTransactions('exponential', [30], 0, 30, 1000);
n = size(data,1);
param.batchsize = ceil(n/10);
param.num_iter = inf;
param.anneal = @(t)(1e-3/(1000+t));
% param.anneal = 0.01;

lambda_mle = sgd_exponential(data(:,1), data(:,2), param);
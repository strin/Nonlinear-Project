function lambda = sgd_exponential(X, Y, param)
    n = length(X);
    if ~isfield(param, 'batchsize')
        param.batchsize = ceil(n/10);
    end
    if ~isfield(param, 'num_iter')
        param.num_iter = 100000;
    end
    if ~isfield(param, 'anneal')
        param.anneal = @(t)(1e-5/(t));
    end 
    obj_f = @(lambda, x, y)(sum(-lambda*x.*y+(1-y).*log(1-exp(-lambda*x))));
    obj_df = @(lambda, x, y)(sum(-x.*y+x.*(1-y)./(exp(lambda*x)-1)));
    lambda = 1;
    last_obj = -inf;
    for it = 1:param.num_iter
%         ind = 1:n; % using batch.
        ind = randsample(1:n, param.batchsize, true); % use stochastic batch.
        
        lambda = lambda+param.anneal(it)*obj_df(lambda, X(ind), Y(ind));
        if (obj_f(lambda, X, Y)-last_obj) <  abs(obj_f(lambda, X, Y))*1e-4
            break
        else
            last_obj = obj_f(lambda, X, Y);
        end
    end
end
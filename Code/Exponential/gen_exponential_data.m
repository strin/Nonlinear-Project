function [X, Y] = gen_exponential_data(lambda, num_sample)
    X = rand(num_sample,1)*100;
    Y = double(rand(num_sample,1)<exp(-lambda*X));
end
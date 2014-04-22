function [ X, D ] = gradientDescent(x0,data,descentType)
%% Gradient descent 
% x0 = a,b, a = alpha in logistic, b = beta

X = zeros(0,0); % record of x
x = x0;
numSteps = 999;
D = zeros(0,0); % record of step directions

for i=1:numSteps
    X = [X; x];
    if (strcmp(descentType,'basic'))
        gradient = calcLogisticGradient(x,data);
    end
    if (strcmp(descentType,'stochastic'))
        gradient = calcLogisticStochasticGradient(x,data);
    end
    d = gradient;
    D = [D; d'];
    stepSize = calcLogisticStepSize(x,d,data); % can just return 1 for now, or at least in the feasible region
    x_new = x + stepSize * d;
    x = x_new;
end


function [ X, D ] = gradientDescent(x0,data,descentType)
%% Gradient descent 
% x0 = a,b, a = alpha in logistic, b = beta
numSteps = 1000;
X = zeros(numSteps,2); % record of x
x = x0;
D = zeros(numSteps,2); % record of step directions

for i=1:numSteps
    X(i,:) = x';
    if (strcmp(descentType,'basic'))
        gradient = calcLinearGradient(x,data);
    end
    if (strcmp(descentType,'stochastic'))
        gradient = calcLinearStochasticGradient(x,data);
    end
    d = gradient;
    D(i,:) = d';
    stepSize = calcLinearStepSize(x,d,data);
    x_new = x + stepSize * d;
    x = x_new;
    
end


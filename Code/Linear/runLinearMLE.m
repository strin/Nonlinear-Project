T = 50000;
lb = 0; % lowerbound for the price offered
ub = 50; % upperbound for the price offered
dType = 'linear'; % underlying demand function type 
params = [8/7 1/70]; % params for the underying demand function
optType = 'basic'; % choose between basic and stochastic gradient methods
transactions = generateTransactions(dType, params, lb, ub, T);

[T,m] = size(transactions);

x0 = [1 0.01];
% mle = @(x) -sum(transactions(:,2).*log(min(1,max(0.000001,x(1)*ones(T,1) - x(2)*transactions(:,1)))) + (1-transactions(:,2)).*log(1-min(1,max(0.000001,x(1)*ones(T,1) - x(2)*transactions(:,1)))));
% 
% options = optimset('MaxFunEvals',10000000);
% y = fminsearch(mle,x0,options);
% 
% d30 = sum(transactions(:,1) == 30);
% d60 = sum(transactions(:,1) == 60);
% d90 = sum(transactions(:,1) == 90);
% 
% n30 = 0;
% n60 = 0;
% n90 = 0;
% 
% for t = 1:T
%     if transactions(t,:) == [30 0]
%         n30 = n30 + 1;
%     end
%     if transactions(t,:) == [60 0]
%         n60 = n60 + 1;
%     end
%     if transactions(t,:) == [90 0]
%         n90 = n90 + 1;
%     end
% end
% 
% dp = zeros(3,1);
% dp(1) = n30/d30;
% dp(2) = n60/d60;
% dp(3) = n90/d90;
% 
% rp = [30;60;90];
% scatter(rp,dp);
% 
% hold on;
% 
% xs = 0:100;
% ys = 1-min(1,max(0,1.1536*ones(1,length(xs)) - 0.0145*xs));
% ys2 = 1-min(1,max(0,(8/7)*ones(1,length(xs)) - (1/70)*xs));
% ys3 = 1-min(1,max(0,ones(1,length(xs)) - 0.01*xs));
% plot(xs,ys);
% plot(xs,ys2,'r');
% plot(xs,ys3,'g');
[ X, D ] = gradientDescent(x0,transactions,optType);

scatter(X(:,1),X(:,2),'.');
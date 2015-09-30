function [J] = multivariate(alpha,x,y,m)


MAX_ITERATION = 50;

theta = zeros(size(x(1,:)))';
J = zeros(MAX_ITERATION, 1);

    for iter = 1:MAX_ITERATION
	%calculater J	
	J(iter) = ((0.5/m) .* sum((x*theta - y).^2);
	%gradient
	grad = (1/m) .* x' ((x * theta) - y);
	%theta
	theta = theta - alpha .*grad;
    end
end

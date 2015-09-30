x = load('ex2x.dat');
y = load('ex2y.dat');
m = length(y);

%add intercept term to x
x = [ones(m, 1), x];

%save a copy of x
x1 = x;

%plot the raw data
plot(x(:,2),y,'o');
xlabel('Living Area');
ylabel('Housing Prices');

plot(x(:,3),y,'o');
xlabel('Num. of Bedrooms');
ylabel('Housing Prices');


%scale features
mu = mean(x);
sigma = std(x);
x(:,2) = (x(:,2) - mu(2))./ sigma(2);
x(:,3) = (x(:,3) - mu(3))./ sigma(3);

%plot the pre-processed data
plot(x(:,2),y,'o');
xlabel('Living Area');
ylabel('Housing Prices');

plot(x(:,3),y,'o');
xlabel('Num. of Bedrooms');
ylabel('Housing Prices');

J1 = multivariate(0.8,x,y,m);
J2 = multivariate(0.1,x,y,m);
J3 = multivariate(0.02,x,y,m);

plot(0:49, J1(1:50), 'b-', 'LineWidth', 2);hold on;
plot(0:49, J2(1:50), 'r-', 'LineWidth', 2);hold on;
plot(0:49, J3(1:50), 'k-', 'LineWidth', 2);
legend('a = 0.08', 'a = 0.1', 'a = 0.02');
xlabel('no. of iterations');
ylabel('Cost Function,J');

%implement linear regression using the eq of gradient descent
max = 50;
theta = zeros(size(x(1,:)))';
theta = theta - (0.8 * (1/m) * x' * (x*theta - y));
for i = 1:max
    theta = theta - (0.8 * (1/m) * x' * (x*theta - y));
end

%scaling 1650 sq m and 3 bedrooms
area = (1650 - mu(2))./sigma(2);
room = (3 - mu(3))./sigma(3);
price = theta(1) + theta(2)*area + theta(3)*room;

%use normal equation
theta1 = (x1'*x1^-1 * x1'*y;
price1 = theta1(1) + theta1(2)*1650 + theta1(3)*3;




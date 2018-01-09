function [J, grad] = costFunctionReg(theta, X, y, lambda)
% COSTFUNCTIONREG Computes cost and gradient for logistic regression with
% regularization.

% J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
% theta as the parameter for regularized logistic regression and the
% gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

n = size(X, 2); % number of features

H = sigmoid(X * theta);
J = sum(y .* log(H) + (1 - y) .* log(1 - H)) / (-m) + lambda / (2 * m) * sum(theta(2 : n) .^ 2);
grad = sum(repmat((H - y), 1, n) .* X) / m;
grad(2 : n) = grad(2 : n)' + lambda / m * theta(2 : n);
% =============================================================

end

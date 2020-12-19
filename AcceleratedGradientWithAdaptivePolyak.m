%(0) Initialize an empty PEP
P = pep();
 
% (1) Set up the objective function
mu = 0.1;
L = 1;
param.mu = mu; % strong convexity parameter 
param.L = L; % Smoothness parameter
 
F=P.DeclareFunction('SmoothStronglyConvex',param); % F is the objective function
 
% (2) Set up the starting point and initial condition
x0 = P.StartingPoint(); % x0 is some starting point
[xs, fs] = F.OptimalPoint(); % xs is an optimal point, and fs=F(xs) 
P.InitialCondition((x0-xs)^2 <= 1); % Add an initial condition ||x0-xs||^2<= 1
 
% (3) Algorithm
K=4; % Number of epochs
T = 1; % number of iterations
x = cell(N+1,1); % we store the iterates in a cell for convenience
x{1} = x0; 
y = x0;
gamma = 2/(L+m); 
[g0,f0] = F.oracle(x0);

for j = 1:K
    for i = 1:T
        d = inexactsubgradient(y, F, gamma);
        P.AddConstraint( gamma * g0^2 == 2*(f0 - fs));
        beta = (sqrt(L) - sqrt(gamma))/(sqrt(L) + sqrt(gamma));
        x{i+1} = y - beta * d;
        y = x{i+1} + (i-1)/(i+2) * (x{i+1} - x{i});
    end
end
 
% (4) Set up the performance measure
[g, f] = F.oracle(x{N+1}); % g=grad F(x), f=F(x)
P.PerformanceMetric(f - fs); % Worst-case evaluated as F(x)-F(xs)
 
% (5) Solve the PEP
P.solve()
 
% (6) Evaluate the output
% double(obj) % worst-case objective function accuracy
% ans.dualnames


function wc=VanillaGDWithPolyak(gamma_k)
% (0) Initialize an empty PEP
P = pep();

L = 1; m = 0.01;
% (1) Set up the objective function
param.mu = m;     % Strong convexity parameter
param.L  = L;     % Smoothness parameter

F=P.DeclareFunction('SmoothStronglyConvex',param); % F is the objective function

% (2) Set up the starting point and initial condition
x0      = P.StartingPoint();		 % x0 is some starting point
[xs,fs] = F.OptimalPoint(); 		 % xs is an optimal point, and fs=F(xs)
P.InitialCondition( (x0-xs)^2 <= 1); % Initial condition ||x0-xs||^2<= 1

% (3) Algorithm
[g0,f0] = F.oracle(x0);
x1      = x0 - gamma_k * g0;

P.AddConstraint( gamma_k * g0^2 == 2*(f0 - fs));

% (4) Set up the performance measure
obj = (x1-xs)^2;
P.PerformanceMetric(obj);     

% (5) Solve the PEP
verbose=1;
out = P.solve(verbose);
wc = out.WCperformance;
end
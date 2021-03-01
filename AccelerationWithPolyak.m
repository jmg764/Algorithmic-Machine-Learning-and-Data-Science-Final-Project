function wc=AccelerationWithPolyak(mu_k)
% (0) Initialize an empty PEP
P = pep();

L = 1;
% (1) Set up the objective function
param.mu = mu_k;     % Strong convexity parameter
param.L  = L;     % Smoothness parameter

F=P.DeclareFunction('SmoothStronglyConvex',param); % F is the objective function

% (2) Set up the starting point and initial condition
x0      = P.StartingPoint();		 % x0 is some starting point
y0      = x0;
[xs,fs] = F.OptimalPoint(); 		 % xs is an optimal point, and fs=F(xs)
[g0,f0] = F.oracle(x0);
P.InitialCondition((L/2)*(x0-y0)^2 + f0 - fs <= 1);         % Incorporates Lyapunov function from Lemma 5 

% (3) Algorithm
y1      = x0 - (1/L) * g0;
beta_0  = (sqrt(L) - sqrt(mu_k))/(sqrt(L) + sqrt(mu_k));
x1      = y1 + beta_0*(y1 - y0);

P.AddConstraint(g0^2 == mu_k*2*(f0 - fs));

% (4) Set up the performance measure
fy1 = F.value(y1);
obj = (L/2)*(x1-y1)^2 + fy1 - fs;       % Incorporates Lyapunov function from Lemma 5
P.PerformanceMetric(obj);     

% (5) Solve the PEP
verbose=1;
out = P.solve(verbose);
wc = out.WCperformance;
% [double(obj) 1/(1+(mu_k/L))]
end
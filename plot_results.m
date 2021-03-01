
% Plot AccelerationWithPolyak.m
nb_mu=25;
mu_vec1=linspace(0,.99,nb_mu);
performance1=zeros(nb_mu,1);
for i=1:nb_mu
    fprintf('Case %d on %d\n',i,nb_mu);
    mu=mu_vec1(i);
    performance1(i)=AccelerationWithPolyak(mu);
end
plot(mu_vec1,performance1,'-m','linewidth',2); set(gca,'FontSize',14); hold on;
xlabel('Step size','Fontsize',14);
ylabel('Worst-case convergence rate','Fontsize',14);
print -depsc GradientWC.eps


% Plot VanillaGDWithPolyak.m
nb_mu2=25;
mu_vec2=linspace(0,50,nb_mu2);
performance2=zeros(nb_mu2,1);

for i=1:nb_mu2
    fprintf('Case %d on %d\n',i,nb_mu2);
    mu2=mu_vec2(i);
    performance2(i)=VanillaGDWithPolyak(mu2);
end

plot(mu_vec2,performance2,'-g','linewidth',2); set(gca,'FontSize',14); hold on;
legend(["Acc Polyak", "GD Polyak"],'Interpreter','latex');
xlabel('Step size','Fontsize',14);
ylabel('Worst-case convergence rate','Fontsize',14);
print -depsc GradientWC.eps










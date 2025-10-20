%% Kitticopter P-Controller Root Locus Design and Settling Time Analysis
clc; clear; close all;

%% Plant transfer function: G(s) = 15.04 / (s(7.3s+1))
num = 15.04;
den = [7.3 1 0];   % includes integrator
G = tf(num, den);

%% Root locus plot
figure;
rlocus(G);
title('Root Locus of Kitticopter Open-Loop System');
xlabel('Real Axis'); ylabel('Imaginary Axis');
grid on; hold on;

%% Design constraints
% Overshoot spec: <30% -> ζ >= 0.35 (choose ζ=0.5 for ~15% overshoot margin)
zeta_target = 0.5;    % desired damping ratio line
sgrid(zeta_target, []); % overlay damping ratio line

% Settling time spec: Ts < 30 s => σ > 4/Ts
sigma_req = 4/30;
xline(-sigma_req, '--r', 'Re = -0.133 (Ts=30s)', ...
    'LabelOrientation', 'horizontal', ...
    'LabelVerticalAlignment', 'bottom', ...
    'Color','r','LineWidth',1.5);

legend('Root Locus','ζ = 0.5 line','Settling Time Bound','Location','Best');

%% Show chosen Kp on root locus
K_target = 0.00251;                         % chosen proportional gain
poles_target = rlocus(G, K_target);       % closed-loop poles for this gain
plot(real(poles_target), imag(poles_target), 'mo', ...
    'MarkerFaceColor','m','MarkerSize',10);
text(real(poles_target(1))+0.01, imag(poles_target(1))+0.01, ...
     sprintf('K=%.4f', K_target), 'Color','m','FontWeight','bold');

%% Closed-loop system with chosen Kp
Gcl = feedback(K_target*G, 1);

%% Step response check
figure;
step(2.5*Gcl, 60);   % step of 2.5 (voltage step)
grid on;
title(sprintf('Closed-Loop Step Response (Kp = %.4f)', K_target));

% Extract step response characteristics (2% settling)
info2 = stepinfo(2.5*Gcl);
fprintf('Step Response (2%% band):\n');
fprintf('  Settling Time: %.2f s\n', info2.SettlingTime);
fprintf('  Overshoot: %.2f %%\n', info2.Overshoot);

% Extract step response characteristics (5% settling)
info5 = stepinfo(2.5*Gcl,'SettlingTimeThreshold',0.05);
fprintf('Step Response (5%% band):\n');
fprintf('  Settling Time: %.2f s\n', info5.SettlingTime);
fprintf('  Overshoot: %.2f %%\n', info5.Overshoot);

%% Sweep Kp and record settling times and overshoot
Kvec = linspace(0.0005,0.02,100);  % adjust range if needed
Ts2 = zeros(size(Kvec)); Ts5 = zeros(size(Kvec)); OS = zeros(size(Kvec));
for i = 1:length(Kvec)
    sys_cl = feedback(Kvec(i)*G, 1);
    info2i = stepinfo(sys_cl,'SettlingTimeThreshold',0.02);
    info5i = stepinfo(sys_cl,'SettlingTimeThreshold',0.05);
    Ts2(i) = info2i.SettlingTime;
    Ts5(i) = info5i.SettlingTime;
    OS(i)  = info2i.Overshoot;
    % Handle possible instability
    if isempty(Ts2(i)), Ts2(i)=NaN; end
    if isempty(Ts5(i)), Ts5(i)=NaN; end
end

%% Plot effect of Kp on settling time and overshoot
figure;
yyaxis left
plot(Kvec, Ts2, '-','LineWidth',1.2); hold on;
plot(Kvec, Ts5, '--','LineWidth',1.2);
ylabel('Settling Time (s)')
yyaxis right
plot(Kvec, OS, ':','LineWidth',1.2);
ylabel('Overshoot (%)')
xlabel('Proportional Gain K_p')
legend('T_s (2%)','T_s (5%)','Overshoot','Location','Best');
grid on;
title('Effect of K_p on Settling Time and Overshoot');

%% Optional: Overlay vertical line for K_target
xline(K_target, '--m', sprintf('Chosen K_p = %.4f', K_target),'LabelOrientation','horizontal','LineWidth',1.5);

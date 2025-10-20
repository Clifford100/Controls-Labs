%% Root Locus Design for Kitticopter P-Controller
clc; clear; close all;

% Plant transfer function: G(s) = 15.04 / (s(7.3s+1))
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

% Settling time spec: Ts < 30 s => σ > 4/Ts = 4/30 ≈ 0.133
sigma_req = 4/30;
xline(-sigma_req, '--r', 'Re = -0.133 (Ts=30s)', ...
    'LabelOrientation', 'horizontal', ...
    'LabelVerticalAlignment', 'bottom', ...
    'Color','r','LineWidth',1.5);

legend('Root Locus','ζ = 0.5 line','Settling Time Bound','Location','Best');

%% Always show the point for K=0.00251
K_target = 0.008;                         % chosen proportional gain
poles_target = rlocus(G, K_target);         % closed-loop poles for this gain

% Plot the poles on top of the locus
plot(real(poles_target), imag(poles_target), 'mo', ...
    'MarkerFaceColor','m','MarkerSize',10);
text(real(poles_target(1))+0.01, imag(poles_target(1))+0.01, ...
     sprintf('K=%.4f', K_target), 'Color','m','FontWeight','bold');

%% Optionally interactively pick desired pole location
% Uncomment to click on plot:
% disp('Click on the root locus near the desired intersection point...');
% [K, poles] = rlocfind(G);   % click on plot to choose pole
% fprintf('\nChosen proportional gain Kp = %.4f\n', K);
% disp('Closed-loop poles:');
% disp(poles);

%% Closed-loop system with chosen K
Gcl = feedback(K_target*G, 1);

%% Step response check
figure;
step(2.5*Gcl, 60);   % step of 2.5 (voltage step)
grid on;
title(sprintf('Closed-Loop Step Response (Kp = %.4f)', K_target));

% Extract step response characteristics
info = stepinfo(2.5*Gcl);
fprintf('Step Response Characteristics:\n');
fprintf('  Settling Time: %.2f s\n', info.SettlingTime);
fprintf('  Overshoot: %.2f %%\n', info.Overshoot);
fprintf('  Steady-State Value: %.3f\n', info.SettlingMin);

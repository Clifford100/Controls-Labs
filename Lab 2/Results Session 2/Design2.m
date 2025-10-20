num = 15.04;
den = [7.3 1 0];        % plant for position control (includes integrator)
G = tf(num, den);

figure;                 % open a fresh figure
rlocus(G);              % plot root locus
hold on;                % keep axis open

zeta_target = 0.527;    % damping ratio line
wn = 0.13;              % vertical line constraint

sgrid(zeta_target, wn); % overlay zeta and wn grid

% Optional: vertical line for settling-time spec
xline(-wn, '--r', 'Re = -0.13');
title('Root Locus with Design Constraints')
grid on

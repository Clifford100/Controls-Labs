% Kitticopter Transfer Function for Position Control
num = 15.04; 
den = [7.3 1 0]; % includes integrator
G = tf(num, den);

% Root locus plot
figure;
rlocus(G)
title('Root Locus of Kitticopter Open-Loop System')
grid on

% Highlight desired regions:
% Overshoot < 30% ⇒ damping ratio ζ > 0.35
% Settling time ~ 4τ < 30 s ⇒ Re(s) < -0.13
zeta = 0.527;        % damping ratio line
wn = 0.13;           % vertical line for settling time
sgrid(zeta, wn);     % overlays design constraints

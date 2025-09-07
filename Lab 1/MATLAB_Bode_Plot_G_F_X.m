% bode_comparison.m
% Bode plots for G(s), F(s), and X(s)

% Defining G(s)
numG = [6.91];
denG = [1 2.77 11.76];
G = tf(numG, denG);

% Defining F(s)
numF = [7.22];
denF = [1 2.91 12.25];
F = tf(numF, denF);

% Defining X(s)
numX = [7.08];
denX = [1 2.85 12.04];
X = tf(numX, denX);

% Plot all Bode plots together
figure;
bode(G, 'b', F, 'r--', X, 'g-.');
grid on;
legend('G(s)', 'F(s)', 'X(s)');
title('Bode Plots of G(s) = 6.91 / (s^2 + 2.77s + 11.76), F(s)= 7.22 / (s^2 + 2.91s + 12.25)  and X(s) = 7.08 / (s^2 + 2.85s + 12.04) ');

% Save the Bode plot as an image
saveas(gcf, 'Bode_Plot_G_F_X.png');  % Save as PNG

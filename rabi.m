% Collapse and Revival of Rabi Oscillations Simulation

% Parameters
N = 40;                  % Maximum photon number
alpha = 5;               % Coherent state amplitude
g = 0.001;                 % Coupling constant (atom-field interaction strength)
t = linspace(0,800,1000); % Time array (arbitrary units)

% Photon number states
n = 0:N;  % Photon numbers 0, 1, 2, ..., N
n_average=abs(alpha)^2;
% Coherent state photon distribution (Poisson distribution)
P_n = exp(-n_average) * ((n_average).^n) ./ factorial(n);

% Rabi frequency for each photon number
Rabi_freq = 2 * g * sqrt(n + 1);

% Initialize excited state population array
P_excited = zeros(size(t));

% Compute the time evolution of the excited state population
for k = 1:length(n)
    P_excited = P_excited + P_n(k) * sin(Rabi_freq(k) * t / 2).^2;
end

% Plotting the results
figure;
plot(t, P_excited, 'r--','LineWidth', 2);
xlabel('Time (arbitrary units)', 'FontSize', 14);
ylabel('Excited State Population', 'FontSize', 14);
title('Collapse and Revival of Rabi Oscillations', 'FontSize', 16);
grid on;

% Set plot limits and formatting
ylim([0 1]);
xlim([0 max(t)]);
set(gca, 'FontSize', 12);


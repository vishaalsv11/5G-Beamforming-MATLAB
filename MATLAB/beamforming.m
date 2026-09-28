clc;
clear;
close all;

%% 5G Beamforming and Beam Steering Simulation
% Uniform Linear Array (ULA)

% Number of antenna elements
N = 8;

% Operating frequency
f = 28e9;                 % 28 GHz - mmWave 5G

% Speed of light
c = 3e8;

% Wavelength
lambda = c/f;

% Antenna spacing
d = lambda/2;

% Angle range
theta = -90:0.1:90;

% Steering angles
steering_angles = [0 30 60];

%% Create figure
figure;
hold on;

for s = 1:length(steering_angles)

    steer = steering_angles(s);

    % Phase shift required for beam steering
    beta = -2*pi*d/lambda*sind(steer);

    % Array factor
    AF = zeros(size(theta));

    for n = 0:N-1
        AF = AF + exp(1j*n*(2*pi*d/lambda*sind(theta) + beta));
    end

    % Normalize
    AF = abs(AF);
    AF = AF/max(AF);

    % Convert to dB
    AF_dB = 20*log10(AF + eps);

    % Limit plot range
    AF_dB(AF_dB < -40) = -40;

    % Plot
    plot(theta, AF_dB, 'LineWidth', 1.5);

end

%% Plot formatting
grid on;
xlabel('Angle (degrees)');
ylabel('Normalized Array Factor (dB)');

title('5G Beamforming and Beam Steering');

legend('Steering Angle = 0°', ...
       'Steering Angle = 30°', ...
       'Steering Angle = 60°', ...
       'Location','southwest');

xlim([-90 90]);
ylim([-40 0]);

hold off;

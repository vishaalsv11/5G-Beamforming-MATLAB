clc;
clear;
close all;

%% Effect of Antenna Array Size on Beamforming

% Operating frequency
f = 28e9;                 % 28 GHz

% Speed of light
c = 3e8;

% Wavelength
lambda = c/f;

% Half-wavelength antenna spacing
d = lambda/2;

% Angle range
theta = -90:0.1:90;

% Steering angle
steering_angle = 30;

% Different numbers of antenna elements
N_values = [4 8 16];

%% Create figure
figure;
hold on;

for k = 1:length(N_values)

    N = N_values(k);

    % Phase shift for beam steering
    beta = -2*pi*d/lambda*sind(steering_angle);

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

    % Limit minimum value
    AF_dB(AF_dB < -40) = -40;

    % Plot
    plot(theta, AF_dB, 'LineWidth', 1.5);

end

%% Graph formatting
grid on;

xlabel('Angle (degrees)');
ylabel('Normalized Array Factor (dB)');

title('Effect of Antenna Array Size on 5G Beamforming');

legend('4 Elements', ...
       '8 Elements', ...
       '16 Elements', ...
       'Location','southwest');

xlim([-90 90]);
ylim([-40 0]);

hold off;

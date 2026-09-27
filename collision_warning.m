% Vehicle-to-Vehicle Collision Warning System
% MATLAB Simulation

clc;
clear;
close all;

% Simulation time
t = 0:0.1:10;

% Initial conditions
initialDistance = 100;   % meters
relativeSpeed = 8;       % m/s

% Calculate distance between vehicles
distance = initialDistance - relativeSpeed .* t;

% Warning threshold
warningDistance = 30;

% Collision threshold
collisionDistance = 10;

% Determine warning status
warningStatus = zeros(size(distance));

warningStatus(distance <= warningDistance) = 1;
warningStatus(distance <= collisionDistance) = 2;

% Display warning messages
for i = 1:length(t)

    if distance(i) <= collisionDistance
        fprintf('Time: %.1f s - DANGER! Collision risk!\n', t(i));

    elseif distance(i) <= warningDistance
        fprintf('Time: %.1f s - WARNING! Vehicle too close.\n', t(i));

    end

end

% Plot vehicle distance
figure;

plot(t, distance, 'LineWidth', 2);
hold on;

yline(warningDistance, '--', 'Warning Distance');
yline(collisionDistance, '--', 'Collision Threshold');

xlabel('Time (seconds)');
ylabel('Distance Between Vehicles (meters)');
title('Vehicle-to-Vehicle Collision Warning System');

grid on;
legend('Vehicle Distance', 'Warning Threshold', ...
       'Collision Threshold', 'Location', 'best');

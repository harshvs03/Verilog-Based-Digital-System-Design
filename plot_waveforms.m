% MATLAB waveform analysis for Verilog digital system
% Run the Verilog simulation first and export selected signals to CSV.

clear;
clc;
close all;

% Example exported waveform format:
% time, A, B, result, carry, done
filename = 'waveform_data.csv';

if ~isfile(filename)
    fprintf('waveform_data.csv not found.\n');
    fprintf('Export simulation signals to CSV and run this script again.\n');
    return;
end

data = readmatrix(filename);

time   = data(:,1);
A      = data(:,2);
B      = data(:,3);
result = data(:,4);
carry  = data(:,5);
done   = data(:,6);

figure;
plot(time, A, 'LineWidth', 1.5);
hold on;
plot(time, B, 'LineWidth', 1.5);
plot(time, result, 'LineWidth', 1.5);
grid on;
xlabel('Time');
ylabel('Value');
title('Digital System Data Signals');
legend('A','B','Result');

figure;
plot(time, carry, 'LineWidth', 1.5);
hold on;
plot(time, done, 'LineWidth', 1.5);
grid on;
xlabel('Time');
ylabel('Logic Level');
title('Control Signals');
legend('Carry','Done');

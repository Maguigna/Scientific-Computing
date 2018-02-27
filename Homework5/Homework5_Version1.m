% Homework 5
% Michael A. Guignard, PSID 1338371
clear all % Remove all the variables from workspace.
close all % Closes all figures.
clc       % Clears command window.
%% Creating Arrays of Random Numbers
sig = input('Number of decimal places: '); % Input of how many decimal places wanted.
N = input('Number of points: '); % Input of how many points to test.
d = sig + 1; % Adds one significant figure to the input of decimal places so that the correct decimal place is calculated.
Ns = single(N); % Converts N to be a single precision.
x = rand(N,1); % Creates double precision x array of N length.
y = rand(N,1); % Creates double precision y array of N length.
xs = single(rand(Ns,1)); % Creates single precision x array of N length.
ys = single(rand(Ns,1)); % Creates single precision y array of N length.
%% Link of Above Matrices to be Circle
xc = x-0.5; % Creates double precision x array that adjusts to be at center of circle.
yc = y-0.5; % Creates double precision y array that adjusts to be at center of circle.
xsc = xs-0.5; % Creates single precision x array that adjusts to be at center of circle.
ysc = ys-0.5; % Creates single precision y array that adjusts to be at center of circle.
r = xc.^2 + yc.^2; % Calculates double precision radius array.
rs = xsc.^2 + ysc.^2; % Calculates single precision radius array.
%% Calculation of PI
z = 0; % Initial count of values less than or equal to 0.25 as a double precision in the r matrix.
zs = 0; % Initial count of values less than or equal to 0.25 as a single precision in the rs matrix.
for i = 1:N
    if r(i) <= 0.25
        z = z + 1; % Adds to the amount count of values less than or equal to 0.25 as a double precision in the r matrix.
    end
end
for j = 1:Ns
    if rs(j) <= 0.25
        zs = zs + 1; % Adds to the amount count of values less than or equal to 0.25 as a single precision in the rs matrix.
    end
end
pi = vpa(4*z/N,d) % Calculates pi as a double precision and displays in command window.
pis = vpa(4*zs/Ns,d) % Calculates pi as a single precision and displays in command window.
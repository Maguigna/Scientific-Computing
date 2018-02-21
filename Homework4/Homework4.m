% Homework 4
% Michael A. Guignard, PSID 1338371
clear all % Remove all the variables from workspace.
close all % Closes all figures.
clc       % Clears command window.
%% Setting of Variables
k = 1; % Set value of k between 10 or 100.
L = 1; % Value of L.
u0 = 1; % Value of U0.
v = 1; % Value of v.
A = 1; % Value of A.
f = A; % Forces, f(x), are equal to the constant, A.
N = 100; % Set number of nodes.
h = L/(N+1); % Distance between nodes.
x = 0:1/N:L; % Sets interval of 0<=x<=L with N nodes.
%% Case 1: Tri-diagonal Algorithm: u0=1, uL=0
a = 1:N; % Creates matrix a of size N.
a(1) = -(2+(k^2)*(h^2)); % Designates what the first slot of matrix a is.
b = ones(1,N); % Creates matrix b of size N as all ones.
b(1) = 0; % Designates what the first slot of matrix b is.
c = ones(1,N); % Creates matrix c of size N as all ones.
c(N) = 0; % Designates what the last slot of matrix c is.
F = 1:N; % Creates matrix F of size N.
F(1) = (h^2)*f - u0; % Designates what the first slot of matrix F is.
for i = 2:N
    a(i) = a(1) - (b(i)/a(i-1))*c(i-1); % Fills in the rest of matrix a.
    F(i) = (h^2)*F(1) - (b(i)/a(i-1))*F(i-1); % Fills in the rest of matrix F.
end
u = 1:N; % Creates matrix u of size N.
u(1) = F(N)/a(N); % Designates the last slot of matrix u but puts it in first slot.
for j = 2:N
    u(j) = (F(N-1)-c(N-1)*u(j-1))/a(N-1); % Fills in the rest of matrix u.
end
u = flip(u); % Flips matrix u so that it is the correct order.
uexact_1 = (((sinh(k*(L-x))+sinh(k*x))/sinh(k*L))-1)*(A/(k^2)) + u0*(sinh(k*(L-x))/sinh(k*L)); % Exact solution for u(x) for case #1.
%% Case 2: Neumann Boundary Condition: du/dx at x=0 = v, uL=0.
d = 1:N; % Creates matrix d for the Neumann Boundary condition to work as matrix a does.
d(1) = a(1); % Designates first slot of matrix d.
e = ones(1,N); % Creates matrix e for the Neumann Boundary condition to work as matrix b does.
g = ones(1,N); % Creates matrix g for the Neumann Boundary condition to work as matrix c does.
for z = 1:N
    e(z) = -1; % Sets matrix e to be all -1.
    g(z) = 4; % Sets matrix g to be all 4.
end
e(1) = 0; % Designates the first slot of matrix e.
g(1) = 2; % Designates the first slot of matrix g.
g(N) = 0; % Designates the last slot of matrix g.
G = 1:N; % Creates matrix G for the Neumann Boundary condition to work as matrix F does.
G(1) = (h^2)*f + 2*h*v; % Designates the first slot of matrix G.
for y = 2:N
    d(y) = d(1) - (e(y)/d(y-1))*g(y-1); % Fills in the rest of matrix d.
    G(y) = 2*h*v - (e(y)/d(y-1))*G(y-1); % Fills in the rest of matrix G.
end
un = 1:N; % Creates matrix un for the Neumann Boundary condition to work as matrix u does.
un(1) = G(N)/d(N); % Designates the last slot of matrix un but puts it in first slot.
for w = 2:N
    un(w) = (G(N-1)-g(N-1)*un(w-1))/d(N-1); % Fills in the rest of matrix un.
end
un = flip(un); % Flips matrix un so that it is the correct order.
uexact_2 = ((cosh(k*x)/cosh(k*L)) - 1)*(A/(k^2)) - (v/k)*(sinh(k*(L-x))/cosh(k*L)); % Exact solution for u(x) for case #2.
%% Error Amount in Case 1.
error = abs((u(50)-uexact_1(50))/(uexact_1(50)))*100; % Calculates error between like positions, input u(x) and uexact_1(x) desired to be compared.
%% Error Amount in Case 2 is not calculated.

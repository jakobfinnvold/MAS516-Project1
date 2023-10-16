clear; close all; clc; 

beta = 1100;
n_mh = 0.91;
n_vm = 0.94;
rho = 875;
pilot_r = 3;
delta_ocv = 3e5;
v = 32; % Kinematic viscosity
mu = 30; % Dynamic viscosity
gamma = 0.82; % worm drive dynamic efficiency
Cd = 0.55;
D = 32; % cm3/rev
g = 9.81;
r = 0.034;
m_l = 400;
N = 20;
Re = 2300;

% Calculating max torque
TL_hold = m_l * g * r; % Load holding torque
TL_max = 8.3 * N; % From Motor Testbed in simscape

delta_motor_max_n = TL_max/(N*gamma) * (2*pi*n_mh)/D * 10; % negative load
delta_motor_max_p = TL_max/(N*gamma) * (2*pi)/(D*n_mh) * 10; % positive load




clear; close all; clc; 

M = readtable("Auto_Scopes.csv"); 
% Run 1
% Wire Position
t = [0:0.01:54.88]';
fWire = [t, M.fWirePosition(1925:7413, 1)]; 
plot(t, fWire); 
% Control Input Winch
fCtrlInput = [t, M.fWinch_ControlInput(1925:7413, 1)];

% Encoder Position
fEncoder = [t, M.fEncoderPosition(1925:7413, 1)];

% Supply Pressure
fSupply = [t, M.fSupplyPressure(1925:7413,1)];

% Return Pressure
fReturn = [t, M.fReturnPressure(1925:7413,1)];

% Piston Pressure
fPistonPressure = [t, M.fPistonPressure(1925:7413,1)];

% Rod Pressure
fRodPressure = [t, M.fRodPressure(1925:7413,1)];

% Motor Pressures + Flow
fWinchAPressure = [t, M.fWinch_A_Pressure(1925:7413,1)];
fWinchA1Pressure = [t, M.fWinch_A1_Pressure(1925:7413,1)];
fWinchBPressure = [t, M.fWinch_B_Pressure(1925:7413,1)];
fWinchB1Pressure = [t, M.fWinch_B1_Pressure(1925:7413,1)];
fWinchDrainPressure = [t, M.fWinchDrainPressure(1925:7413,1)]; 
fWinchFlow = [t, M.fWinchFlow(1925:7413,1)];

% Winch velocity and position Ref
fWinchVelRef = [t, M.fVelRefWinch(1925:7413,1)];
fWinchPosRef = [t, M.fPosRefWinch(1925:7413,1)]; 

%% Calculations of run 1

% At time = 22.9 winch is lowering the load:
Cd = 0.55;
rho = 875;

Q_winch= 4.639 * 10^-3/60; % m3/s
P_A1 = 11.2e5; % bar
P_A =7.6e5; % bar
P_B = 14.1605e5; % bar
P_B1 = 13.84319e5; % bar
P_s = 69.3e5; % bar
P_r = 0.576189e5; % bar
u_w = -0.08501; % [-]
wire_pos = 0.21; % meter

Ad_max = Q_winch/(Cd*u_w * sqrt(2*(P_s - P_B1)/rho)) * 10^6;
Ad_max1 = (4.9*10^-3/60)/(Cd*-0.084 * sqrt(2*(67.9e5 - 14.7e5)/rho)) * 10^6;
%% Run 2
clear; close all; clc; 

M = readtable("Auto_Scopes.csv"); 
% Wire Position
t = [0:0.01:39]';

fWire = [t, M.fWirePosition(7600:11500, 1)]; 
% Control Input Winch
fCtrlInput = [t, M.fWinch_ControlInput(7600:11500, 1)];

% Encoder Position
fEncoder = [t, M.fEncoderPosition(7600:11500, 1)];

% Supply Pressure
fSupply = [t, M.fSupplyPressure(7600:11500,1)];

% Return Pressure
fReturn = [t, M.fReturnPressure(7600:11500,1)];

% Piston Pressure
fPistonPressure = [t, M.fPistonPressure(7600:11500,1)];

% Rod Pressure
fRodPressure = [t, M.fRodPressure(7600:11500,1)];

% Motor Pressures + Flow
fWinchAPressure = [t, M.fWinch_A_Pressure(7600:11500,1)];
fWinchA1Pressure = [t, M.fWinch_A1_Pressure(7600:11500,1)];
fWinchBPressure = [t, M.fWinch_B_Pressure(7600:11500,1)];
fWinchB1Pressure = [t, M.fWinch_B1_Pressure(7600:11500,1)];
fWinchDrainPressure = [t, M.fWinchDrainPressure(7600:11500,1)]; 
fWinchFlow = [t, M.fWinchFlow(7600:11500,1)];
fPosRef = [t, M.fPosRefWinch(7600:11500, 1)];

% Winch velocity and position Ref
fWinchVelRef = [t, M.fVelRefWinch(7600:11500,1)];
fWinchPosRef = [t, M.fPosRefWinch(7600:11500,1)]; 

%%%% Calculations of run 2 %%%%

% At time = 5.3 winch is hoisting the load:
Cd = 0.55;
rho = 875;

Q_winch= 5.5 * 10^-3/60; % m3/s
P_A1 = 1.3e5; % bar/Pa
P_A = 4.7e5; % bar/Pa
P_B = 37.5e5; % bar/Pa
P_B1 = 38.4e5; % bar/Pa
P_s = 68.4e5; % bar/Pa
P_r = 0.58e5; % bar/Pa
u_w = 0.038; % [-]
wire_pos = 0.231; % meter

root = 2*(P_s*10^5 - P_B1*10^5)/rho
rott2 = 1/rho*(P_s - (P_A-P_A1) - (u_w/abs(u_w)*(P_B-P_A)));

Ad_max = Q_winch/(Cd*u_w * sqrt(rott2)) * 10^6;

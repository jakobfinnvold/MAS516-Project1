clear; close all; clc; 

M = readtable("Auto_Scopes.csv"); 


%% Run 1
% Wire Position
t = [0:0.01:54.88]';
fWire = [t, M.fWirePosition(1925:7413, 1)]; 
plot(fWire); 
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


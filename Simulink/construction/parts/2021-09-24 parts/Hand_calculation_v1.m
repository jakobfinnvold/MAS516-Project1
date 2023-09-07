close all;
clear all;
clc;

%% General constants

sigma_235 = 235;       %Yield strength of S235 in N/mm^2
E = 210000          %Youngs module in N/mm^2
%dimensions
l = 2.2;             %m
l_a = 1;             %m
l_b = 0.25;          %m
h = 1.9;             %m

%masses
m_motor = 9.5;      %kg
m_gear = 35;        %kg
m_winge =  20;      %estimated weight in kg
m_pu = m_gear + m_motor + m_winge; %weight of power unit in kg
m_payload = 400;    %kg
rho_b = 10.4;       %beam weight in kg/m
m_b = l*rho_b;      %beam weight in kg

%accelations
g = 9.81;           %m/s^2
acc_y = 1;          %estimated maximal y-acceleration of payload in m/(s^2)

%% Cut free diagram 1: IPE beam

%parameters of IPE120
W_beam = 53*1000;     %axial section modulus in mm^3
I_beam = 318 * 10e4     %second moment of inertia in mm^4
%source: http://www.soscoqatar.net/data/uploads/files/EuropeanIBeamIPE1.pdf

%applied forces (oszillation is neglected)
F1_stat_y = 9.81 * (m_payload+m_b);   %N
F1_dyn_y = m_payload*acc_y;           %N
F1_y = F1_dyn_y+F1_stat_y;            %N

%reaction forces and momentums in A and B
F_A_Y = F1_y/(1+l_a/(l-l_a));         %N
F_B_Y = F1_y-F_A_Y;                   %N
M_A = F1_y * l_a * (l - l_a)^2 / (l^2)%Nm
M_B = F1_y * (l-l_a)*(l_a)^2/(l^2);   %Nm
% momentum formula from https://engineeringlibrary.org/reference/beam-forces-moments-air-force-stress-manual

%stress, displacement and safety factor
sigma_A = (M_A*1000/W_beam);         %applied stress in N/mm^2
S_beam = sigma_235/sigma_A;           %safety factor
f = F1_y * (l*1000)^3/(48*E*I_beam);       %displacement in mm

%% Cut free diagram 2: vertical square tubes

%parameters of square tube 60x60x4
H = 60;
h = 52;
A_sqt = H^2 - h^2;
W_sqt = (H^4-h^4)/(6*H); %axial section modulus in mm^3

%applied forces (oszillation is neglected)
F_2 = m_pu * g; 

%Reaction forces and momentums in C
F_C_Y = F_A_Y + F_2; 
M_C = M_A - F_2 * l_b;

%stress and safety factor
sigma_C_bend = M_C*1000/W_sqt;      %[MPa] bending stress across the beam
sigma_C_press = F_C_Y / A_sqt;      %
S_sqt = sigma_235/sigma_C_bend;     %safety factor

% %% Cut free diagram 3a: Pulley forces
beta_min = 77;       %deg
beta_max = 82;       %deg
F1 = 4500;           %N

F1_x_min = cosd(beta_min)*F1;   %N
F1_x_max = cosd(beta_max)*F1;   %N
F1_y_min = sind(beta_min)*F1;   %N
F1_y_max = sind(beta_max)*F1;   %N

FW_x_min = F1_x_min;          %N
FW_x_max = F1_x_max;          %N
FW_y_min = F1_y_min + F1;     %N
FW_y_max = F1_y_max + F1;     %N

%%Cut free diagram 3b: Trolley momentum 
B2 = 160;
B3 = 165;
H1 = 242.5;
R = 23.5;

%Forces in x
Fc_min = FW_x_min;
Fc_max = FW_x_max;

%Forces in Y with same load on both rolls: 
FR_1_min = 0;
FR_1_max = 0;

disp('Cut free diagram 3')
%Momentums in A solved for B1
B1_min = (FR_1_min*B2-FW_x_min*(H-R)+Fc_min*(H1-R))/FW_y_min
B1_max = (FR_1_max*B2-FW_x_max*(H-R)+Fc_max*(H1-R))/FW_y_max
close all;
clear all;
clc;

%Constants-----------------------------

%% About this script:
%in a first review two point were identified as critical in the frame
%construction:
%The first is the IPE120 beam on top which is bend by the
%payload. 
%The second are the vertical square tubes which are challenged by the
%weight of the whole construction and might buckle. 

%% General constants

%masses
% m_power_unit = %73;
m_motor = 9.5;  %kg
m_gear = 35;    %kg
m_winge =  20;  %estimated weight in kg
m_power_unit = m_gear + m_motor + m_winge; %kg
m_payload = 400; %kg
g = 9.81; %m/s^2

%estimated accelarions
acc_y = 0.5 %estimated maximal y-acceleration in m/(s^2)
acc_x = 0.2 %estimated maximal x-acceleration in m/(s^2)

%% Calculation of the IPE120 beam: 
%beam parameters of IPE120
Wy_b = 53*1000;     %axial section modulus in mm^3
rho_b = 10.4;       %weight in kg/m
l = 2.2;          % beam length in m
l_a = 1             %estimated x-distance between leg of frame and payload when lifted 
m_b = l_b*rho_b;    %kg
%source: http://www.soscoqatar.net/data/uploads/files/EuropeanIBeamIPE1.pdf

%applied forces
F_stat_y = 9.81 * (m_payload+m_beam);   %N
F_dyn_y = m_payload*acc_y;              %N
%dynamic forces in x and due to oszillation are neglected

F_dyn_x = m_payload*acc_x;              %N

%Bending Momentum in fixture point A
M_A = (F_stat_y + F_dyn_y)*l_a*(l-l_a)^2/l^2    % Maximal momentum applied in fixing points in Nm

% formula from https://engineeringlibrary.org/reference/beam-forces-moments-air-force-stress-manual
%both ends of the beam are fixed in all DOFs (welds)
% %beam parameters
% b_b = 100; %thickness [mm]
% h_b = 120; %height [mm]
% t1_b = 6; %thickness of center plate [mm]
% t2_b = 8; %thickness of top/bottom plate [mm]



%frame dimensions


%Leg parameters
a_L = 150; %[mm] %length of one side
b_L = 150; %[mm] %length of other side
t_L = 15; %[mm] %thickness of leg


%Forces--------------------------------

%forces payload & motor
F_p = m_payload * g;
F_m = m_motor * g;


F_Bx = -(F_m*l_m)/h_b; %[N]
F_Ax = F_Bx; %[N]
F_Cy = F_p * 1/2; %[N]
F_By = F_p - F_Cy; %[N]
F_Cx = F_Bx; %[N]
F_Dy = F_Cy; %[N]
F_Ay = F_By + F_m; %[N]
F_Dx = F_Cx; %[N]

%Moment-----------------------------------

%inertia
I = 1/12 * b_b*h_b^3 - 1/12 * (b_b-t1_b)*(h_b-2*t2_b)^3; %[mm^4]


%Moment
M = g * m_payload * l_b*1e3/2; %[Nmm]

y = h_b/2; %[mm]

%Bending
sigma_b = (M*y)/I; %[MPa] bending stress across the beam

%crossbream area of leg
A_L = a_L*b_L - (a_L-2*t_L) * (b_L-2*t_L);

%stress
sigma_L = F_By/A_L; %[MPa] stress down the left leg
sigma_R = F_Cy/A_L; %[MPa] stress down the right leg
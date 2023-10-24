clear; close all; clc; 
%Load Parameters
m_pl = 1000;
r_d = 0.035;
ig = 5; 
J_drum = 0.0006125; % 1/2MR^2
b_hat = 0.001;

% Motor Parameters
np=2;
P_N = 15000;
n_eff = 0.917;
n_rpm = 1469;
pf = 0.84;
I_N = 29;
Is_In = 8;
T_n = 97.5;
Ti_Tn = 3.1;
Tb_Tn = 3.6;
J_motor = 0.13; 

% Inv-Gamma Circuit parameters

R_R_hat = 0.2052;
X_M_opt = 15.1061;
X_sig_opt = 0.3774;
omega_rN = 307.6666;
omega_N = 314.1593;
omega1 = omega_rN;
L_M_hat = X_M_opt/omega1;
L_sig_hat = X_sig_opt/omega1; 
R_s = 0.619;


psi_ref = 20*P_N/(sqrt(2)*pi*np*I_N*n_rpm); 

% Others
V_base = 400*sqrt(2)/sqrt(3);
I_max = I_N*3;

% Speed Controller
t_r = 1e-3;
w_BW = log(9)/t_r;
w_BWs = 0.1*w_BW;
J_hat = m_pl*((r_d/(ig))^2) + J_drum*((1/ig)^2) + J_motor; 
kps = 2*J_hat*w_BWs/(3*np^2*psi_ref);
kis = w_BWs^2*2*J_hat/(3*np^2*psi_ref);
Ba = 2*J_hat/(3*np^2*psi_ref)*(w_BWs-b_hat/J_hat);

% Current Controller
kp = w_BW*L_sig_hat;
ki = w_BW^2*L_sig_hat;
Ra = w_BW*L_sig_hat - (R_R_hat + R_s);
R = R_R_hat + R_s;
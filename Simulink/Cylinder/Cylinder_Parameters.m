clear; close all; clc;

M = readtable("Cylinder_Measurements.csv"); 

ctrl_input = M.fCylinder_ControlInput(3880:6575, 1);

rod_pressure = M.fRodPressure(3880:6575, 1);

piston_pressure = M.fPistonPressure(3880:6575, 1);

cyl_pos = M.fCylPosition(3880:6575, 1);

cyl_v_ref = M.fVelRefCyl(3880:6575, 1);
cyl_p_ref = M.fPosRefCyl(3880:6575, 1); 

v = cyl_v_ref(1:982, 1);
t = 0:0.01:26.95;

delta_p = (rod_pressure - piston_pressure) * -1;

figure
plot(t, delta_p);

figure
plot(t, rod_pressure);

figure
plot(t, piston_pressure);

figure 
plot(t, ctrl_input);

figure
plot(t, cyl_pos);


% Preload force on the cylinder
p_rod = 6.25e5;
p_piston = 0.5e5;

piston_area = 0.0033183;
rod_area = 0.0009621;

F_preload = p_rod*rod_area - p_piston*piston_area; 

% 
F = piston_pressure*10^5*piston_area - rod_pressure*10^5*rod_area; 
figure
plot(t, F);

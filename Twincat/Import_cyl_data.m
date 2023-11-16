clear; close all; clc;

M = readtable("Cylinder_Measurements.csv"); 

ctrl_input = M.fCylinder_ControlInput(3000:6575, 1);

rod_pressure = M.fRodPressure(3000:6575, 1)*-1;

piston_pressure = M.fPistonPressure(3000:6575, 1)*-1;

cyl_pos = M.fCylPosition(3000:6575); 





t = [0:0.01:35.75]';

cylinder_position = [t, cyl_pos];
rod_p = [t, rod_pressure];
bore_p = [t, piston_pressure];
controller = [t, ctrl_input]; 

pos_ref = M.fPosRefCyl(3000:6575); 

pos_error = pos_ref - cyl_pos;
% Cylinder force
A_bore = 0.0033183; %m^2
A_rod = 0.0009621; %m^2

Fc = piston_pressure*10^5*A_bore - rod_pressure*10^5*A_rod;
F_cylinder = [t, Fc]; 

% plot
figure
plot(t, pos_error); 
grid on
figure
plot(t, pos_ref);
hold on
grid on
plot(t, cyl_pos);



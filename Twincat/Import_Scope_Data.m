clear; close all; clc; 

M = readtable("Auto_Scopes.csv"); 

M.fWirePosition(17:12117, 1); 

Start = M.fWirePosition(1902:7413, 1); 
 
plot(Start); 

figure
plot(M.fWinch_ControlInput(1902:7413, 1));
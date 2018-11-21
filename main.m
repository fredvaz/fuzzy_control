clear all
close all
clc

format short 

%--------------------------------------------------------------------------
%
%             Fuzzy Control System for a Liquid Level System
%
%--------------------------------------------------------------------------
% Author: Frederico Vaz
% email: fredvaz8@gmail.com
% November 2018; Last revision: 09-November-2018
%--------------------------------------------------------------------------
%
% Description:
%
%--------------------------------------------------------------------------
%
% References:
%
%--------------------------------------------------------------------------

disp('___________________________________________________________________')
disp(' ')

%%                          System Plant Parameters 
disp('System Plant Parameters loading...')
disp(' ') 

global A1 A2 a1 a2 b1 b2 g rho km H1max H2max vmax     

% Cross-sectional areas of the tanks [m2]
A1 = pi * 1^2;
A2 = pi * 2^2;

% Cross-sectional areas of the output orifices of the tanks [m2]
a1 = pi * 0.15^2; % [m2]
a2 = pi * 0.2^2; % [m2]

% Cross-sectional areas of the input pipes to the tanks [m2]
b1 = pi * 0.15^2;
b2 = pi * 0.2^2;

% Gravitational constant [m/s2]
g = 9.81;

% Constant
rho = b1/(b1 + b2);

% Motor constant
km = 2.5;

% Maximum height of the tanks
H1max = 10; 
H2max = 20; 

% Maximum voltage of the motor
vmax = 10;


%%                          Initial Conditions 
disp('System Initial Condition loading...')
disp(' ')

% Initial Level of the tanks
H1 = 5; 
H2 = 10; 

% Initial applied voltage to the motor
Vp = 0;


%%                             Simulation 
disp('Simulation execution...')
disp(' ')

% Time Fuctions
coder.extrinsic('tic');
coder.extrinsic('toc');

init_total = tic;

sim 'fuzzy_system.slx'

exec_time = toc(init_total);

disp('Simulation Done!')
disp(' ')
disp(['Execution Time = ', num2str(exec_time), 's'])

disp('___________________________________________________________________')


%%                              Results 

% Reference Signal
figure;
plot(Href);
title('Sinal de Referencia');
xlabel('Tempo (segundos)');
ylabel('Nivel de referencia (cm)');




%%                         Fuzzy Control Options 






































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

% Cross-sectional areas of the tanks [cm2]
A1 = 500;
A2 = 500;

% Cross-sectional areas of the output orifices of the tanks [cm2]
a1 = 25; 
a2 = 25;

% Cross-sectional areas of the input pipes to the tanks [cm2]
b1 = 25;
b2 = 25;

% Gravitational constant [cm/s2]
g = 980;

% Constant
rho = b1/(b1 + b2);

% Motor constant
km = 40000;

% Maximum height of the tanks [cm2]
H1max = 100; 
H2max = 100; 

% Maximum voltage of the motor [V]
vmax = 24;


%%                          Initial Conditions 
disp('System Initial Condition loading...')
disp(' ')

% Initial Level of the tanks
H1 = 80; 
H2 = 40; 

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


%%                              Fuzzy Sets 

% Gera Fuzzy sets de dV
k = 4;
x = -k:1/100:k;

[ dVp_LD, dVp_D, dVp_k, dVp_I, dVp_LI ] = get_fuzzy_dVp(x);

% Plot of dVp
figure;
plot( x, dVp_LD, x, dVp_D, x, dVp_k, x, dVp_I, x, dVp_LI );
grid on;
title('Fuzzy Set of dVp');
grid on;
legend('Decrementa Muito','Decrementa', 'Mantem', 'Incrementa', 'Incrementa Muito')


k = 100;
x = -k:1/100:k;

[ dVp_LD, dVp_D, dVp_k, dVp_I, dVp_LI ] = get_fuzzy_dH2(x);

% Plot of dVp
figure;
plot( x, dVp_LD, x, dVp_D, x, dVp_k, x, dVp_I, x, dVp_LI );
grid on;
title('Fuzzy Set of dH2');
legend('Decrementa Muito','Decrementa', 'Mantem', 'Incrementa', 'Incrementa Muito')



[ dVp_LD, dVp_D, dVp_k, dVp_I, dVp_LI ] = get_fuzzy_error(x);

% Plot of dVp
figure;
plot( x, dVp_LD, x, dVp_D, x, dVp_k, x, dVp_I, x, dVp_LI );
grid on;
title('Fuzzy Set of Error');
legend('Decrementa Muito','Decrementa', 'Mantem', 'Incrementa', 'Incrementa Muito')



%%                              Results 

figure;
plot(Href);
title('Sinal de Referencia');
xlabel('Tempo (segundos)');
ylabel('Nivel de referencia (cm)');





























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

global A1 A2 a1 a2 g rho km     

% Cross-sectional areas of the tanks [cm2]
A1 = 2000;
A2 = 2000;close all

% Cross-sectional areas of the output orifices of the tanks [cm2]
a1 = 500; 
a2 = 500;

% Cross-sectional areas of the input pipes to the tanks [cm2]
b1 = 500;
b2 = 500;

% Gravitational constant [cm/s2]
g = 980;

% Constant
rho = b1/(b1 + b2);

% Motor constant
km = 40000;

% Maximum height of the tanks [cm2]
H1max = 200; 
H2max = 200; 

% Maximum voltage of the motor [V]
Vmax = 12;

% Input Factor Scale
fin = 0.1; 

% Output Factor Scale
fout = 20.5;


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
k = 5;
x = -k:1/100:k;

[ p1, p2, p3, p4, p5 ] = get_fuzzy_dVp(x);

% Plot of dVp
fig = figure;
plot( x, p1, x, p2, x, p3, x, p4, x, p5 );
grid on;
title('Fuzzy Set of dVp');
grid on;
legend('Decrementa Muito','Decrementa', 'Mantem', 'Incrementa', 'Incrementa Muito')
axis([-5 5 0 1.4]);
saveas(fig,'../doc/img/Fuzzy_Set_of_dVp.pdf');


k = 100;
x = -k:1/100:k;

[ p1, p2, p3, p4, p5 ] = get_fuzzy_dH2(x);

% Plot of dVp
fig = figure;
plot( x, p1, x, p2, x, p3, x, p4, x, p5 );
grid on;
title('Fuzzy Set of dH2');
legend('Desce Muito', 'Desce', 'Lento', 'Sobe', 'Sobe Muito')
axis([-100 100 0 1.4]);
saveas(fig,'../doc/img/Fuzzy_Set_of_dH2.pdf');



[ p1, p2, p3, p4, p5 ] = get_fuzzy_error(x);

% Plot of dVp
fig = figure;
plot( x, p1, x, p2, x, p3, x, p4, x, p5 );
grid on;
title('Fuzzy Set of Error');
legend('Muito Negativo','Negativo', 'Perto', 'Positivo', 'Muito Positivo')
axis([-100 100 0 1.4]);
saveas(fig,'../doc/img/Fuzzy_Set_of_Error.pdf');



%%                              Results 

%% MID - Mamdani Minimo
% com Desdifusor Centro de Gravidade

fig = figure;
plot(Href,'r--')
hold on 
plot(Level_Tank2A, 'g')

grid on
legend('Href','MIN-CG')
title('Nível do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 60 40 80]);
saveas(fig,'../doc/img/MIN-CG-Nivel.pdf') 


fig = figure;
plot(CommandA,'b'); 
grid on;
title('Valor de tensão aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
axis([0 60 0 6])
saveas(fig,'../doc/img/MIN-CG-Comando.pdf') 



%% MID - Mamdani Minimo 
% com Desdifusor Media dos Centros

fig = figure;
plot(Href,'r--')
hold on 
plot(Level_Tank2B, 'g')

grid on
legend('Href','MIN-MC')
title('Nível do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 60 40 80]);
saveas(fig,'../doc/img/MIN-MC-Nivel.pdf') 


fig = figure;
plot(CommandB,'b'); 
grid on;
title('Valor de tensão aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
axis([0 60 0 6])
saveas(fig,'../doc/img/MIN-MC-Comando.pdf')



%% MID - Mamdani Produto 
% com Desdifusor Centro de Gravidade

fig = figure;
plot(Href,'r--')
hold on 
plot(Level_Tank2C,'g')

grid on
legend('Href','PROD-CG')
title('Nível do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 60 40 80]);
saveas(fig,'../doc/img/PROD-CG-Nivel.pdf') 


fig = figure;
plot(CommandC,'b'); 
grid on;
title('Valor de tensão aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
axis([0 60 0 6])
saveas(fig,'../doc/img/PROD-CG-Comando.pdf')



%% MID - Mamdani Produto 
% com Desdifusor Media dos centros

fig = figure;
plot(Href,'r--')
hold on 
plot(Level_Tank2D,'g')

grid on
legend('Href','PROD-MC')
title('Nível do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 30 40 80])
saveas(fig,'../doc/img/PROD-MC-Nivel.pdf') 


fig = figure;
plot(CommandD,'b'); 
grid on;
title('Valor de tensão aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
axis([0 60 0 6])
saveas(fig,'../doc/img/PROD-MC-Comando.pdf')


%% TODOS NO MESMO GRÁFICO

fig = figure;

plot(Href,'r--')
hold on
plot(Level_Tank2A, 'b')
plot(Level_Tank2B, 'g')
plot(Level_Tank2C, 'k')
plot(Level_Tank2D, 'y')


grid on;
legend('Href','MIN-CG','MIN-MC','PROD-CG','PROD-MC')
title('Nível do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 60 40 80])
saveas(fig,'../doc/img/Level_Tudo.pdf')



fig = figure;

plot(CommandA, 'b')
hold on
plot(CommandB, 'g')
plot(CommandC, 'k')
plot(CommandD, 'y')

grid on;
legend('MIN-CG','MIN-MC','PROD-CG','PROD-MC')
grid on;
title('Valor de tensão aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
axis([0 60 0 6])
saveas(fig,'../doc/img/Command_Tudo.pdf')



%% PERTUBAÇÕES 

%% STEP
fig = figure;

plot(Href,'r--')
hold on
plot(Level_Tank2A, 'b')
plot(Level_Tank2B, 'g')
plot(Level_Tank2C, 'k')
plot(Level_Tank2D, 'y')


grid on;
legend('Href','MIN-CG','MIN-MC','PROD-CG','PROD-MC')
title('Nível do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 60 40 80])
saveas(fig,'../doc/img/Level_Tudo_Pertub_Step.pdf')



fig = figure;

plot(CommandA, 'b')
hold on
plot(CommandB, 'g')
plot(CommandC, 'k')
plot(CommandD, 'y')

grid on;
legend('Href','MIN-CG','MIN-MC','PROD-CG','PROD-MC')
grid on;
title('Valor de tensão aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
axis([0 60 0 6])
saveas(fig,'../doc/img/Command_Tudo_Pertub_Step.pdf')


%% RAMP
fig = figure;

plot(Href,'r--')
hold on
plot(Level_Tank2A, 'b')
plot(Level_Tank2B, 'g')
plot(Level_Tank2C, 'k')
plot(Level_Tank2D, 'y')


grid on;
legend('Href','MIN-CG','MIN-MC','PROD-CG','PROD-MC')
title('Nível do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 120 40 90]);
saveas(fig,'../doc/img/Level_Tudo_Pertub_Ramp.pdf')



fig = figure;

plot(CommandA, 'b')
hold on
plot(CommandB, 'g')
plot(CommandC, 'k')
plot(CommandD, 'y')

grid on;
legend('Href','MIN-CG','MIN-MC','PROD-CG','PROD-MC')
grid on;
title('Valor de tensão aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
axis([0 120 0 6])
saveas(fig,'../doc/img/Command_Tudo_Pertub_Ramp.pdf')


%% REFERENCE VARIABLE

fig = figure;

plot(Href,'r--')
hold on
plot(Level_Tank2A, 'b')
plot(Level_Tank2B, 'g')
plot(Level_Tank2C, 'k')
plot(Level_Tank2D, 'y')


grid on;
legend('Href','MIN-CG','MIN-MC','PROD-CG','PROD-MC')
title('Nível do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 120 40 90]);
saveas(fig,'../doc/img/Level_Tudo_Ref_Variable.pdf')



fig = figure;

plot(CommandA, 'b')
hold on
plot(CommandB, 'g')
plot(CommandC, 'k')
plot(CommandD, 'y')

grid on;
legend('Href','MIN-CG','MIN-MC','PROD-CG','PROD-MC')
grid on;
title('Valor de tensão aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
axis([0 60 0 6])
saveas(fig,'../doc/img/Command_Tudo_Ref_Variable.pdf')


















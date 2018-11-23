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
A2 = 2000;

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
fout = 10;


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
saveas(fig,'../doc/img/Fuzzy_Set_of_dVp.png');


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
saveas(fig,'../doc/img/Fuzzy_Set_of_dH2.png');



[ p1, p2, p3, p4, p5 ] = get_fuzzy_error(x);

% Plot of dVp
fig = figure;
plot( x, p1, x, p2, x, p3, x, p4, x, p5 );
grid on;
title('Fuzzy Set of Error');
legend('Muito Abaixo','Abaixo', 'Perto', 'Acima', 'Muito Acima')
axis([-100 100 0 1.4]);
saveas(fig,'../doc/img/Fuzzy_Set_of_Error.png');

close all

%%                              Results 

%% MID - Mamdani Minimo
% com Desdifusor Centro de Gravidade

fig = figure;
plot(Level_Tank2A)
hold on 
plot(Href,'r--')

grid on
legend('Href','MIN-CG')
title('N�vel do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 30 40 75]);
saveas(fig,'../doc/img/MIN-CG-Nivel.png') 


fig = figure;
plot(CommandA); 
grid on;
title('Valor de tens�o aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tens�o (V)')
saveas(fig,'../doc/img/MIN-CG-Comando.png') 



%% MID - Mamdani Minimo 
% com Desdifusor Media dos Centros

fig = figure;
plot(Level_Tank2B)
hold on 
plot(Href,'r--')

grid on
legend('Href','MIN-MC')
title('N�vel do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 30 40 75]);
saveas(fig,'../doc/img/MIN-MC-Nivel.png') 


fig = figure;
plot(CommandB); 
grid on;
title('Valor de tens�o aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tens�o (V)')
saveas(fig,'../doc/img/MIN-MC-Comando.png')



%% MID - Mamdani Produto 
% com Desdifusor Centro de Gravidade

fig = figure;
plot(Level_Tank2C)
hold on 
plot(Href,'r--')

grid on
legend('Href','PROD-CG')
title('N�vel do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 30 40 75]);
saveas(fig,'../doc/img/PROD-CG-Nivel.png') 


fig = figure;
plot(CommandC); 
grid on;
title('Valor de tens�o aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tens�o (V)')
saveas(fig,'../doc/img/PROD-CG-Comando.png')



%% MID - Mamdani Produto 
% com Desdifusor Media dos centros

fig = figure;
plot(Level_Tank2D)
hold on 
plot(Href,'r--')

grid on
legend('Href','PROD-MC')
title('N�vel do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 30 40 75]);
saveas(fig,'../doc/img/PROD-MC-Nivel.png') 


fig = figure;
plot(CommandD); 
grid on;
title('Valor de tens�o aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tens�o (V)')
saveas(fig,'../doc/img/PROD-MC-Comando.png')


%% TODOS NO MESMO GR�FICO

fig = figure;

plot(Href,'r--')
hold on
plot(Level_Tank2A, 'b')
plot(Level_Tank2B, 'g')
plot(Level_Tank2C, 'k')
plot(Level_Tank2D, 'y')


grid on;
legend('Href','MIN-CG','MIN-MC','PROD-CG','PROD-MC')
title('N�vel do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 60 40 80]);
saveas(fig,'../doc/img/Level_Tudo.png')



fig = figure;

plot(CommandA, 'b')
hold on
plot(CommandB, 'g')
plot(CommandC, 'k')
plot(CommandD, 'y')

grid on;
legend('Href','MIN-CG','MIN-MC','PROD-CG','PROD-MC')
grid on;
title('Valor de tens�o aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tens�o (V)')
saveas(fig,'../doc/img/Command_Tudo.png')



%% PERTUBA��ES 

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
title('N�vel do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 60 40 80]);
saveas(fig,'../doc/img/Level_Tudo_Pertub_Step.png')



fig = figure;

plot(CommandA, 'b')
hold on
plot(CommandB, 'g')
plot(CommandC, 'k')
plot(CommandD, 'y')

grid on;
legend('Href','MIN-CG','MIN-MC','PROD-CG','PROD-MC')
grid on;
title('Valor de tens�o aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tens�o (V)')
saveas(fig,'../doc/img/Command_Tudo_Pertub_Step.png')


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
title('N�vel do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 60 40 80]);
saveas(fig,'../doc/img/Level_Tudo_Pertub_Ramp.png')



fig = figure;

plot(CommandA, 'b')
hold on
plot(CommandB, 'g')
plot(CommandC, 'k')
plot(CommandD, 'y')

grid on;
legend('Href','MIN-CG','MIN-MC','PROD-CG','PROD-MC')
grid on;
title('Valor de tens�o aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tens�o (V)')
saveas(fig,'../doc/img/Command_Tudo_Pertub_Ramp.png')


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
title('N�vel do Fluido no Tanque 2')
xlabel('Tempo (s)')
ylabel('Altura (cm)')
axis([0 60 40 80]);
saveas(fig,'../doc/img/Level_Tudo_Ref_Variable.png')



fig = figure;

plot(CommandA, 'b')
hold on
plot(CommandB, 'g')
plot(CommandC, 'k')
plot(CommandD, 'y')

grid on;
legend('Href','MIN-CG','MIN-MC','PROD-CG','PROD-MC')
grid on;
title('Valor de tens�o aplicada na bomba')
xlabel('Tempo (s)')
ylabel('Tens�o (V)')
saveas(fig,'../doc/img/Command_Tudo_Ref_Variable.png')


















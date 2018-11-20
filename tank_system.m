
%% The dynamic equations of the liquid levels system:

function [ Ht1, Ht2 ] = tank_system(Vp, H1, H2) 

% f1 e f2, depois colocar pertubações no liquido como entrada

global A1 A2 a1 a2 g p km 


% Liquid level tank 1
Ht1 = (-a1/A1) * sqrt(2*g*H1) + ((p*km)/A1) * Vp;

% Liquid level tank 2
Ht2 = (-a2/A2) * sqrt(2*g*H2) + (a1/A2)*sqrt(2*g*H1) + (((1-p)*km)/A2) * Vp;


end 

% v2 = v2 + v;
% 
% % the minimum applied voltage
% if v2 < 0
%     v2 = 0;
% % the maximum applied voltage     
% elseif v2 > Vmax
%     v2 = Vmax;
% end
% 
% v1 = 0.7*v2;
% % % ^ver melhor esta parte!


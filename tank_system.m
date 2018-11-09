
%% The dynamic equations of the liquid levels system:

function [ ht1 ht2 v2 ] = tank_system(v, h1, h2, f1, f2)

v2 = v2 + v;

% the minimum applied voltage
if v2 < 0
    v2 = 0;
% the maximum applied voltage     
elseif v2 > Vmax
    v2 = Vmax;
end

v1 = 0.7*v2;

% Liquid level tank 1
H1 = (-a1/A1) * sqrt(2*g*H1) + () * Vp;

%ht1 = (-a1*sqrt(2*g*h1)-sgn(h1-h2)*a12*sqrt(2*g*abs(h1-h2))+K1*v1+f1)/A1;

% Liquid level tank 2
%ht2 = (-a2*sqrt(2*g*h2)+sgn(h1-h2)*a12*sqrt(2*g*abs(h1-h2))+K2*v2+f2)/A2;



end 


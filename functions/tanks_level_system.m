
%% The dynamic equations of the liquid levels system:

function [ output ] = tanks_level_system(input) 

    global A1 A2 a1 a2 g rho km H1max H2max 
    
    H1 = input(1); Vp = input(2); H2 = input(3);
    
    % Limit of Liquid level tank 1
    if(H1 <= 0)
        H1 = 0.000001;
    elseif H1 > H1max
        H1 = H1max;
    end
    
    % Limit of Liquid level tank 2
    if(H2 <= 0)
        H2 = 0.000001;
    elseif H2 > H2max
        H2 = H2max;
    end

    
    % Liquid level tank 1
    dH1 = (-a1/A1) * sqrt(2*g*H1) + ((rho*km)/A1) * Vp;

    % Liquid level tank 2
    dH2 = (-a2/A2) * sqrt(2*g*H2) + (a1/A2)*sqrt(2*g*H1) + (((1-rho)*km)/A2) * Vp;

    
    output = [ dH1 dH2 ];
    
end 


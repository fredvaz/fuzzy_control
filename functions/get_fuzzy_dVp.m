
function [ p1, p2, p3, p4, p5 ] = get_fuzzy_dVp(x)

p1 = zeros(1,length(x));
p2 = zeros(1,length(x));
p3 = zeros(1,length(x));
p4 = zeros(1,length(x));
p5 = zeros(1,length(x));

% Constante que define o tamanho do universo de discurso de saída
k = 4; 


%% Large Decrement
center = -0.5*k;                    % Center
upper = -0.25*k;                    % Upper
b = abs(center - upper);            % Center distance

for i = 1:length(x)
    
    if x(i) < center
        p1(i) = 1;
    elseif x(i) >= center && x(i) < upper
        p1(i) = 1 - abs(x(i) - center)/b;
    end

end


%% Decrement
center = -0.25*k;                   % Center
upper = 0*k;                        % Upper
lower = -0.5*k;                     % Lower
b = abs(center - upper);            % Center distance
 
for i = 1:length(x)
    
    if x(i) > lower && x(i) < upper
        p2(i) = 1 - abs(x(i) - center)/b;
    end

end

%% Keeps
center = 0*k;                       % Center
upper = 0.25*k;                     % Upper
lower = -0.25*k;                    % Lower
b = abs(center - upper);            % Center distance

for i = 1:length(x)
    
    if x(i) > lower && x(i) < upper
        p3(i) = 1 - abs(x(i)- center)/b;
    end

end


%% Increment
center = 0.25*k;                   % Center
upper = 0.5*k;                     % Upper
lower = 0*k;                       % Lower
b = abs(center - upper);           % Center distance

for i = 1:length(x)
    
    if x(i) > lower && x(i) < upper
        p4(i) = 1 - abs(x(i) - center)/b;
    end

end


%%  Large Increment
center = 0.5*k;                    % Center
lower = 0.25*k;                    % Lower
b = abs(center - lower);           % Center distance

for i = 1:length(x)
    
    if x(i) >= center
        p5(i) = 1;
    elseif x(i) < center && x(i) > lower
        p5(i) = 1 - abs(x(i) - center)/b;
    end

end


end

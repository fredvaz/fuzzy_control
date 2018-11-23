
function [ p1, p2, p3, p4, p5 ] = get_fuzzy_dH2(dH2)

p1 = zeros(1,length(dH2));
p2 = zeros(1,length(dH2));
p3 = zeros(1,length(dH2));
p4 = zeros(1,length(dH2));
p5 = zeros(1,length(dH2));


%% Down Fast
center = -50;                  % Center Limit
upper = -20;                   % Upper Limit
b = abs(center - upper);       % Center distance

for i = 1:length(dH2)

    if center < dH2(i) && dH2(i) < upper
        p1(i) = 1 - abs(dH2(i) - center)/b;
    elseif  dH2(i) <= center
        p1(i) = 1;
    end
    
end


%% Down
center = -25;                  % Center Limit
upper = -0;                    % Upper Limit
lower = -50;                   % Lower limit
b = abs(center - upper);       % Center distance

for i = 1:length(dH2)

    if  lower < dH2(i) && dH2(i) < upper
        p2(i) = 1 - abs(dH2(i) - center)/b;
    end
    
end


%% Slow
center = 0;                    % Center Limit
upper = 20;                    % Upper Limit
lower = -20;                   % Lower limit
b = abs(center - upper);       % Center distance

for i = 1:length(dH2)

    if  lower < dH2(i) && dH2(i) < upper
        p3(i) = 1 - abs(dH2(i) - center)/b;
    end
        
end


%% Up
center = 25;                  % Center Limit
upper = 50;                   % Upper Limit
lower = 0;                    % Lower limit
b = abs(center - upper);      % Center distance

for i = 1:length(dH2)

    if  lower <= dH2(i) && dH2(i) <= upper
        p4(i) = 1 - abs(dH2(i) - center)/b;
    end
        
end


%% Up Fast
center = 50;                  % Center Limit
lower = 20;                   % Lower limit
b = abs(center - lower);      % Center distance

for i = 1:length(dH2)

    if dH2(i) < center && dH2(i) > lower
        p5(i) = 1 - abs(dH2(i) - center)/b;
    elseif dH2(i) >= center
        p5(i) = 1;
    end
    
end


end


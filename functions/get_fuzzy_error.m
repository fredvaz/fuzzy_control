
function [ p1, p2, p3, p4, p5 ] = get_fuzzy_error(error)

p1 = zeros(1,length(error));
p2 = zeros(1,length(error));
p3 = zeros(1,length(error));
p4 = zeros(1,length(error));
p5 = zeros(1,length(error));


%% Much Higher 
center = -50;                  % Center Limit
upper = -20;                   % Upper Limit
b = abs(center - upper);       % Center distance

for i = 1:length(error)

    if center < error(i) && error(i) < upper
        p1(i) = 1 - abs(error(i) - center)/b;
    elseif  error(i) <= center
        p1(i) = 1;
    end
    
end


%% Higher 
center = -25;                  % Center Limit
upper = 0;                     % Upper Limit
lower = -50;                   % Lower limit
b = abs(center - upper);       % Center distance

for i = 1:length(error)

    if  lower <= error(i) && error(i) <= upper
        p2(i) = 1 - abs(error(i) - center)/b;
    end
    
end


%% Close 
center = 0;                    % Center Limit
upper = 20;                    % Upper Limit
lower = -20;                   % Lower limit
b = abs(center - upper);       % Center distance

for i = 1:length(error)

    if  lower < error(i) && error(i) < upper
        p3(i) = 1 - abs(error(i) - center)/b;
    end
    
end


%% Lower 
center = 25;                  % Center Limit
upper = 50;                   % Upper Limit
lower = 0;                    % Lower limit
b = abs(center - upper);      % Center distance

for i = 1:length(error)

    if  lower <= error(i) && error(i) <= upper
        p4(i) = 1 - abs(error(i) - center)/b;
    end
    
end

%% Much Lower
center = 50;                  % Center Limit
lower = 20;                    % Lower limit
b = abs(center - lower);      % Center distance

for i = 1:length(error)

    if error(i) < center && error(i) > lower
        p5(i) = 1 - abs(error(i) - center)/b;
    elseif error(i) >= center
        p5(i) = 1;
    end
    
end


end


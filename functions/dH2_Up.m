
function p = dH2_Up(dH2)
% Retorna o valor de perten?a para o conjunto difuso "Sobe"/"Positive
% Small", no universo de discurso de dh2

p = zeros(1,length(dH2));

%% Limits

center = 25;                  % Center Limit
upper = 50;                   % Upper Limit
lower = 0;                    % Lower limit
b = abs(center - upper);      % Center distance


for i = 1:length(dH2)

    if  lower <= dH2(i) && dH2(i) <= upper
        p(i) = 1 - abs(dH2(i) - center)/b;
    end
        
end
    
end
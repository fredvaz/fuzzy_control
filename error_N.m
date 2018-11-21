
function p = error_N(error)
% Retorna o valor de pertença para o conjunto difuso "Perto"/"Close"

p = zeros(1,length(error));

%% Limits

center = 0;                  % Center Limit
upper = 20;                    % Upper Limit
lower = -20;                   % Lower limit
b = abs(center - upper);       % Center distance


for i = 1:length(error)

    if  lower < error(i) && error(i) < upper
        p(i) = 1 - abs(error(i) - center)/b;
    end
    
end

function p = error_Higher(error)
% Retorna o valor de pertença para o conjunto difuso "Superior"/"Positive
% Small", no universo de discurso do Erro

p = zeros(1,length(error));

%% Limits

center = -25;                  % Center Limit
upper = -0;                    % Upper Limit
lower = -50;                   % Lower limit
b = abs(center - upper);       % Center distance


for i = 1:length(error)

    if  lower <= error(i) && error(i) <= upper
        p(i) = 1 - abs(error(i) - center)/b;
    end
    
end
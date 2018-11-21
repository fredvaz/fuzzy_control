
function p = error_L(error)
% Retorna o valor de pertença para o conjunto difuso "Inferior"/"Negative
% Small", no universo de discurso do Erro

p = zeros(1,length(error));

%% Limits

center = 25;                  % Center Limit
upper = 50;                   % Upper Limit
lower = 0;                    % Lower limit
b = abs(center - upper);      % Center distance


for i = 1:length(error)

    if  lower <= error(i) && error(i) <= upper
        p(i) = 1 - abs(error(i) - center)/b;
    end
    
end
    
end
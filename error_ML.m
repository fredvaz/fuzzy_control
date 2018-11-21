
function p = error_ML(error)
% Retorna o valor de pertença para o conjunto difuso "Muito Inferior"/"Negative
% Big", no universo de discurso do Erro

p = zeros(1,length(error));

%% Limits

center = 50;                  % Center Limit
lower = 20;                    % Lower limit
b = abs(center - lower);      % Center distance


for i = 1:length(error)

    if error(i) < center && error(i) > lower
         p(i) = 1 - abs(error(i) - center)/b;
    elseif error(i) >= center
        p(i) = 1;
    end
    
end

    
end
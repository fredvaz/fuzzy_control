
function p = error_MH(error)
% Retorna o valor de pertença para o conjunto difuso "Muito Superior"/"Positive
% Big", no universo de discurso do Erro

p = zeros(1,length(error));

%% Limits

center = -50;                  % Center Limit
upper = -20;                   % Upper Limit
b = abs(center - upper);       % Center distance


for i = 1:length(error)

    if center < error(i) && error(i) < upper
        p = 1 - abs(error(i) - center)/b;
    elseif  error(i) <= center
        p = 1;
    end
    
end
    
end
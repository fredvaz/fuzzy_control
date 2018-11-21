
function p = dH2_DF(dH2)
% Retorna o valor de pertença para o conjunto difuso "Muito Superior"/"Positive
% Big", no universo de discurso do Erro

p = zeros(1,length(dH2));

%% Limits

center = -50;                  % Center Limit
upper = -20;                   % Upper Limit
b = abs(center - upper);       % Center distance


for i = 1:length(dH2)

    if center < dH2(i) && dH2(i) < upper
        p = 1 - abs(dH2(i) - center)/b;
    elseif  dH2(i) <= center
        p = 1;
    end
    
end
    
end
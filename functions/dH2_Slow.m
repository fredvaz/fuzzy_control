
function p = dH2_Slow(dH2)
% Retorna o valor de perten?a para o conjunto difuso "Lento"/"Close", no
% universo de discurso de dh2

p = zeros(1,length(dH2));

%% Limits

center = 0;                    % Center Limit
upper = 20;                    % Upper Limit
lower = -20;                   % Lower limit
b = abs(center - upper);       % Center distance


for i = 1:length(dH2)

    if  lower < dH2(i) && dH2(i) < upper
        p(i) = 1 - abs(dH2(i) - center)/b;
    end
        
end

end
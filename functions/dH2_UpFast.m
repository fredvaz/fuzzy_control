
function p = dH2_UpFast(dH2)
% Retorna o valor de perten?a para o conjunto difuso "Sobe R?pido"/"Positive
% Big", no universo de discurso de dh2

p = zeros(1,length(dH2));

%% Limits

center = 50;                  % Center Limit
lower = 20;                   % Lower limit
b = abs(center - lower);      % Center distance


for i = 1:length(dH2)

    if dH2(i) < center && dH2(i) > lower
         p(i) = 1 - abs(dH2(i) - center)/b;
    elseif dH2(i) >= center
        p(i) = 1;
    end
    
end

end

function p = dH2_Down(dH2)
% Retorna o valor de pertença para o conjunto difuso "Desce"/"Negative
% Small", no universo de discurso de dh2

p = zeros(1,length(dH2));

%% Limits

center = -25;                  % Center Limit
upper = -0;                    % Upper Limit
lower = -50;                   % Lower limit
b = abs(center - upper);       % Center distance


for i = 1:length(error)

    if  lower < error(i) && error(i) < upper
        p(i) = 1 - abs(dH2(i) - center)/b;
    end
    
end


end
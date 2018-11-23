
function centers_i = find_center(U)

lines = size(U,1);
centers_i = zeros(1,lines);

for i = 1:lines
    
    u = U(i,:);
    max_u = max(u);
    
    sum = 0;      
    num = 0;    
    
    for j = 1:length(u)
        
        if u(j) == max_u
            
            num = num + 1;
            sum = sum + j;
            
        end
        
    end    

    centers_i(i) = round(sum/num);
    
end

end
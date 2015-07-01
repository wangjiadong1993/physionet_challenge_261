function dif_ann_bnn = search_delay_261(ann, bnn)
    
    dif_ann_bnn = zeros(1, length(bnn));
    
    for i = bnn
        
        temp = abs(ann - i);
        
        [~, id] = min(temp);
        
        dif_temp = i - ann(id);
        
        if dif_temp < 0
            if i < ann(1)
                [~, temp_a] = ismember(i, bnn);
                dif_ann_bnn(temp_a) = 0; 
            else
               [~, temp_a] = ismember(i, bnn);
            dif_ann_bnn(temp_a) = i - ann(id - 1); 
            end
        else %ann is less than bnn
            [~, temp_a] = ismember(i, bnn);
            dif_ann_bnn(temp_a) = i - ann(id);
        end
        
    end
%     return dif_ann_bnn;
end
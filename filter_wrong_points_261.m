function ann = filter_wrong_points_261(tm, ann, ann_dist)
    mean_v = mean(ann_dist);
    
    std_v = std(ann_dist);
    
    shorter_intervals = ann_dist <= mean_v - 3*std_v;
    
    while(1)
        [~, id] = ismember(1, shorter_intervals);
        if id == 0
            break;
        end
        
        a = ann_dist(id-1);
        b = ann_dist(id);
        c = ann_dist(id+1);
        
        
        if id ==1
            a  =  ann_dist(1);
            b  =  ann_dist(2);
            c  =  ann_dist(3);
            id = 2; 
        elseif id == length(ann_dist)
            b  =  a;
            c  =  b;
            a  =  ann_dist(id - 2 );
            id = id -1;
        else
        end
        
        
        lengths = test_the_wrong_point(a,b,c,mean_v, std_v*3);
        
%         if length(lengths) == 1
%         
%         elseif isempty(lengths)
%             disp('may be exception here, adding missing points 261')
%         else
%             lengths = lengths + ann(id -1 );
%             
%             lengths(end) = [];
%             
%             ann = [ann(1: id -1), lengths, ann(id: end)];
%         end
        



%         if ann_dist(id) > (mean_v - 3*std_v)*2
%             
%         end
        shorter_intervals(id) = 0;
        
    end
end

function y = test_the_wrong_point(len_a, len_b, len_c, mean_v, variation_v)
    
    length_v = len_a  + len_b + len_c;
    
    count_min = length_v/(mean_v + variation_v);
    
    count_max = length_v/(mean_v - variation_v);
%     
%     if round(count_min) == count_min
%         
%         y = zeros(1, round(count_min));
%         y = y + (mean_v + variation_v);
% %         return y;
%     
%     elseif round(count_max) == count_max
%         
%         y = zeros(1, round(count_max));
%         y = y + (mean_v - variation_v);
    
    if round(count_max) ~= round(count_min)
        
        dif_v  = abs(round(count_max) - round(count_min));
        
        if dif_v == 1
            length_temp  =  round(count_max);
            
            y = zeros(1, length_temp);
            
            y = y + (length_v/length_temp);
            
            
        else %if dif_v == 2
            
            array_temp = ceil(count_min):round(count_max);
            
            array_temp_dif = abs(array_temp - mean_v);
            
            [~, id] = min(array_temp_dif);
            
            length_temp = array_temp(id);
            
            y = zeros(1, length_temp);
            
            y = y + (length_v/length_temp);
            
%         else %>= 3
            
        end
    else
        length_temp = round(count_max);
        
        y = zeros(1, length_temp);
            
        length_most = mean_v + variation_v;
        
        y = y + length_most;
        
        y(end) = y(end) + (length_v - length_temp * length_most);
        
    end
    
end
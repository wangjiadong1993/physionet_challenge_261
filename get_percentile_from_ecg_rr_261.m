function y = get_percentile_from_ecg_rr_261(ann, interval)
    
    ann_back = ann;
    ann(end) = [];
    ann = ann_back - [0, ann];
    y = [prctile(ann,30), prctile(ann,70)].*interval;
    
    y = 1./y;
    
%     return the frequency interval
    y = [y(2), y(1)];
end
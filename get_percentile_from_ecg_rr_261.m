function y = get_percentile_from_ecg_rr_261(ann, interval, lower, upper)
    
    ann_back = ann;
    ann(end) = [];
    ann = ann_back - [0, ann];
    y = [prctile(ann,lower), prctile(ann,upper)].*interval;
    
    y = 1./y;
    
%     return the frequency interval
    y = [y(2), y(1)];
end
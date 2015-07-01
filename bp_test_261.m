function ann = bp_test_261(tm, bp, dir)
    
%     [endTime, dataStamp] = wfdbtime(dir, length(bp));
    
    wabp(dir,[],[],[],2);
    
    [ann]=rdann(dir,'wabp');
    
%     tm_high = zeros(1, length(tm));
    
%     tm_high(ann) = bp(ann);
    
%     subplot(1,1,1);
    
%     hold off;
%     
%     plot(tm(1:500), bp(1:500));
%     
%     hold on;
%     
%     stem(tm(1:500), tm_high(1:500), 'ro');
%     
%     hold off;
    
%     subplot(2,1,2)
    
end
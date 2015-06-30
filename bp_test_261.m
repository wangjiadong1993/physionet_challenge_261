function bp_test_261(tm, bp, dir, name)
    
    [endTime, dataStamp] = wfdbtime(dir, length(bp));
    
    wabp([dir,'/',name],[],endTime{1},[],2);
    
    [ann]=rdann(name,'wabp');
    
end
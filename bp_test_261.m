function bp_test_261(tm, bp, dir)
    [endTime, dataStamp] = wfdbtime(dir, length(bp));
    wabp(dir,[],endTime{1},[],2);
    [ann]=rdann(['101'],'wabp');
end
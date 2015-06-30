function y = main_func_jd(dir)
%     get the signal from local or remote database
    [tm, signal] = rdsamp(dir, []);
    
%     do the transpose
    tm = tm';
    signal = signal';
    
%     get the ecg signal
    ecg = signal(1, :);
    
%     ecg_filtering_total(ecg, tm, 'ecg_filtered_261');
    
    ann = qrs_detect_261('ecg_filtered_261')';
    
    bp = signal(2, :);
    
    percentiles = get_percentile_from_ecg_rr_261(ann, tm(2) - tm(1));
    
%     disp(percentiles);
    
%     plot(bp);
%     figure
    bp_filter_261(bp, [2, 4], 5, get_frequency_261(tm));
    
%     plot(bp);
%     subplot(2, 1, 1);
%     
%     plot(abs(fft(ecg)).^2);
%     
%     subplot(2,1,2);
%     
%     plot(abs(fft(ecg_filtered)).^2);
    
    
    
end

function ecg_filtering_total(ecg, tm, filename)
    frequency = get_frequency_261(tm);
    
    band = get_band_261([1, 40], frequency);
    
    ecg_filtered = filter_261(ecg, 5, band);
    
    save_ecg_filtered_to_wfdb_261(ecg_filtered, filename, frequency*2);
    
end

function plot_signal(signals, mode, layout, type)
    if mode == 'M' %Merge
        
    elseif mode == 'S' %Seperate
        
    else
    end
end

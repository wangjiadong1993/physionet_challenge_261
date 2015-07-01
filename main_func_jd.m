function y = main_func_jd(dir)
%     get the signal from local or remote database
    [tm, signal] = rdsamp(dir, []);
    
%     do the transpose
    tm = tm';
    
    signal = signal';
    
%     get the ecg signal
    ecg = signal(1, :);
    
%  !!!!!!   this line must be executed if no annotation file exists

    ecg_filtering_total(ecg, tm, 'ecg_filtered_261');
    
%     read the annotation file
    ann = qrs_detect_261('ecg_filtered_261')';
    
    ann_back = ann;
    
    ann_back(end) = [];
    
    ann_dist = ann - [0, ann_back];
    
    
    
%     read the bp 
    bp = signal(2, :);
    
%     get the 30 and 70 percentile
%     percentiles = get_percentile_from_ecg_rr_261(ann, tm(2) - tm(1), 1, 99);
% 
%     disp(percentiles)
    
%     bp_filter_261(bp, percentiles, 5, get_frequency_261(tm));
    
    

    
    %%%%%%%%%%%%%%%%%%PRINTING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    bnn = bp_test_261(tm, bp, dir)';
    
    bnn_back = bnn;
    
    bnn_back(end) = [];
    
    bnn_dist = bnn - [0, bnn_back];
    
    output = [mean(ann_dist), std(ann_dist), prctile(ann_dist,10),...
              prctile(ann_dist,90); mean(bnn_dist), std(bnn_dist),...
              prctile(bnn_dist,10),prctile(bnn_dist,90)];
    
    disp(output);
    
    
    
    
    
    
    
    
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

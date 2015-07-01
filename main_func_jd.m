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
    
    ann_original = ann;
    
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
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%     ann_first  = ann(1);
%     ann_last   = ann(end);
%     
%     bnn_first  = bnn(1);
%     bnn_last   = bnn(end);
    
    
    dif_array = search_delay_261(ann, bnn);
    
    disp([mean(dif_array), std(dif_array), min(dif_array), max(dif_array), length(dif_array)]);
    
    dif_array(dif_array == 0 ) = [];
    
    disp([mean(dif_array), std(dif_array), min(dif_array), max(dif_array), length(dif_array)]);
    
    mean_v = mean(dif_array);
    
    std_v = std(dif_array);
    
    dif_array(dif_array >= mean_v + 3*std_v) = [];
    
    dif_array(dif_array <= mean_v - 3*std_v) = [];
    
    disp([mean(dif_array), std(dif_array), min(dif_array), max(dif_array), length(dif_array)]);
    
    mean_v = mean(dif_array);
    
    std_v = std(dif_array);
    
    dif_array(dif_array >= mean_v + 3*std_v) = [];
    
    dif_array(dif_array <= mean_v - 3*std_v) = [];
    
    disp([mean(dif_array), std(dif_array), min(dif_array), max(dif_array), length(dif_array)]);
    
    
    delay_length = mean(dif_array);
    
    beats  = zeros(1, length(ann)+length(bnn));
    beats_length = 0;
    
    delta_width = 25;
    
    %%%%%%%%%%%%%filtering wrong ann%%%%%%%%%%%%%%%%%%
    for i = ann
        
%         temp_a = [i - delay_length, i + delay_length];
        
        temp_b = bnn(bnn <= i + delay_length + delta_width );
        
        temp_b = temp_b(temp_b >= i + delay_length - delta_width);
        
        if ~isempty(temp_b)
            beats(beats_length + 1) = i;
            beats_length = beats_length + 1;
        end
        
    end
    
    ann = beats(beats ~= 0);
    
%     disp(beats(beats ~= 0));
    
    ann_back = ann;
    
    ann_back(end) = [];
    
    ann_dist = ann - [0, ann_back];
    
    mean_v = mean(ann_dist);
    
    std_v = std(ann_dist);
    
    count_short = length(ann_dist(ann_dist <= mean_v - 3* std_v));
    
    count_longer = length(ann_dist(ann_dist >= mean_v + 3* std_v));
    
    if count_short == 0
        
        if  count_longer == 0 
            
        else
            adding_missed_points_261();
            disp('there is a missing point')
        end
    else
        filter_wrong_points_261();
        disp('there is a spurious point')
        if  count_longer == 0 
            
        else
            adding_missed_points_261();
            disp('there is a missing point')
        end
    end
    
    hold off;
    
    plot(tm, ecg);
    
    hold on;
    
    tm_high = zeros(1, length(tm));
    
    tm_high_2 = zeros(1, length(tm));
    
    tm_high_2(ann_original) = 2;
    
    tm_high(ann) = 1;
    
    stem(tm, tm_high, 'ro');
    
    stem(tm, tm_high_2, 'go');
    
    %%%%%%%%%%%%%%adding missing beats%%%%%%%%%%%%%%%%%%%%%%
    
%     for 
    
%     disp(dif_array);
    
    
    
%     A = histc(ann, bnn);
%     disp(A);
    
    
    
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

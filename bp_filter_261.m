function bp_filtered = bp_filter_261(signal, band, order, frequency)
    
    
%     this file is used to filter the bp signal return the filtered one.
%     
%     the signal parameter is the bp signal
%     
%     the band is the actual signal band for the bandpass filter
%     
%     the order (omitted)
%     
%     the frequency is the sampling frequency of the signal
    




%     get the normalized band for band pass filter
    band = get_band_261(band, frequency);
    
%     butter worth filter 
    [a,b] = butter(order , band);
    
%     filtering
    bp_filtered = filter(a,b, signal);
    
%     plotting
    subplot(4,1,1);
    plot(signal(1:5000));
    subplot(4,1,2);
    plot(bp_filtered(1:5000));
    subplot(4,1,3);
    fft_bp = abs(fft(signal(1:5000)));
    plot(fft_bp(5:1000));
    
    subplot(4,1,4);
    fft_bp_filtered = abs(fft(bp_filtered(1:5000)));
    plot(fft_bp_filtered(5:1000));
    
    
end
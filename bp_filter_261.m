function bp_filtered = bp_filter_261(signal, band, order, frequency)
    
    band = get_band_261(band, frequency);
    [a,b] = butter(order , band);
    bp_filtered = filter(a,b, signal);
    subplot(3,1,1);
    plot(signal(1:5000));
    subplot(3,1,2);
    plot(bp_filtered(1:5000));
    subplot(3,1,3);
    fft_bp = abs(fft(signal(1:5000)));
    plot(fft_bp(5:1000));
    
    
end
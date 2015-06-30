function y = get_band_261(x, frequency)
%     get the decimal band of a filter
%     frequency is the max signal frequency    
    y = x ./ frequency;
end
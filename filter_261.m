function ecg_filtered_array = filter_261(ecg_array, order, band)
   
   [heig, leng] = size(ecg_array);
   
   ecg_filtered_array = zeros(heig, leng);
   
   [a,b] = butter(order, band);
   
   for i = 1:heig
   
       ecg_filtered_array(i, :) = filter(a, b, ecg_array(i,:));
       
   end
   
end
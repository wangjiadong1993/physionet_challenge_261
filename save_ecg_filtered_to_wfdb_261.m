function save_ecg_filtered_to_wfdb_261(ecg_filtered, fname, frequency)
% [xbit]=mat2wfdb(X,fname,Fs,bit_res,adu,info,gain,sg_name,baseline,isint)
% Input Paramater are:
%  
%   X       -(required)  NxM matrix of M signals with N samples each. The
%                        signals can be of type double.The signals are assumed to be
%                        in physical units already and will be converted to
%                        ADU.
%   fname   -(required)  String where the the header (*.hea) and data (*.dat)
%            files will be saved (one single name for both, with no sufix).
%   Fs      -(Optional)  1x1 sampling frequency in Hz (all signals must have
%            been sampled at the same frquency). Default is 1 Hz.
%   bit_res -(Optional)  1xM (or Mx1):scalar determining the bit depth of the conversion for
%                        each signal.
%                        1x1 : If all the signals should have the same bit depth
%            Options are: 8,  16, and 32 ( all are signed types). 16 is the default.
%   adu     -(Optional)  Cell array of strings describing the physical units (default is 'V').
%            If only one string is entered all signals will have the same physical units.
%            If multiple physical units, the total units entered has to equal M (number of
%            channels). Units are delimited by '/'. See examples below.
%   info    -(Optional)  String that will be added to the comment section of the header file.
%   gain    -(Optional) Scalar, if provided, no automatic scaling will be applied before the
%            quantitzation of the signal. If a gain is passed,  in will be the same one set
%            on the header file. The signal will be scaled by this gain prior to the quantization
%            process. Use this options if you want to have a standard gain and quantization
%            process for all signals in a dataset (the function will not attempt to quantitized
%            individual waveforms based on their individual range and baseline).
%  baseline   -(Optional) Offset (ADC zero) Mx1 array of integers that represents the amplitude (sample
%             value) that would be observed if the analog signal present at the ADC inputs had a
%             level that fell exactly in the middle of the input range of the ADC.
%   sg_name -(Optional) Cell array of strings describing signal names.
%  
%   isint  -(Optional) Logical value (default=0). Use this option if you know
%             the signal is already quantitized, and you want to remove round-off
%             error by setting the original values to integers prior to fixed
%             point conversion.
%  
%   Ouput Parameters are:
%  
%   xbit    -(Optional)  NxM the quantitized signals that written to file (possible
%            rescaled if no gain was provided at input). Useful for comparing
%            and estimating quatitization error with the input double signal X
%            (see examples below).
%  
%  
%    NOTE: The signals can have different amplitudes, they will all be scaled to
%    a reference gain, with the scaling factor saved in the *.hea file.
 
    mat2wfdb(ecg_filtered', fname, frequency,[],'V');
end
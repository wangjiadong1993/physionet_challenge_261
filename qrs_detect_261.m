function y = qrs_detect_261(dir)
    gqrs(dir);
    y = rdann(dir, 'qrs');
end
function similarities = xcorrdiff(patch, strip)

corr = normxcorr2(patch, strip);
similarities = corr(length(patch(:, 1)), :);
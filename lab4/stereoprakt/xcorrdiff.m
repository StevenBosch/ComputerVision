function similarities = xcorrdiff(patch, strip)

corr = normxcorr2(patch, strip);
first = length(patch(1, :));
last = length(corr(1, :)) - length(patch(1,:)) + 1;
similarities = corr(length(patch(:, 1)), first:last);
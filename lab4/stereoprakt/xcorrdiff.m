function similarities = xcorrdiff(patch, strip)
corr = normxcorr2(patch, strip);

% Cut the first and last part of the correlation
first = length(patch(1, :));
last = length(corr(1, :)) - length(patch(1,:)) + 1;
similarities = corr(length(patch(:, 1)), first:last);
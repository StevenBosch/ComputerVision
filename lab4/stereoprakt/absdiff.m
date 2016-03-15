function similarities = absdiff(patch, strip)

diffs = zeros(length(strip(1,:)) - length(patch(1,:)) + 1, 1);

% move it over all positions in the strip the patch has to be compared with
for it1 = 1 : length(strip(1,:)) - (length(patch(1,:)) -1)
    
    % patch2 is the part of the strip overlapping with the patch
    patch2 = strip(:, it1:it1+length(patch(1,:))-1);
    
    % calculate difference
    diffs(it1) = sum(sum( abs(patch - patch2)));
end
similarities = -diffs;
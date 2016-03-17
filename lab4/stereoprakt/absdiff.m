function similarities = absdiff(patch, strip)

diffs = zeros(length(strip(1,:)) - length(patch(1,:)) + 1, 1);
win = gausswin(length(patch(:,1))) * gausswin(length(patch(1,:)))';
patch = im2double(patch) .* win; %remove if not gauss
strip = im2double(strip); %remove if not gauss

% move it over all positions in the strip the patch has to be compared with
for it1 = 1 : length(strip(1,:)) - (length(patch(1,:)) -1)
    
    % patch2 is the part of the strip overlapping with the patch
    patch2 = strip(:, it1:it1+length(patch(1,:))-1);
    %patch2 = patch2.*win; %remove if not gauss
    
    % calculate difference
    diffs(it1) = sum(sum( abs(patch - patch2)));
    
end
similarities = -diffs;
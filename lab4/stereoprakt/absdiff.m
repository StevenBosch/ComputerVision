function similarities = absdiff(patch, strip)

diffs = length(strip(1,:)) - length(patch(1,:)) + 1;

% move it over all positions in the strip the patch has to be compared with
for it2 = 0 : length(strip(1,:)) - length(patch(1,:))
    %take a collumn of the patch
    for it1 = 1:length(patch(1,:)) 
        % store the differences between the patch and the patch on the
        % strip
        diffs(it2+1) = sum( abs(patch(:,it1)-strip(:,it1+it2)) );
    end
end

similarities = -diffs;


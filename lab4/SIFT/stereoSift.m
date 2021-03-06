% Run Sift on both images

[im1, des1, loc1] = sift('tsuk1.pgm');
[im2, des2, loc2] = sift('tsuk2.pgm');

[num, matches] = match('tsuk1.pgm', 'tsuk2.pgm');

% Calculate the disparities for the matches that are have maximum of 2
% pixels difference in the y-direction and store the coordinates with it
% For all other matches, calculate the y-difference
disp = zeros(size(matches, 2), 5);
yDiff = zeros(size(matches, 1));
eqY = 0;

for i = 1: size(matches,2)
  if (matches(i) > 0)
    if (loc1(i,1) - loc2(matches(i),1) <= 0.5)
        disp(i, 1) = loc1(i,2) - loc2(matches(i),2);
        disp(i, 2) = loc1(i, 2);
        disp(i, 3) = loc1(i, 1);
        disp(i, 4) = loc2(matches(i), 2);
        disp(i, 5) = loc2(matches(i), 1);
    end
    if (loc1(i,1) - loc2(matches(i),1) == 0)
        eqY = eqY + 1;
    end
    yDiff(i) = loc1(i,1) - loc2(matches(i),1);
  end
end

maxY = max(yDiff(:));
disp(~any(disp,2), :) = [];

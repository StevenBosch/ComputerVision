function wvec = dirVector(data, f)
% This function calculates the direction vectors in the way that was
% already implemented in par_line.m
  n = 3; 

  m = size(data,1);
  if m<n; fprintf('M < 3 / error\n'); return; end
  
  a = zeros(m,n);
  a(:,1) = data(:,4) - data(:,2);
  a(:,2) = -(data(:,3) - data(:,1));
  a(:,3) = data(:,2) .* -a(:,2)  - data(:,1) .* a(:,1);

  [U,S,V] = svd(a);  % call matlab SVD routine
  v_min = V(:,n); % s and v are already sorted from largest to smallest
  if all(v_min < 0); v_min = -v_min; end % ?

  wvec = [v_min(1)/f v_min(2)/f v_min(3)];
  wvec = wvec / norm(wvec,2);
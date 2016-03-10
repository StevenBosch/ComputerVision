function myRectangle(file1, file2)
    % Read in the sets of parallel lines
    data1 = readfile(file1);
    data2 = readfile(file2);
    
    % Determine the vanishing points of the two sets of parallel lines
    vanishPoint1 = vanishPoint(data1);
    vanishPoint2 = vanishPoint(data2);
    
    % Calculate the camera constant f (see our report for an explanation)
    f = sqrt(-(vanishPoint1(1)*vanishPoint2(1) + vanishPoint1(2)*vanishPoint2(2)));
    
    fprintf('The camera constant f = %f\n', f);
    
    % Calculate the direction vectors using the provided code
    wvec1 = dirVector(data1, f);
    wvec2 = dirVector(data2, f);
    
    fprintf('The first direction vector: (%f %f %f)\n', wvec1);
    fprintf('The second direction vector: (%f %f %f)\n', wvec2);
    
    % Calculate the normal vector as the cross product of both of the
    % direction vectors
    normalVector = cross(wvec1, wvec2);
    
    fprintf('The normal of the planar patch is: (%f %f %f)\n', normalVector);

function data=readfile(file)
  f = fopen(file,'r');
  for i=1:4; fgets(f); end
  all = fscanf(f,'%f %f %f %f '); m = length(all)/4;
  data= reshape(all,4,m)';
  fclose(f);
function myRectangle(file1, file2)

    data1 = readfile(file1);
    data2 = readfile(file2);
    
    centerX = 366.339416;
    centerY = 254.974453;
    
    vanishPoints1 = vanishPoints(data1);
    vanishPoints2 = vanishPoints(data2);
    
    vanishPoint1 = median(vanishPoints1)
    vanishPoint2 = median(vanishPoints2)
    
    f = sqrt(-(vanishPoint1(1)*vanishPoint2(1) + vanishPoint1(2)*vanishPoint2(2)))
    
    

function data=readfile(file)
  f = fopen(file,'r');
  for i=1:4; fgets(f); end
  all = fscanf(f,'%f %f %f %f '); m = length(all)/4;
  data= reshape(all,4,m)';
  fclose(f);
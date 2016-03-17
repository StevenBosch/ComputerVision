gt = imread('tsukuba_gt.png');
I = depthmap(imread('tsuk1.pgm'), imread('tsuk2.pgm'), 15,15, @absdiff);
I2 = depthmap(imread('tsuk1.pgm'), imread('tsuk2.pgm'), 15,15, @xcorrdiff);

errorSift = 0;
errorAbs = 0;
errorCorr = 0;

for it = 1 : length(disp)
    x = int8(disp(it, 2));
    y = int8(disp(it, 3));
    errorSift = errorSift + abs(disp(it, 1) - gt(x, y));
    errorAbs = errorAbs + abs(I(x, y) - gt(x, y));
    errorCorr = errorCorr + abs(I2(x, y) - gt(x, y));
end
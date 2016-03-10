% Convert the images to grayscale images

tsuk1 = imread('tsukuba1.png');
tsukuba1Gray = rgb2gray(tsuk1);
imwrite(tsukuba1Gray, 'tsuk1.pgm', 'pgm');

tsuk2 = imread('tsukuba2.png');
tsukuba2Gray = rgb2gray(tsuk2);
imwrite(tsukuba2Gray, 'tsuk2.pgm', 'pgm');
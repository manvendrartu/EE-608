clc
tar_image = imread('under1.jpg');
src_image = imread('lena.jpg');

tar_hist = imhist(tar_image);
src_hist = imhist(src_image);

processed_image = histeq(src_image,tar_hist);

subplot(2,2,1);
imshow(src_image);
title('Original Image');

subplot(2,2,2);
imshow(tar_image);
title('Target Image');

subplot(2,2,3);
imshow(processed_image);
title('Processed Image');

figure;
subplot(2,2,1);
imhist(src_image);
title('Original Image Histogram');

subplot(2,2,2);
imhist(tar_image);
title('Target Image Histogram');

subplot(2,2,3);
imhist(processed_image);
title('Processed Image Histogram');
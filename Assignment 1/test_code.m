img = imread('lena.jpg');
quanta = 50;
img1 = double(img) / 64;
img1 = uint8(img1 * quanta);
img1 = double(img1) / quanta;


quanta = 50;
img3 = double(img) / 128;
img3 = uint8(img2 * quanta);
img3 = double(img2) / quanta;


quanta = 50;
img2 = double(img) / 128;
img2 = uint8(img2 * quanta);
img2 = double(img2) / quanta;


quanta = 50;
img2 = double(img) / 128;
img2 = uint8(img2 * quanta);
img2 = double(img2) / quanta;

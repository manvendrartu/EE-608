close all;
i=imread('lena.jpg');

se=strel('diamond', 10);

a=imdilate(i,se);
b=imerode(i,se);
c=imopen(i,se);
d=imclose(i,se);
subplot(2,2,1);
imshow(a);
subplot(2,2,2);
imshow(b);
subplot(2,2,3);
imshow(c);
subplot
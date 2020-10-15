clc;
clear;
close all;

                     
gamma = input('Enter Value of Gamma : ');
a = imread('lena.jpg');                           %Read the Image
%a = rgb2gray(a);                                        %converting to grayscale

b = size(a);                                            %Reading the size

r = linspace(0,1,256);                                  %Defining input pixels
d = round(255*(r.^gamma));                              %Gamma Transformation function



ep = zeros(b);
for i=1:b(1)                                        %loop tracing the rows of image
    for j=1:b(2)                                    %loop tracing thes columns of image
        t=(a(i,j)+1);                               %pixel values in image
        ep(i,j)=d(t);                               %Making the ouput image using the transformation function
    end                                             
end


%Plotting input image output image 

figure;
subplot(1,2,1);
imshow(a);
title('Original image');
subplot(1,2,2);
imshow(uint8(ep));
title('Gamma Transformed image');

figure;
plot(255*r,d);
title('Tranformation function');
xlabel('Input grayscale levels')
ylabel('Output grayscale levels')


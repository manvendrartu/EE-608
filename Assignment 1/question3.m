clc;
clear;
close all;
% Read the image 
a=imread('lena.jpg');

% Convert to grayscale incase it is color
%a = rgb2gray(a);

a = im2double(a);                                   %convert the range of colors from 0-255 to 0-1
b =size(a);                                         %Get size of image
                            
A = fft2(a);                                        %fourier transform of image
A1 = fftshift(A);                                   %shifting origin
A11 = abs(A1);                                      %Magnitude of A1 (Frequency domain representation of image)


hmin = input('Enter min horizontal : ');
hmax = input('Enter max horizontal : ');

vmin = input('Enter min vertical : ');
vmax = input('Enter max vertical : ');

d = ones(2*vmax,2*hmax);                            %low Pass filter with cutoff Hmax and vmax Max filter
d1 = ones(2*vmin,2*hmin);                           %low Pass filter with cutoff Hmin and vmin Min filter

%code for image with odd no. of rows and columns
if mod(b(1),2)~=0 && mod(b(2),2)~=0     
    %for max filter
    dmax1 = [zeros(2*vmax,ceil((b(2)/2)-hmax)) d zeros(2*vmax,ceil((b(2)/2)-hmax)-1)];    %padding zeros on left and right of filter to make it the size of the image
    dmax = [zeros(ceil((b(1)/2)-vmax),b(2));dmax1;zeros(ceil((b(1)/2)-vmax)-1,b(2))];     %padding zeros on up and down of filter to make it the size of the image
    %for min filter
    dmin1 = [zeros(2*vmin,ceil((b(2)/2)-hmin)) d1 zeros(2*vmin,ceil((b(2)/2)-hmin)-1)];
    dmin = [zeros(ceil((b(1)/2)-vmin),b(2));dmin1;zeros(ceil((b(1)/2)-vmin)-1,b(2))];
    
%code for image with even no. of rows and columns
elseif mod(b(1),2)==0 && mod(b(2),2)==0
    dmax1 = [zeros(2*vmax,floor((b(2)/2)-hmax)) d zeros(2*vmax,floor((b(2)/2)-hmax))];
    dmax = [zeros(floor((b(1)/2)-vmax),b(2));dmax1;zeros(floor((b(1)/2)-vmax),b(2))];
   
    dmin1 = [zeros(2*vmin,floor((b(2)/2)-hmin)) d1 zeros(2*vmin,floor((b(2)/2)-hmin))];
    dmin = [zeros(floor((b(1)/2)-vmin),b(2));dmin1;zeros(floor((b(1)/2)-vmin),b(2))];

%code for image with odd no. of rows and even no. of columns
elseif  mod(b(1),2)~=0 && mod(b(2),2)==0
    dmax1 = [zeros(2*vmax,ceil((b(2)/2)-hmax)) d zeros(2*vmax,ceil((b(2)/2)-hmax))];
    dmax = [zeros(floor((b(1)/2)-vmax)+1,b(2));dmax1;zeros(floor((b(1)/2)-vmax),b(2))];
    dmin1 = [zeros(2*vmin,ceil((b(2)/2)-hmin)) d1 zeros(2*vmin,ceil((b(2)/2)-hmin))];
    dmin = [zeros(floor((b(1)/2)-vmin)+1,b(2));dmin1;zeros(floor((b(1)/2)-vmin),b(2))];
    
%code for image with even no. of rows and odd no. of columns
else
    dmax1 = [zeros(2*vmax,ceil((b(2)/2)-hmax)) d zeros(2*vmax,ceil((b(2)/2)-hmax)-1)];
    dmax = [zeros(ceil((b(1)/2)-vmax),b(2));dmax1;zeros(ceil((b(1)/2)-vmax),b(2))];
    
    dmin1 = [zeros(2*vmin,ceil((b(2)/2)-hmin)) d1 zeros(2*vmin,ceil((b(2)/2)-hmin)-1)];
    dmin = [zeros(ceil((b(1)/2)-vmin),b(2));dmin1;zeros(ceil((b(1)/2)-vmin),b(2))];
    
end

filter = dmax-dmin;                             %creating a band pass filter using Max - Min
A2 = filter.*A1;                                %Multiplying filter with A1((Frequency domain representation of image))
A3 = (A1./abs(A1));                             %Getting the Phase only representation of image

B = fftshift(A2);                               %Reshifting the origin of filtered image
B1 = ifft2(B);                                  %Taking inverse fourier transform
B2 = abs(B1);                                     %Taking magnitude. (Band pass Filtered output image)

B11 = fftshift(A3);                             %Reshifting the origin of phase only image
B21 = ifft2(B11);                               %Taking inverse fourier transform
B31 = abs(B21);                                 %Taking magnitude.(Phase only image)

%plotting FFT FFTSHIFT Fitered output in frequency domain and Filtered image
subplot(2,2,1);
imshow(uint8(abs(A)));
title('FFT of image');
subplot(2,2,2);
imshow(uint8(A11));
title('Magnitude of Frequency domain representation of image');

subplot(2,2,3);
imshow(uint8(abs(A2)))
title('Filtered output in frequency domain');
subplot(2,2,4);
imshow((B2));
title('Filtered image');

%Plotting Original and phase only image
figure;
subplot(1,2,1);
imshow((100*B31));                                       %multiplying by 100 to increase the content as values are so small that are not visible
title('Phase only Image');
subplot(1,2,2);
imshow(a);
title('original Image');


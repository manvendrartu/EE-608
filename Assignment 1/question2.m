clc;
clear;
close;
% Read the image to be modified
a=imread('undertest.jpg');

% Convert to grayscale incase it is color
a = rgb2gray(a);
b=size(a);                                          %Reading size

% Loop for Getting the Histogram of the image
c=zeros(1,256);
for i=1:b(1)                                        %Reading the rows
    for j=1:b(2)                                    %reading the columns
        for k=0:255                                 %k is pointing the graylevel form 0 to 255
            if a(i,j)==k                            %getting the graylevel of the pixel a(i,j)
                c(k+1)=c(k+1)+1;                    %increasing the frequency of the gray level found at a(i,j)
            end
        end
    end
end

%Generating PDF out of histogram by diving by total no. of pixels
pdf=(1/(b(1)*b(2)))*c;

%Generating CDF out of PDF
cdf = zeros(1,256);
cdf(1)=pdf(1);
for i=2:256
    cdf(i)=cdf(i-1)+pdf(i);
end
cdf = round(255*cdf);
%Reading the other image which has the required histogram 
a1=imread('final.jpg');

%Repeating the above steps for this image
a1 = rgb2gray(a1);
b1=size(a1);
a1=double(a1);

c1=zeros(1,256);
for i1=1:b1(1)
    for j1=1:b1(2)
        for k1=0:255
            if a1(i1,j1)==k1
                c1(k1+1)=c1(k1+1)+1;
            end
        end
    end
end
pdf1=(1/(b1(1)*b1(2)))*c1;
cdf1 = zeros(1,256);
cdf1(1)=pdf1(1);
for i1=2:256
    cdf1(i1)=cdf1(i1-1)+pdf1(i1);
end

cdf1 = round(255*cdf1);
%Comparing the CDFs of the given and the required images
d = 255*ones(1,256);
for k=1:256
    for k1=1:256
    if cdf(k)<cdf1(k1)
        d(k)=k1;                                   %tranforming function d
        break
    end
    end
end

%Generating the final output of the given image
ep = zeros(b(1),b(2));
for i=1:b(1)
    for j=1:b(2)
        t=(a(i,j)+1);
        ep(i,j)=d(t);
    end
end

%generating Histogram of the output image
c2 = zeros(1,256);
for i1=1:b1(1)
    for j1=1:b1(2)
        for k1=0:255
            if ep(i1,j1)==k1
                c2(k1+1)=c2(k1+1)+1;
            end
        end
    end
end


%Plotting Given Image its histogram and Modified image and its Histogram
subplot(2,2,1);
imshow(uint8(a));
title('Original image');
subplot(2,2,2);
imshow(uint8(ep));
title('Modified image');
subplot(2,2,3);
plot(c);
title('histogram of original image');
subplot(2,2,4);
plot(c2);
title('histogram of modified image');

%Plotting Given Image and Modified image 
figure;
subplot(1,2,1);
imshow(uint8(a));
title('Original image');

subplot(1,2,2);
imshow(uint8(ep));
title('Modified image');

%Plotting Modified Image its histogram and Required image and its Histogram
figure;
subplot(2,2,1);
imshow(uint8(a1));
title('Image with required histogram');
subplot(2,2,2);
imshow(uint8(ep));
title('Modified image');
subplot(2,2,3);
plot(c1);
title('Required histogram');
subplot(2,2,4);
plot(c2);
title('histogram of modified image');
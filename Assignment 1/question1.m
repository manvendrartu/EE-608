clc
clear all
close all
I=rgb2gray(imread('test1.jpg'));

[m1,n1]=size(I);
temp=zeros(m1,n1/2);
count = 0;
for i = 1:m1
     count = 0;
     for j = 1:2:n1
         count=count+1;
         temp(i,count)=I(i,j);
     end
end
count1=0;

[r1,c1] = size(temp);
temp2 = zeros(r1/2,c1);
 for k = 1:c1
     count1 = 0;
     for l = 1:2:r1
         count1=count1+1;
         temp2(count1,k)=temp(l,k);
     end
 end
 
[m2,n2]=size(I);
temp3=zeros(m2,n2/4);
count = 0;
for i = 1:m2
     count = 0;
     for j = 1:4:n2
         count=count+1;
         temp3(i,count)=I(i,j);
     end
end
count1=0;

[r2,c2] = size(temp3);
temp4 = zeros(r2/4,c2);
 for k = 1:c2
     count1 = 0;
     for l = 1:4:r2
         count1=count1+1;
         temp4(count1,k)=temp3(l,k);
     end
 end
 
[m3,n3]=size(I);
temp5=zeros(m3,n3/8);
count = 0;
for i = 1:m3
     count = 0;
     for j = 1:8:n3
         count=count+1;
         temp5(i,count)=I(i,j);
     end
end
count1=0;

[r3,c3] = size(temp5);
temp6 = zeros(r3/8,c3);
 for k = 1:c3
     count1 = 0;
     for l = 1:8:r3
         count1=count1+1;
         temp6(count1,k)=temp5(l,k);
     end
 end
 
 
subplot(2,2,1),imshow(I),title('Original Image')
subplot(2,2,2),imshow(uint8(temp2)),title('Down sampled by 2')
subplot(2,2,3),imshow(uint8(temp4)),title('Down sampled by 4')
subplot(2,2,4),imshow(uint8(temp6)),title('Down sampled by 8')

b1=imquantize(I,16:16:255,[0:16:255]);
b2=imquantize(I,128,[0 255]);
b3=imquantize(I,8:32:255,[0:32:255 255]);
figure;
subplot(2,2,1),imshow(I),title('Original Image')
subplot(2,2,2),imshow(uint8(b1)),title('Quantized by 16 levels')
subplot(2,2,3),imshow(uint8(b2)),title('Quantized by 2 levels')
subplot(2,2,4),imshow(uint8(b3)),title('Quantized by 4 levels')

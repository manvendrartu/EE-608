clc; clear all;
colormap('gray');
L=256;
x0=imread('under.jpg');
x0=double(x0); %input image
[m,n]=size(x0);
len=m*n; %number of pixels
x=reshape(x0,len,1); %convert to [len:1]
xpdf=hist(x,[0:L-1]); % pdf, 1 x L
xpdf=xpdf/len;                      %Normalize it to get nk/n (eq 3.3-%7) ... (lenis equal to sum(xpdf), number of pixels .. )
sk=xpdf*triu(ones(L));%CDF (eq 3.3-8)
y0=zeros(m,n);
for k=0:L-1
if (xpdf(k+1) > 0)
list=find(x0 ==k); %find value in input image
y0(list)=sk(k+1)*L; %map sk value for each k valued

%pixel
end
end
y=reshape(y0,len,1); %convert to [len:1]
ypdf=hist(y,[0:L-1])/len; % pdf, 1 x L

figure(1)
subplot(311);
stem([0:L-1],xpdf,'.');
title('histogram, original')

subplot(312),stem([0:L-1],sk,'.'),title('transformation')
subplot(313),stem([0:L-1],ypdf,'.'),title('histogram,equalized')
figure(2);
colormap('gray');
image(y0);
y0=uint8(y0);
imwrite(y0,'under.jpg','jpg');
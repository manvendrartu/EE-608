clc
clear all 
close all 

A = imread('coins.png');
imshow(A)

[centers, radii, metric] = imfindcircles(A,[15 30]);

centersStrong5 = centers(1:5,:); 
radiiStrong5 = radii(1:5);
metricStrong5 = metric(1:5);

viscircles(centersStrong5, radiiStrong5,'EdgeColor','b');
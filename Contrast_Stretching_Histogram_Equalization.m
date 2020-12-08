% 2.1 Contrast Stretching and 2.2 Histogram Equalization
% Written by: Mu Siyi
% Date: 20/09/2020

Pc = imread('mrt-train.jpg');
whos Pc
P = rgb2gray(Pc);
imshow(P)
min(P(:)), max(P(:))

% Contrast Stretching
% Approach 1
P1 = imsubtract(P, 13);
P2 = immultiply(P1, 255/191);
min(P2(:)), max(P2(:))
imshow(P2)
% Approach 2
P1 = double(P);
P2 = (P1-13).*(255/191);
min(P2(:)), max(P2(:))
imshow(P2,[])

% Histogram Equalization
imhist(P, 10);
imhist(P, 256);
% First time
P3 = histeq(P, 255);
imhist(P3, 10);
imhist(P3, 256);
% Second time
P3 = histeq(P, 255);
imhist(P3, 10);
imhist(P3, 256);
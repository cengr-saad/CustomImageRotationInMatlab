clc
clear all
close all
A = [1 2 3 4 ; 6 7 8 9 ; 11 12 13 14 ; 16 17 18 19 ; 21 22 23 24];
ang = 30;
im = imread('text.png');
im = rgb2gray(im);
xy1 = rotate(im, ang);
A;
figure
imshow(im);
figure
imshow(xy1);
xy1;
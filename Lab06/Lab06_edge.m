%Alexander Munoz
%CSE 185
%Lab 6
%Collaborators: N/A
%Lab06_edge.m

img = im2double(imread('lena.jpg'));

%% Compute gradient magnitude and orientation with Sobel filter
[magnitude, orientation] = sobel_feature(img);

%% apply thresholding to detect edge
threshold = 0.3;
e = magnitude > threshold;

e1 = edge(img, 'sobel');   %change img to sobel edge detection
e2 = edge(img, 'canny');   %change img to canny edge detection

figure, imshow(img);
figure, imshow(e1);     title('Sobel Edge');
imwrite(e1, 'lena_sobel.jpg');
figure, imshow(e2);     title('Canny Edge');
imwrite(e2, 'lena_canny.jpg');
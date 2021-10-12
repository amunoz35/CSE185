%Alexander Munoz
%CSE 185
%Lab 3
%Collaborators: N/A
%Sources: Lab 3 pdf/Slides: Spatial Filters

%Task 1: Sobel Filter Hy filter
image = im2double(imread('lena.jpg'));
H_y = [1, 2, 1; 0, 0, 0; -1, -2, -1];

img_sobel = sobel_filter(image,H_y);
figure, imshow(img_sobel);
imwrite(img_sobel,'sobel_y.jpg');

%Task 2: Sobel Filter Hx filter
image2 = im2double(imread('lena.jpg'));
H_x = [1, 0, -1; 2, 0, -2; 1, 0, -1];

img_sobel = sobel_filter(image2,H_x);
figure, imshow(img_sobel);
imwrite(img_sobel,'sobel_x.jpg');

%Task 3: Sobel Filter 1D filter
image3 = im2double(imread('lena.jpg'));
H_y = [1, 2, 1; 0, 0, 0; -1, -2, -1];
img_sobel = sobel_filter(image3,H_y);
H_x = [1, 0, -1; 2, 0, -2; 1, 0, -1];
img_cr = sobel_filter(img_sobel, H_x)
figure, imshow(img_cr);
imwrite(img_cr,'sobel_cr.jpg');

%Task 4: Sobel Filter Row and Column wise
image4 = im2double(imread('lena.jpg'));

H_x = [1, 0, -1; 2, 0, -2; 1, 0, -1];
img_test = sobel_filter(image4, H_x)
H_y = [1, 2, 1; 0, 0, 0; -1, -2, -1];
img_rc = sobel_filter(img_test,H_y);
figure, imshow(img_cr);
imwrite(img_sobel,'sobel_rc.jpg');

%Task 5: Gaussian Filter - hsize=5 sigma=2
img =im2double(imread('lena.jpg'));
hsize = 5;
sigma = 2;

img_gaussian = gaussian_filter(img, hsize, sigma);
figure, imshow(img);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_5.jpg');

%Task 6: Gaussian Filter - hsize=9 sigma=4
hsize_1 = 9;
sigma_1 = 4;

img_gaussian = gaussian_filter(img, hsize, sigma);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_9.jpg');  


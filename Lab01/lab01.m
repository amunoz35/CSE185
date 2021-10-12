%Alexander Munoz
%Collaborators: N/A
%Sources: 
%2/2/20

%Task 1: Green image
%load image 1
green = imread('01.jpg');
figure, imshow(green), title('Image 1 with Green Channel');
%remove the green channel
green(:, :, 2) = 0;
figure, imshow(green), title('Image 1 without Green Channel');
%export new image
imwrite(green, 'green.jpg')

%Task 2: Gray Image
grayscale = imread('01.jpg');
figure, imshow(grayscale), title('Image 1 in color');
R = grayscale(:, :, 1);
G = grayscale(:, :, 2);
B = grayscale(:, :, 3);
%Convert all channels to create a grayscale with the given function
Y = 0.299*R + 0.587*G + 0.114*B;

figure, imshow(Y), title('Image 1 in grayscale');
imwrite(Y, 'gray.jpg');

%Task 3: Rotate Image
rotate = imread('01.jpg');
figure, imshow(rotate), title('Image 1 without rotation');
rotate = imrotate(rotate, 90);
figure, imshow(rotate), title('Image 1 rotated 90 degrees');
imwrite(rotate, 'rotate.jpg');

%Task 4: Cropping
cropped = imread('01.jpg');
figure, imshow(cropped), title('Uncropped Image 1');
%C = cropped(30:100, 270:300);
C = imcrop(cropped,[30 100 270 300]);
figure, imshow(C), title('Cropped Image 1');
imwrite(C, 'crop.jpg');

%Task 5: Flip image
img = imread('01.jpg');
figure, imshow(img), title('Image 1 unflipped');
flipped = flip(img, 2);
figure, imshow(flipped), title('Image 1 after flip');
imwrite(flipped, 'flip.jpg');

%Task 6: Combine 4 images
img = imread('01.jpg');
img2 = imread('02.jpg');
img3 = imread('03.jpg');
img4 = imread('04.jpg');
%create a space with a 10 pixel wide gap between all images
canvas = zeros(300 * 2 + 10, 400 * 2 + 10, 3, 'uint8');
canvas(1:300, 1:400, :) = img;
canvas(1:300, 411:810, :) = img2;
canvas(311:610, 1:400, :) = img3;
canvas(311:610, 411:810, :) = img4;
figure, imshow(canvas), title('Collage of images1 - 4');
imwrite(canvas, 'combine.jpg');

%Task 7: Average matrices
img5 = imread('05.jpg');
img6 = imread('06.jpg');

img5 = img5(:);
img6 = img6(:);
%Average the two images in terms of their respective values in their
%matrices
average = (img5 + img6) / 2 ; 
average = reshape(average, 375, 1242, 3);
figure, imshow(average), title('Image 5 and 6 averaged');
imwrite(average, 'average.jpg');
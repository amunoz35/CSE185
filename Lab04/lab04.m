%Alexander Munoz
%CSE 185
%Lab 04
%Collaborators: N/A

%Task 1: Separate Frequency implementation
%        *see attached separate_frequency.m

%Task 2: Ratio = 0.1 for lenalow and lenahigh
img1 = im2double(imread('lena.jpg'));
%imshow(img1);
ratio1 = 0.1;
[low_pass_1, high_pass_1] = separate_frequency(img1, ratio1);
imwrite(low_pass_1, 'lena_low_0.1.jpg')
imwrite(high_pass_1, 'lena_high_0.1.jpg')

%Task 3: Ratio = 0.2 for lenalow and lenahigh
ratio2 = 0.2;
[low_pass_2, high_pass_2] = separate_frequency(img1, ratio2);
imwrite(low_pass_2, 'lena_low_0.2.jpg')
imwrite(high_pass_2, 'lena_high_0.2.jpg')
%Task 4: hybrid image implementation
%        *see attached hybrid_image.m

%Task 5: Create a hybrid version with low marilyn and high einstein
name1 = 'marilyn.jpg';
name2 = 'einstein.jpg';
img2 = im2double(imread(name1));
img3 = im2double(imread(name2));
ratio = 0.3;
mar_ein = hybrid_image(img2, img3, ratio);
%figure, imshow(mar_ein);
imwrite(mar_ein, 'hybrid_1.jpg');

%Task 6: Create a hybrid version with low einstein and high marilyn
ratio = 0.1
ein_mar = hybrid_image(img3, img2, ratio);
%figure, imshow(ein_mar);
imwrite(ein_mar, 'hybrid_2.jpg')

%Task 7: Attached files

%Task 8:Color Frequencies
name3 = 'new_york.jpg';
name4 = 'flowers.jpg';
imgNew = im2double(imread(name3));
imgFlower = im2double(imread(name4));
%refer to attached visualization.m and 

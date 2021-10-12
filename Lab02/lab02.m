%Alexander Munoz
%CSE185
%Collaborators: Marcus Loe
%Sources: CSE-185 Lab2 lecture slides

%Task 1: Rotate image 1 by 45 degrees with forward warping
image = imread('01.jpg');
%figure, imshow(image)
angle = 45;
coordX = 200;
coordY = 150;
I1 = zeros(300,400,3, 'uint8');

for y = 1:300
    for x = 1:400
        x2 = round(cosd(angle)*(x-coordX) + sind(angle)*(y-coordY) + coordX);
        y2 = round(-sind(angle)*(x-coordX) + cosd(angle)*(y-coordY) + coordY);
        if (x2 >=1 && x2<= 400 && y2 >= 1 && y2<=300)
            I1(y2,x2, :) = image(y,x,:);
        end
    end
end
figure, imshow(I1), title('Forward Warp Image by 45 degrees');
imwrite(I1,'rotate_0.jpg')

%Task 2: Rotate image 1 by 45 degrees with backward warping
%using previously loaded image1 and dimensions angle, coordX, and coordY
for y = 1:300
    for x = 1:400
        x2 = round(cosd(angle)*(x-coordX) + -sind(angle)*(y-coordY) + coordX);
        y2 = round(sind(angle)*(x-coordX) + cosd(angle)*(y-coordY) + coordY);
        if (x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            I2(y, x, :) = image(y2, x2, :);
        end
    end
end
figure, imshow(I2), title('Backward Warp image by 45');
imwrite(I2, 'rotate_1.jpg');

%Task 3: Implement median filter with patch size 3
image2 = imread('lena_noisy.jpg');
patch_size = [3,3];
%call median_filter
img_median = median_filter(image2, patch_size);
figure, imshow(img_median)
imwrite(image2, 'median_0.jpg'), title('Noisy image with patch size 3');

%Task 4: Use patch size 5 and save as median1
patch_size = [5,5];
img_median = median_filter(image2, patch_size);
%median_filter
figure, imshow(img_median)
imwrite(image2, 'median_1.jpg'), title('Noisy image with patch size 5');

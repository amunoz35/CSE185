%Visualization.m
%figure, imshow(log(abs(frequency_map) + 1), []);
img = im2double(imread('flowers.jpg'));
frequency_map = fftshift(fft2(img));
flower = figure, imagesc(log(abs(frequency_map)+ 1)), colormap jet;
%imwrite(flower, 'flowers_frequency.jpg');
saveas(flower, 'flowers_frequency','jpg')

img2 = im2double(imread('new_york.jpg'));
frequency_map2 = fftshift(fft2(img2));
new_york = figure, imagesc(log(abs(frequency_map2)+ 1)), colormap jet;
%imwrite(new_york, 'new_york_frequency');
saveas(new_york, 'new_york_frequency','jpg');
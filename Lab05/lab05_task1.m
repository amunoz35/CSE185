%Alexander Munoz
%CSE 185
%Lab 5
%Collaborators: N/A
%Both task 1 and task 2 listed here
%Gaussian Pyramid
img = im2double(imread('einstein1.jpg'));
sigma = 2.0;
hsize = 7;
scale = 5;
I = img;
H = fspecial('gaussian', hsize, sigma);
for s = 1 : scale
    %Gaussian filter
    var = floor(hsize/2);    
    %save or show image
    img_test = imfilter(I,H);
    imwrite(I, sprintf('Gaussian_scale%d.jpg', s));
    %Down-sampling    
   % imresize
   I = imresize(I,1/2);
   %imshow(I);
end

%Laplacian Pyramid
I = img;
for s = 1 : scale
    %Gaussian filtering
    filter = imfilter(I, H);
    %Laplacian filtering
    Laplace_test = I - filter;
    %Save or show image
    imwrite(Laplace_test + 0.5, sprintf('Laplacian_scale%d.jpg',s));    
    %Down-Sampling
    I = imresize(I, 1/2);
end


%Task 2
%NOTE: Change the strings in imwrite from einstein1 to einstein 2
img = im2double(imread('einstein1.jpg'));
%img = im2double(imread('einstein2.jpg'));
temp = im2double(imread('template.jpg'));

%SSD Template matching
threshold = 25;
[output, match] = template_matching_SSD(img, temp, threshold);
figure, imshow(output ./ max(output(:)));
figure, imshow(output ./ max(output(:))); title('SSD output');
figure, imshow(match); title('SSD match');

imwrite(output ./ max(output(:)), sprintf('%s_ssd_output.jpg', 'einstein1') );
imwrite(match, sprintf('%s_ssd_match.jpg', 'einstein1') );


%Cross Correlation
threshold = 1/2;
[output, match] = template_matching_normcorr(img, temp, threshold);

figure, imshow(output ./ max(output(:))); title('NormCorr output');
figure, imshow(match); title('NormCorr match');

imwrite(output ./ max(output(:)), sprintf('%s_normcorr_output.jpg', 'einstein1') );
imwrite(match, sprintf('%s_normcorr_match.jpg', 'einstein1') );
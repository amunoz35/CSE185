%Alexander Munoz
%CSE 185
%Collaborators: N/A
%Lab 07 
%Please use the following parameters in the assignment:
%1. Sigma = 1 in the gaussian filter G1.
%2. Sigma = 2 in the gaussian filter G2.
%3. Alpha=0.04 when calculating the corner response.
%4. R_threshold = 1e-5 * 5 when applying thresholding on R.

%imgName = 'baboon';
%imgName = 'checkboard';
imgName = 'cameraman';
img = im2double(imread(sprintf('%s.png', imgName)));

sigmaG1 = 1;
sigmaG2 = 2;
alpha = 0.04;
R_threshold = 1e-5 * 5;
%%Part of Step 6: displaying the final corner detector
[corner_x, corner_y] = Harris_corner_detector(img, sigmaG1, sigmaG2, alpha, R_threshold);

figure, imshow(img);
hold on;
plot(corner_x, corner_y, 'ro');

h = gcf;
saveas(h, sprintf('%s_corner.png', imgName));

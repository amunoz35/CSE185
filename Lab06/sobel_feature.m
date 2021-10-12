%sobel_feature.m
%Will compute gradient magnitude and orientation from Sobel filtering
%Given pseudocode 
function [magnitude, orientation] = sobel_feature(img)
    %horizontal edge
    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
    %vertical edge
    Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1];   
    %Sobel filtering: Reusing sobel filter from Lab 3
    %horizontal edge
    sobel_h = sobel_filter(img, Hy);
    %vertical edge
    sobel_v = sobel_filter(img, Hx);
    
    img_mag = sqrt(sobel_h.^2 + sobel_v.^2);
    img_or = atan2(sobel_h, sobel_v);
    %% compute gradient magnitude and orientation
    magnitude = img_mag;
    orientation = img_or;

end
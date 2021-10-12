%Separate_frequency.m: According to slide 20 there is a 6 step process
%1. apply fft2(), 2. fftshift(), 3. Low frequency mask, 4. separarate low
%and high frequency, 5. use ifftshift(), 6. apply ifft2()

function [low_pass_img, high_pass_img] = separate_frequency(img1, ratio)
    %1. fft2
    frequency_map = fft2(img1);
    figure, imshow(log(abs(frequency_map) + 1), []);
    %2. fftshift
    frequency_shift = fftshift(frequency_map);
    
    %3. Low frequency mask
    height = size(img1, 1);
    width = size(img1, 2);
    x_0 = floor(width/2);
    y_0 = floor(height/2);
    
    y1 = y_0 - floor(ratio*(height/2));
    y2 = y_0 + floor(ratio*(height/2));
    x1 = x_0 - floor(ratio*(width/2));
    x2 = x_0 + floor(ratio*(width/2));
    
    mask = zeros(size(img1));
    mask(y1:y2, x1:x2, :) = 1;
    
    %4. Separate low/high frequency
    low_frequency_shift = frequency_shift .* mask;
    high_frequency_shift = frequency_shift .* (1 - mask);
    
    %5. ifftshift
    low_map = ifftshift(low_frequency_shift);
    high_map = ifftshift(high_frequency_shift);
    
    %6. ifft2()
    low_pass_img = real(ifft2(low_map));
    high_pass_img = real(ifft2(high_map));
end
%hybrid_image.m
%This will split images into both low and high pass images and combine the
%frequency maps into a single merged image
function merged_image = hybrid_image(img1, img2, ratio)
    [low_frequency_img, high_frequency_img] = separate_frequency(img1, ratio);
    [low_frequency_img2, high_frequency_img2] = separate_frequency(img2, ratio);
    
    merged_image = low_frequency_img + high_frequency_img2;
end
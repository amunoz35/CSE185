%Reference: Linear Filter slide 27
%Image2 is the loaded noisy image
function output = median_filter(image2, patch_size)
    I1 = im2double(imread('lena_noisy.jpg'));
    I2 = zeros(size(I1));%Populate a zero matrix of size I1
    
    %The shift has to be either be 1 or 2, depending on whether or not the
    %patch size is 3 or 5 respectively (filter size)
    shift_v = floor(patch_size(2)/2);
    shift_u = floor(patch_size(1)/2);  
    
    %Nested for loop to iterate through the entire image
    for u = 1 + shift_u : size(I1, 2) - shift_u
        for v = 1 + shift_v : size(I1, 1) - shift_v
            x1 = u - shift_u; x2 = u + shift_u;
            y1 = v - shift_v; y2 = v + shift_v;  
            
            %take the patch and make the 2D matrix into a 1D vector
            patch = I1(y1:y2, x1:x2);
            patch = patch(:);          
            value = median(patch);
            I2(v, u) = value; 
        end
    end
  
        output = I2;
end
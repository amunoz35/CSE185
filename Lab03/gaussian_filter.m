%Gaussian Filter: Low pass/ smoothing filter
%                 Blurs the image dependant on the standard deviation
%                 Similarly to the sobel filter, the gaussian filter
%                 will use a kernel using fspecial
function img_gaussian = gaussian_filter(img, hsize, sigma)
    H = fspecial('gaussian', hsize, sigma);
    Img = zeros(size(img));
    shift_u=floor(size(H,2)/2);
    shift_v=floor(size(H,1)/2);
    
    for u = (1 + shift_u) : (size(img, 2) - shift_u)
        for v = (1 + shift_v) : (size(img, 1) - shift_v)
            x = u - shift_u; y = v - shift_v;
            x2 = u + shift_u; y2 = v + shift_v;            
            patch = img(y:y2,x:x2);
            patch = patch(:);
            H = H(:);
            H = H';            
            value = H * patch;
            Img(v,u) = value;
        end 
    end
    img_gaussian = Img;
end

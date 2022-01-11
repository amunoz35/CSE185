%Harris_corner_detector
function [corner_x, corner_y] = Harris_corner_detector(img, sigmaG1, sigmaG2, alpha, R_threshold)  
	%% Derivative for Gaussian filtering
    Dx = [1, 0, -1];
    Dy = [1; 0; -1];
    %% Step 1: Image Gradients
    hsize1 = 1 + 2 * ceil(sigmaG1 * 2);
    hsize2 = 1 + 2 * ceil(sigmaG2 * 2);

    gaussian_kernel1 = fspecial('gaussian', hsize1, sigmaG1);
    gaussian_kernel2 = fspecial('gaussian', hsize2, sigmaG2);   

    %imshow(imfilter(img, gaussian_kernel1, 'replicate'));
    Ix = imfilter(imfilter(img, gaussian_kernel1, 'replicate'), Dx, 'replicate');
    Iy = imfilter(imfilter(img, gaussian_kernel1, 'replicate'), Dy, 'replicate');

    figure, imshow(Ix + 0.5);
    imsave;
    figure, imshow(Iy + 0.5);
    imsave;
    
    %%Step 2: Products of Gradients
    Ixx = Ix .* Ix;
    Iyy = Iy .* Iy;
    Ixy = Ix .* Iy;
  
    %% Step 3: Matrix M
    Sxx = imfilter(Ixx, gaussian_kernel2, 'replicate');
    Syy = imfilter(Iyy, gaussian_kernel2, 'replicate');    
    Sxy = imfilter(Ixy, gaussian_kernel2, 'replicate');   
    
    %% Step 4: Corner Response
    R = (Sxx.*Syy - (Sxy.*Sxy)) - (alpha * (Sxx + Syy).^2);
    figure, imagesc(R);
    imsave;
    
    corner_map = R > R_threshold;  
    figure, imshow(corner_map);
    imsave;
    
    %% Step 5: Non - maxima Suppression
    local_maxima = imregionalmax(R);   
    figure, imshow(local_maxima);  
    imsave;
    
    %%Step 6: Extract corner points and plot
    final_corner_map = corner_map & local_maxima;
    figure, imshow(final_corner_map);
    imsave;
    [corner_y, corner_x] = find(final_corner_map);

end
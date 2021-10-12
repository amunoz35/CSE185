%Sobel Filter: A typical edge detection algorithm. 
%              Unlike the median filter, the sobel filter will only
%              have to detect the edge across the orientation from the
%              input matrix
function img_sobel = sobel_filter(img, kernel)
    Img = zeros(size(img));
    shift_u = floor(size(kernel, 2)/2);
    shift_v = floor(size(kernel, 1)/2);
    
    for u = (1 + shift_u): (size(img, 2) - shift_u)
        for v = (1 + shift_v):(size(img, 1) - shift_v)
            x = u - shift_u; y = v - shift_v;
            x2 = u + shift_u; y2 = v + shift_v;            
            patch = img(y:y2,x:x2);
            patch = patch(:);
            kernel = kernel(:);
            kernel = kernel';
            
            value = kernel * patch;
            Img(v,u) = value;
        end 
    end
    img_sobel = Img;
end

%  function sobel = sobel(image3)
%      H_x = [1, 0, -1; 2, 0, 2; -1, 0, 1];
%      [rows, cols] = size(image3);
%      I_1 = zeros(rows+2, col+2);
%      I_2(1+1: rows + 1, 1+1: cols+1) = image3;
%      
%      for i = 1: rows
%          for k = 1: cols
%              S1(i,j) = sum(sum(H_x.*A(i:i+2, j:j+2)));
%          end 
%      end 
%  end
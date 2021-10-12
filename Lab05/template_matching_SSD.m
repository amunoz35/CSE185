%Alxexander Munoz
%CSE 185
%Lab 5
%Template Matching SSD: Referenced to Lab 5 Slides
function [output, match] = template_matching_SSD(img, temp, threshold)
shift_u = floor(size(temp, 2)/2);
shift_v = floor(size(temp, 1)/2);
output = img;
for u = 1 + shift_u : size(img, 2) - shift_u
    for v = 1 + shift_v : size(img, 1) - shift_v
        
        x1 = u - shift_u; x2 = u + shift_u;
        y1 = v - shift_v; y2 = v + shift_v;
        patch = img(y1 : y2, x1: x2);
        patch = (patch - temp).^2;
        
        %SSD
        value = sum(patch);
        value = sum(value);
        output(v, u) = value;
        
    end
end

match = (output < threshold);
end
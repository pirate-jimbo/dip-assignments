I = imread('images\cameraman.png');

[row, col] = size(I);

total_pix = row * col;

count_pix = zeros(1, 256);

for i = 1:row
    for j = 1:col
        count_pix(I(i, j) + 1) = count_pix(I(i, j) + 1) + 1;
    end
end

PDF = count_pix / total_pix;

CDF = zeros(1, 256);

for i = 1:256
   CDF(i) = sum(PDF(1:i)); 
end

CDF = round(255 * CDF);

O = zeros(256, 256);

for i = 1:row
    for j = 1:col
       O(i, j) = CDF(I(i, j));
    end
end

O = uint8(O);

BAR_I = generate_histogram(I);
BAR_O = generate_histogram(O);

figure;
subplot(2, 2, 1);
imshow(I);
subplot(2, 2, 2);
imshow(O);
subplot(2, 2, 3);
bar(BAR_I);
subplot(2, 2, 4);
bar(BAR_O);

imwrite(O, 'images\equalization_output.png');


function [BAR_I] = generate_histogram(I)

    [row, col] = size(I);
    
    BAR_I = zeros(1, 256);

    for i=1:row
        for j=1:col
            temp_I = I(i,j)+1;
            BAR_I(temp_I) = BAR_I(temp_I) + 1;
        end
    end
end









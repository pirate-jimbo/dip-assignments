I = rgb2gray(imread('images\input_rgb.jpg'));


imwrite(I, 'images\gaussian_input_gray.jpg');

sigma = input('Enter the sigma value: ');

figure;
imshow(I);

% taking 5*5 gaussian filter as my ID is 01 and 1%4 = 1
X = [-2 -1 0 1 2 ;
    -2 -1 0 1 2 ;
    -2 -1 0 1 2 ;
    -2 -1 0 1 2 ;
    -2 -1 0 1 2 ;];
Y = X.';

K = zeros(5, 5);

for i = 1:5
    for j = 1:5
        K(i, j) = (1 / (2 * pi * sigma^2)) * exp((-(X(i, j)^2 + Y(i, j)^2)) / (2 * sigma^2));
    end
end

K = K / sum(K(:));

I = padarray(I, [5 5], 'replicate', 'both');

I = double(I);

[irow, icol] = size(I);
[krow, kcol] = size(K);

for i = 1:irow - krow
    for j = 1:icol - kcol
        
        a = I(i:i + krow-1, j:j + kcol-1);
        a = a .* K;
        
        I(i+round(krow / 2), j+round(kcol / 2)) = sum(a(:));
    end
end

I = uint8(I);
figure;
imshow(I);
imwrite(I, 'images\gaussian_output.jpg');


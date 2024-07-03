>> %% Step 1: Input image
I = imread('Image1.jpg');
I = im2double(I);
out1 = I;
subplot(2, 4, 1);
imshow(out1, []);
title('Figure (a)');

%% Step 2: Laplacian Filter in image (a)
laplacian_filter = [0 1 0; 1 -4 1; 0 1 0];
out2 = imfilter(I, laplacian_filter);
subplot(2, 4, 2);
imshow(out2, []);
title('Figure (b)');

%% Step 3: Laplacian Enhanced Image (c)
out3 = out1 - out2;
subplot(2, 4, 3);
imshow(out3);
title('Figure (c)');

%% Step 4: Sobel Filter on Image (a)
gx = [-1 0 1; -2 0 2; -1 0 1];
gy = [1 2 1; 0 0 0; -1 -2 -1];
d_dx = imfilter(I, gx);
d_dy = imfilter(I, gy);
out4 = sqrt(d_dx .^ 2 + d_dy .^ 2);
threshold = 0.5;

[row, col] = size(out4);
for i = 1 : row
    for j = 1 : col
        if(out4 < threshold)
            out4(i, j) = 0;
        end
    end
end
subplot(2, 4, 4);
imshow(out4);
title('Figure (d)');

%% Step 5: Design a 5X5 average filter mask and Apply it to image (d)
avg_filter_mask = ones([5 5]) / 25;
out5 = imfilter(out4, avg_filter_mask);
subplot(2, 4, 5);
imshow(out5);
title('Figure (e)');

%% Step 6: Get the product of (c) and (e)
out6 = out3 .* out5;
subplot(2, 4, 6);
imshow(out6);
title('Figure (f)');

%% Step 7: Add (a) and (f)
out7= I + out6;
subplot(2, 4, 7);
imshow(out7);
title('Figure (g)');

%% Step 8: Apply Power Law Transform
c= 1;
gamma_value = 0.5;
out8 = c* power(out7, gamma_value);
subplot(2, 4, 8);
imshow(out8);
title('Figure (h)');
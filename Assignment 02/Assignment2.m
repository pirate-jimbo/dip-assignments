I = imread('peppers_color.jpg');
I = rgb2gray(I);
figure;
imshow(I);
figure;
imhist(I);

[row, col] = size(I);
R = zeros(row,col);
B = max(I(:));
A= min(I(:));
D = B-A;
M = 2^8-1;
for i=1:row
    for j=1:col
        R(i,j) = (((I(i,j)-A)/D)*M) + A;
    end
end
figure;
imshow(R);
figure;
imhist(R);
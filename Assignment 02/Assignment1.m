I= imread('peppers_color.jpg');
figure;
imshow(I);
I= rgb2gray(I);
figure;
imshow(I);
figure;
imhist(I);
I= im2double(I);
[row, col] = size(I);
PLT = zeros(row,col);
%power law transformation
gamma = input('Give a value for gamma: ');
c=1.5;
for i=1:row
    for j=1:col
        PLT(i,j) = c*power(I(i,j),gamma);
    end
end
figure;
imshow(PLT);
imwrite(PLT,'powerlawtransformation.jpg');
figure;
imhist(PLT);
T = zeros(row,col);
%threshold
A = input('Give a value for A: ');
for i=1:row
    for j=1:col
        if I(i,j)<A
            T(i,j) = I(i,j) + (I(i,j)*0.5);
        else
            T(i,j) = I(i,j) - (I(i,j)*0.25); 
        end
    end
end
figure;
imshow(T);
imwrite(T,'threshold.jpg');
figure;
imhist(T);
LT = zeros(row,col);
%log transformation
c =  1.9;
for i=1:row
    for j=1:col
        LT(i,j) = c*log(1+I(i,j));
    end
end
figure;
imshow(LT);
imwrite(LT,'logtransformation.jpg');
figure;
imhist(LT);

%negative image
N = 255 - I;
figure;
imshow(N);
imwrite(N,'negative.jpg');
figure;
imhist(N);
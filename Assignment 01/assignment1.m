I=imread('tom.jpg');

I = imresize(I,[512 256]);

figure;
imshow(I);
[row,col,cha] = size(I);
K = uint8(ones(row, col));
for i=1:row
    for j=1:col
        for k=1:cha
            K(i,col+1-j,k) = I(i,j,k);
        end
    end
end
figure;
imshow(K);

K1 = uint8(ones(row, col+col));

for i=1:(row)
    for j=1:(col+col)
        for k=1:cha
            if j<=col
                K1(i,j,k) = I(i,j,k);
            else
                K1(i,j,k) = K(i,j-col,k);
            end
        end
    end
end

figure;
imshow(K1);
imwrite(K1,"newimage1.jpg");
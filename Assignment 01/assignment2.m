I=imread('tom.jpg');
J=imread('jerry.png');
I = imresize(I,[500 500]);
J = imresize(J,[500 500]);
figure;
imshow(I);
figure;
imshow(J);
[row,col,cha] = size(I);
K = uint8(ones(row, col));

for i=1:row
    for j=1:col
        for k=1:cha
           if j<=100 || (j>200 && j<=300) || (j>400 && j<=500)
                K(i,j,k) = I(i,j,k);
           else
               K(i,j,k) = J(i,j,k); 
           end
        end
    end
end
figure;
imshow(K);
imwrite(K,"newimage2.jpg");

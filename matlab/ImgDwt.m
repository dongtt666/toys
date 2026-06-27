X = imread('lena.jpg');
figure(1);
imshow(X);title('原始图像');

[cA,cH,cV,cD] = dwt2(X,'db1');
figure(2);
subplot(2,2,1),imshow(uint8(cA)),title('低频分量cA');
subplot(2,2,2),imshow(cH),title('水平方向分量cH');
subplot(2,2,3),imshow(cV),title('竖直方向分量cV');
subplot(2,2,4),imshow(cD),title('对角方向分量cD');

X1 = idwt2(cA,cH,cV,cD,'db1');
figure(3);
imshow(uint8(X1));
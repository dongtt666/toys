img=imread('lena.bmp');
subplot(2,2,1),imshow(img);
f=rgb2gray(img);
subplot(2,2,2),imshow(f);
%二维傅里叶变换
F=fft2(f);
FS=fftshift(F);
 
%频谱
S=log(1+abs(FS));
subplot(2,2,3);imshow(S,[]);
%% 二维傅里叶逆变换
fr=real(ifft2(ifftshift(FS)));
ret=im2uint8(mat2gray(fr));
subplot(2,2,4),imshow(ret);
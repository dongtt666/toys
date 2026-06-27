[i,lcmp]=imread('f:/tank.bmp');%=======读取图像 显示图像
imshow(i,lcmp);            
ii=im2double(i);                   %=====将图像矩阵类型转换为double（图像计算很多是不能用整型的）
i1 = fft2(ii);                         %======傅里叶变换
i2 =fftshift(i1);                      %======将变换的频率图像四角移动到中心（原来良的部分在四角 现在移动中心，便于后面的处理）
i3=log(abs(i2));                  %=====显示中心低频部分，加对数是为了更好的显示
程序一
figure,imshow(i3,[]);             
colormap(lcmp);
imwrite(i3,lcmp,'f:/ffttank.bmp');  %===将上面i3输入到ffttank文件中
i5 = real(ifft2(ifftshift(i2)));            %===频域的图反变换到空域 并取实部
i6 = im2uint8(mat2gray(i5));         %===取其灰度图
imwrite(i6,lcmp,'f:/tank2.bmp','bmp');  %===利用灰度图和原来取得颜色模板 还原图像
figure,imshow(i6);
title('反变换后的图像');
程序二
RGB = imread('autumn.tif');      %===读取图像
I = rgb2gray(RGB);                  %==将其转为灰度
imshow(I);
J = dct2(I);                          %==二维dct变换，即离散余弦变换，
figure,imshow(log(abs(J)),[])  %==显示出变换后的图像，此时能量集中在左上角
colormap(jet(64)), colorbar    %====建立颜色模板
figure;
J(abs(J) < 10) = 0;               %==我理解为：因为dct变换只要保存左上角的低频小块就可以保持原图像信息，故其他部分（高频，其能量较小故值也小）就可以舍去
K = idct2(J)/255;                        %===这不加255，将下句改成imshow(K,[]);也一样，只是显示的需要
imshow(K);
title('反变换后的图像');
M=imread('dl011.jpg')         %读取MATLAB中的名为cameraman的图像   
subplot(3,3,1) 
imshow(M)                         %显示原始图像
title('original')
P1=imnoise(M,'gaussian',0.02)     %加入高斯躁声 
subplot(3,3,2) 
imshow(P1)                        %加入高斯躁声后显示图像 
title('gaussian noise');
P2=imnoise(M,'salt & pepper',0.02) %加入椒盐躁声
subplot(3,3,3)
imshow(P2)                        %%加入椒盐躁声后显示图像  
title('salt & pepper noise');
g=medfilt2(P1)                       %对高斯躁声中值滤波
subplot(3,3,5)
imshow(g)
title('medfilter gaussian')
h=medfilt2(P2)                       %对椒盐躁声中值滤波
subplot(3,3,6)
imshow(h)
title('medfilter salt & pepper noise')
l=[1 1 1                               %对高斯躁声算术均值滤波
   1 1 1 
   1 1 1]; 
l=l/9;                           
k=conv2(P1,l)                        
subplot(3,3,8)
imshow(k,[])
title('arithmeticfilter gaussian')
                                           %对椒盐躁声算术均值滤波
d=conv2(P2,l)                        
subplot(3,3,9)
imshow(d,[])
title('arithmeticfilter salt & pepper noise')

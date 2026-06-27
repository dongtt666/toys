# -*- coding: utf-8 -*-

import cv2
import numpy as np
from matplotlib import pyplot as plt
img = cv2.imread('lena.jpg',0)
f = np.fft.fft2(img)
fshift = np.fft.fftshift(f)

flt = np.ones(img.shape, np.uint8)
[w,h] = img.shape

####高通滤波
##radius = np.min([w,h])/3
##rx = w/2
##ry = h/2
##for i in range(w):
##    for j in range(h):
##        if (rx-i-1)**2+(ry-j-1)**2 <= radius*radius:
##            flt[i,j]=0

##低通滤波
##radius = np.min([w,h])/3
##rx = w/2
##ry = h/2
##for i in range(w):
##    for j in range(h):
##        if (rx-i-1)**2+(ry-j-1)**2 <= radius*radius:
##            flt[i,j]=1

## 低通滤波
##r1 = np.min([w,h])/5
##r2 = np.min([w,h])/3
##rx = w/2
##ry = h/2
##for i in range(w):
##   for j in range(h):
##       if (rx-i-1)**2+(ry-j-1)**2 >= r1*r1 and (rx-i-1)**2+(ry-j-1)**2 <= r2*r2 :
##           flt[i,j]=0

##陷波滤波
radius = np.min([w,h])/8
rx = radius
ry = h/2
for i in range(w):
    for j in range(h):
        if (rx-i-1)**2+(ry-j-1)**2 <= radius*radius:
            flt[i,j] = 0
        if (rx-(w-i-1))**2+(ry-(h-j-1))**2 <= radius*radius:
            flt[i,j] = 0

rx = w/2
ry = radius
for i in range(w):
    for j in range(h):
        if (rx-i-1)**2+(ry-j-1)**2 <= radius*radius:
            flt[i,j] = 0
        if (rx-(w-i-1))**2+(ry-(h-j-1))**2 <= radius*radius:
            flt[i,j] = 0

ffshift = fshift*flt
#FFT逆变换
rshift = np.fft.ifftshift(ffshift)
rf = np.fft.ifft2(rshift)
dst = np.abs(rf)

#图像展示
magnitude_spectrum = 20*np.log(np.abs(fshift))
plt.subplot(221),plt.imshow(img, cmap = 'gray')
plt.title('Input Image'), plt.xticks([]), plt.yticks([])
plt.subplot(222),plt.imshow(magnitude_spectrum, cmap = 'gray')
plt.title('Magnitude Spectrum'), plt.xticks([]), plt.yticks([])
plt.subplot(223),plt.imshow(flt, cmap = 'gray')
plt.title('Filter'), plt.xticks([]), plt.yticks([])
plt.subplot(224),plt.imshow(dst, cmap = 'gray')
plt.title('Reconstruction'), plt.xticks([]), plt.yticks([])
plt.show()

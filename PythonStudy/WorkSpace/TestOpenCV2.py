import cv2.cv as cv
im = cv.LoadImage("lena.jpg")
cv.NamedWindow("Source")
cv.ShowImage("Source",im)
cv.WaitKey(0)

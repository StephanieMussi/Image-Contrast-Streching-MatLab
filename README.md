# Image_Contrast_Streching_MatLab
This project implements two methods for constrast stretching of images in MatLab. The image used can be found in ["mrt-train.jpg"](https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/mrt-train.jpg).  

Firstly, the image is read and the properties are displayed:  
```matlab
Pc = imread('mrt-train.jpg');
whos Pc
```  
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/whos.png" width =  643 height = 89>  

The "x3" in the output shows that the image is read as an RGB image. Therefore, it needs to be converted into a grayscale image.
```matlab
P = rgb2gray(Pc);
imshow(P)
```
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/gray.png" width =  536 height = 390>  

## Linear Contrast Stretching

## Histogram Equalization

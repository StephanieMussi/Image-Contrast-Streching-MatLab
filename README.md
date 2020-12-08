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
The intensities of the grayscale image is checked:  
```matlab
min(P(:)), max(P(:))
```  

<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/1min.png" width =  102 height = 118>
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/1max.png" width =  102 height = 118>  

To map the intensity scope to 0 – 255, firstly subtract 13 to make the minimum intensity 0, then multiplies 255/(204-13) = 255/191 to make the maximum intensity 255.  
There are two approaches: 
__Approach 1:__  
 ```matlab
 P1 = imsubtract(P, 13);
P2 = immultiply(P1, 255/191);
min(P2(:)), max(P2(:))
imshow(P2)
```
The resultant intensity range and image are shown:  
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/2min.png" width =  102 height = 118>
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/2max.png" width =  102 height = 118>  
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/2image.png" width =  536 height = 390>  

__Approach 2:__  
```matlab
P1 = double(P);
P2 = (P1-13).*(255/191);
min(P2(:)), max(P2(:))
imshow(P2,[])
```
The resultant intensity range and image are shown:  
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/3min.png" width =  102 height = 118>
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/3max.png" width =  102 height = 118>  
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/3image.png" width =  536 height = 390>  

## Histogram Equalization
The image intensity histogram of P with 10 bins is displayed in 10 bins and 256 bins:  
```matlab
imhist(P, 10)
```
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/his10_1.png" width =  557 height = 300>  

```matlab
imhist(P, 256);
```
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/his256_1.png" width =  557 height = 300>  

The bin width of the second histogram is smaller than the first one because of the larger bin numbers. The maximum frequency of the second histogram is also smaller than the first one. As compared to the first histogram, the second one shows more individual data.  

Then, the histogram equalization is carried out:  
```matlab
P3 = histeq(P, 255);
imhist(P3, 10);
imhist(P3, 256);
``` 
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/his10_2.png" width =  557 height = 300>  
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/his256_2.png" width =  557 height = 300>  

Both histograms are more uniform than the corresponding histograms before. The similarity is that the intensity ranges of the two histograms are both 0 – 255. The difference is that the frequency of occurrence (indicated by height of bins due to equally spaced bins) of each bin is very close, while in the second histogram this varies.  

Lastly, the histogram equalization is rerun, and the resultant histograms are displayed:  
```matlab
P3 = histeq(P, 255);
imhist(P3, 10);
imhist(P3, 256);
``` 
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/his10_3.png" width =  557 height = 300>  
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/his256_3.png" width =  557 height = 300>  

The histograms did not change after the second equalization.  
The reason is that for a pixel with intensity k, the number of pixels less than or equal to k did not change. Besides, the image size and the number of bins for each histogram also remained constant. According to the equation:  
<img src = "https://github.com/StephanieMussi/Image_Contrast_Streching_MatLab/blob/main/Figures/eq.png" width =  387 height = 123>  
The calculated position of each pixel is the same as its current position. Therefore, the histograms remain the same after the second equalization.  



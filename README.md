# matlab_merfish_misc
Miscellaneous Matlab code for managing merfish images or data  
  
For changing dax into tiffs, need following code from ZhuangLab/matlab-storm/Functions/IO and Functions/Misc:  
CheckParameter.m, CoerceFieldName.m, CreateInfoFileStructure.m, ReadDax.m, ReadInfoFile.m  
Those, with Loic's code changedaxintotiffs.m can change folders of dax files into tiff files for further processing and display on Matlab

## Current functions:  

### getbits21.m
This function can be fed the converted tiff stacks of output images from a MERFISH 21 bit/300 gene library + prestain. It grabs the middle z plane of each laser channel and arranges them in the proper order for reading bits in the codebook.  
Adjust variables stacks and z for use in smaller/larger libraries, to add cell membrane stain images, or to change z plane.  

### analyzebits.m
This function can be fed the output stack of getbits21.m or any other tiff stack of interest, and a chosen first display frame. The chosen frame will pop up, and drawing a rectangle will produce a montage of the selected area across all bits/frames. Comment out of the while loop to not have it update as you adjust the rectangular selection


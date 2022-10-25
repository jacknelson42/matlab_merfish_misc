function bits_stack = getbits21(fileorigin, fovname) 
%{
input fileorigin and fovname strings in format as such:
fileorigin = folder location, eg 'oxpData/600/'
fov name = just fov number, eg '600'
file names of tifs should be someting like 'oxpData/600/stack_0_600.tiff' 
else, adjust lines 13, 16, and 32 such that naming conventions fit
%}

stacks = [0, 1, 2, 3, 4, 5, 6]; %signal stack numbers
z = [19, 12, 5]; %frames for z plane of 6.0 across all laser channels of stack
%get bits stack going - will have to skil this one in the loops w if stmt
bits_stack = imread([fileorigin 'stack_' num2str(stacks(1)) '_' fovname '.tiff'], z(1)); 
%loop for all signal stacks
for i = 1:length(stacks) 
    filename = [fileorigin 'stack_' num2str(stacks(i)) '_' fovname '.tiff']; %set file name
%    bits_info = imfinfo(filename); %grab tif info (not sure if this is necessary in current version)
    if i == 1 %for stack 0 
        for j = 2 : length(z) % for stack ) grab next two bits
            temp_bits = imread(filename, z(j)); %current bit img
            bits_stack = cat(3, bits_stack, temp_bits); %concatenate single frame onto bits stack 
        end
    else %for all other stacks, same procedure but adding three bits instead of two
        for k = 1 : length(z) 
            temp_bits = imread(filename, z(k));
            bits_stack = cat(3, bits_stack, temp_bits); 
        end
    end

end
%now add prestain (for z plane 6, prestain frame is 12)
filename = [fileorigin 'stack_prestain_' fovname '.tiff'];
%prestain_info = imfinfo(filename);
prestain_tiff = imread(filename, 12);
bits_stack = cat(3, bits_stack, prestain_tiff);

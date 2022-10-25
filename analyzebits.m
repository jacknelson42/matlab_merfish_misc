%input the bits_stack product image from getbits21, plus a starting bit to
%use to pick the selection
function analyzebits (bits_stack, bit_start)
figure, imshow(bits_stack(:,:,bit_start)); %show single bit image
selection = drawrectangle(); %select ROI

xmin1 = round(selection.Position(1)); %saves points
xmax1 = round(selection.Position(1)+selection.Position(3));
ymin1 = round(selection.Position(2));
ymax1 = round(selection.Position(2)+selection.Position(4));
figure, montage(bits_stack(ymin1:ymax1, xmin1:xmax1,:)); %shows monage of ROI

while true
    pause(1)
    if xmin1 ~= round(selection.Position(1))
        pause(2)
        xmin2 = round(selection.Position(1));
        xmax2 = round(selection.Position(1)+selection.Position(3));
        ymin2 = round(selection.Position(2));
        ymax2 = round(selection.Position(2)+selection.Position(4));
        figure, montage(bits_stack(ymin2:ymax2, xmin2:xmax2,:));
        xmin1 = xmin2;
        xmax1 = xmax2;
        ymin1 = ymin2;
        ymax1 = ymax2;
    end

end

end

%{
entire workflow:
    1. download dax images of intest
    2. convert to tiffs using changedaxintotiffs.m
    3. ensure filenames are 'sourcefolder/stack_#_fov.tiff
    4. generate and save a stack using getbits21 which makes a single stack form
        stacks 0-6 and prestain all at the z plane 6, in order of codebook,
        currently this is just for 21 bit libraries, is ignoring stack 7 membrane
        stain for now
    5. look through output of getbits21 to find which bit to use to select
        ROI
    6. input entire bits stack and bit number for selection into
        analysebits(bits_stack, bit_start)
    7. select ROI from single image
    8. read bits from montage left to right, top to down. Last image is
        prestain, coorelate with codebook
%}
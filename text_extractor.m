Inputimage=imread('example.jpg');
%% Show image
figure(1)
imshow(Inputimage);
title('INPUT IMAGE WITH NOISE')

%% Convert to gray scale
if size(Inputimage,3)==3 % RGB image
 Inputimage=rgb2gray(Inputimage);
end

threshold = graythresh(Inputimage);
Inputimage =~im2bw(Inputimage,threshold);


Inputimage = bwareaopen(Inputimage,30);
pause(1);

[L Ne]=bwlabel(Inputimage);

propied=regionprops(L,'BoundingBox');
imshow(~Inputimage);
hold on
for n=1:size(propied,1)
  rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
pause (1);

figure
for n=1:Ne
  [r,c] = find(L==n);
  n1=Inputimage(min(r):max(r),min(c):max(c));
  imshow(~n1);
  pause(0.5)
end
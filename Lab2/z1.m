pkg load signal  % biblioteka octave
pkg load image  % biblioteka octave
disp('Odwracanie sinogramu')
temp = imread('../Lab1/sinogram1.jpg');
temp_rot = temp;
temp_w = size(temp,2);  % liczba kolumn sinogramu
temp_h = size(temp,1);  % liczba wierszy sinogramu
sum = zeros(temp_h,180);
angle = 0;
for angle = 1:180
  for i=1:temp_h
    for j=1:temp_w
      sum(i,angle) = sum(i,angle) + double(temp(i,j));
    end
  end
  temp = imrotate(temp,2);
  temp_w = size(temp,2);
end
imshow(sum, [0 70070])
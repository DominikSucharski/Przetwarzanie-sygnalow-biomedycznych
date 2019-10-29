% wymagane pakiety: signals
pkg load image
clc;  % wyczyszczenie okna polece�


% nazwa pliku obrazu
img_name = 'img1.jpg';


raw_img = imread(img_name);

img_info = imfinfo(img_name);  % pobranie info o obrazie

sinogram_width = ceil(img_info.Width*sqrt(2));  % �rodek sinogramu
sinogram = zeros(180, sinogram_width);  % 180 wierszy

for angle = 0:179
  img_r = imrotate(raw_img, angle);  % obracanie obrazu
  column_sum = sum(img_r);  % suma warto�ci w kolumnach obrazu
  [m,n] = size(column_sum);  % pobranie wymiar�w macierzy z sum� kolumn
  offset_left = ceil((sinogram_width - n)/2);
  offset_right = sinogram_width - n - offset_left;
  sinogram(angle+1,:) = [zeros(1, offset_left) column_sum zeros(1, offset_right)];
endfor

%wy�wietlanie sinogramu
colormap('gray')  % lub np. hot
imagesc(sinogram)
colorbar
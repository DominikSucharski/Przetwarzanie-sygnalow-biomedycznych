pkg load signal  % biblioteka octave
pkg load image  % biblioteka octave

temp = imread('../Lab1/img1.jpg');
t = 0;
temp_rot = temp;
temp_w = size(temp,2);  % liczba kolumn sinogramu
temp_h = size(temp,1);  % liczba wierszy sinogramu
down = zeros(size(temp_h));
down(1) = 1;
up = zeros(size(temp_h));
new_down = zeros(size(temp_h));
new_up = zeros(size(temp_h));
n_wector = [1,1,1,1,0.5,0.5,0.5,1,1];
res[];
for t=1:1000
  for i=l:temp_h
    if(i == 1)
      new_down(i) = up(i) * (1 - n_wector(i))
    else
      new_down(i) = down(i-1) * n_wector(i) + up(i) * (1-n_wector(i));
    end
    if(i == temp_h)
      new_up(i) = down(i) * (1 - n_wector(i));
    else
      new_up(i) = up(i+1) * n_wector(i+1) + down(i) * n_wector(i);
    end
  end
  up = new_up;
  down = new_down;
  res = [res up(1)];
end
plot(res)
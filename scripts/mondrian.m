I = imread("../images/mondrian.jpg");

n = size(I, 1);
m = size(I, 2);

O = I;
for i = 1:300
  O = reduceWidth(O, 1);
  O = reduceHeight(O, 1);
end
imwrite(O, "../images/mondrian_whwh_300.png");

O = I;
O = reduceWidth(O, 300);
O = reduceHeight(O, 300);
imwrite(O, "../images/mondrian_wwhh_300.png");

imwrite(imresize(I, [n - 300 m - 300]), "../images/mondrian_resized_300.png");
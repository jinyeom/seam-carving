I = imread("../images/el_capitan.jpg");

n = size(I, 1);
m = size(I, 2);

newm = n * 2 / 3;
r = m - newm;

disp(r);

O = reduceWidth(I, r);
imwrite(O, "../images/el_capitan_iphone.png");
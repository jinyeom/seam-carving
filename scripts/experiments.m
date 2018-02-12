% Experiments for seam carving.
% Author: Jin Yeom (jinyeom@utexas.edu)

I = imread("../images/disney.jpg");

E = energy(I);
imwrite(E, "../images/disney_energy.png");

M = vcummin(E);
imwrite(M, "disney_vcummin.png");

M = hcummin(E);
imwrite(M, "disney_hcummin.png");

O = reduceWidth(I, 10);
imwrite(O, "austin_reduced_vertical_10.png");

O = reduceHeight(I, 10);
imwrite(O, "austin_reduced_horizontal_10.png");
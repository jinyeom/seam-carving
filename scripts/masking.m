I = imread("../images/bored_yann_lecun.jpg");

E = energy(I);
imwrite(E, "../images/bored_yann_lecun_energy.png");

M = imread("../images/bored_yann_lecun_mask_2.jpg");
M = double(M) / 255.0;
imwrite(E .* M, "../images/bored_yann_lecun_energy_masked.png");

for s = 1:150
  E = energy(I);
  E = E .* M;

  S = vseam(E);       % vector of column indices
  n = size(I, 1);     % number of rows
  m = size(I, 2);     % number of columns
    
  C = I(:, 1:m - 1, :);
  R = M(:, 1:m - 1);
  for i = 1:n
    j = S(i); % seam column number
    C(i, j:m - 1, :) = I(i, j + 1:m, :);
    R(i, j:m - 1) = M(i, j + 1:m);
  end
  I = C;
  M = R;
end

imwrite(I, "../images/bored_yann_lecun_reduceWidth_150_masked.png");
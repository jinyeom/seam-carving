function E = energy(I)
%   Compute energy of each pixel in the argument image.
  G = rgb2gray(I);
  [dx, dy] = gradient(G);
  E = abs(dx) + abs(dy);
end
function E = energy(I)
%   Compute energy of each pixel in the argument image.
  G = rgb2gray(I);
  [dx, dy] = imgradientxy(G);
  E = abs(dx) + abs(dy);
  
  % Normalize the energy map.
  min = min(E(:));
  max = max(E(:));
  E = (double(E) - min) / (max - min);
end
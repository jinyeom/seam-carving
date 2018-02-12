function O = reduceHeight(I, n)
% Reduce the argument image I by n pixels, by carving horizontal
% seams n times.

  O = I; % output image
  for i = 1:n
    O = hcarve(O);
  end
end
function O = reduceWidth(I, n)
% Reduce the argument image I by n pixels, by carving vertical
% seams n times.

  O = I; % output image
  for i = 1:n
    O = vcarve(O);
  end
end
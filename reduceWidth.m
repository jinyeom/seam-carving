function O = reduceWidth(I, n)
% Reduce the argument image I by n pixels, by carving vertical
% seams n times.

  O = I; % output image
  E = energy(I);
  for i = 1:n
    [O E] = vcarve(O, E);
    imshow(O);
    imshow(E);
  end
end
function C = hcarve(I)
% Find a horizontal seam with the minimum energy cost and carve 
% it out of the argument image I.

  E = energy(I);      % energy map
  S = hseam(E);       % vector of column indices
  n = size(I, 1);     % number of rows
  m = size(I, 2);     % number of columns
  
  C = I(1:n - 1, :, :);
  for j = 1:m
    i = S(j); % seam column number
    C(i:n - 1, j, :) = I(i + 1:n, j, :);
  end
end
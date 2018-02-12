function C = vcarve(I)
% Find a vertical seam with the minimum energy cost and carve 
% it out of the argument image I.

  E = energy(I);      % energy map
  S = vseam(E);       % vector of column indices
  n = size(I, 1);     % number of rows
  m = size(I, 2);     % number of columns
  
  C = I(:, 1:m - 1, :);
  for i = 1:n
    j = S(i); % seam column number
    C(i, j:m - 1, :) = I(i, j + 1:m, :);
  end
end
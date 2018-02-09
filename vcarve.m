function [C M] = vcarve(I, E)
% Find a vertical seam with the minimum energy cost and carve 
% it out of the argument image I.

  S = vseam(E);   % vector of column indices
  n = size(I, 1); % number of rows
  m = size(I, 2); % number of columns
  
  C = I(:, 1:m - 1);
  M = E(:, 1:m - 1);
  for i = 1:n
    C(i, S(i):(m - 1)) = I(i, (S(i) + 1):m);
    M(i, S(i):(m - 1)) = E(i, (S(i) + 1):m);
  end
end
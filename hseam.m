function S = hseam(I)
% Compute the optimal horizontal seam using Dynamic Programming.
% The seam is returned in a form of vector of coordinates, i.e.,
% [[r1, c1], [r2, c2], ...].

  n = size(I, 1); % number of rows
  m = size(I, 2); % number of columns
  
  E = energy(I);
  M = E;          % cumulative minimum energy
  
  for i = 1:n
    for j = 2:m
      if i == 1
        M(i, j) += min(M(i, j - 1), M(i + 1, j - 1));
      elseif i == n
        M(i, j) += min(M(i - 1, j - 1), M(i, j - 1));
      else
        M(i, j) += min(M(i - 1, j - 1), M(i, j - 1), M(i + 1, j - 1));
      end
    end  
  end
  
  % Backtrack the seam.
  S = zeros(m, 2);
  [v, i] = min(M(:, m));
  S(1) = [i m];
  for p = 2:m
    [i, j] = S(p - 1); % previous pixel
    [v, i] = min(M(i - 1, j - 1), M(i, j - 1), M(i + 1, j - 1));
    S(p) = [i (j - 1)];
  end
end
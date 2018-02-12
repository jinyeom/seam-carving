function S = hseam(E)
% Compute the optimal horizontal seam using Dynamic Programming.
% The seam is returned in a form of a vector of row numbers, 
% i.e., [r1, r2, ..., rm].

  n = size(E, 1);     % number of rows
  m = size(E, 2);     % number of columns
  
  M = accumh(E);
  S = zeros(m, 1);
  [_ i] = min(M(:, m));
  S(m) = i;
  for j = m - 1:-1:1
    i = S(j + 1); % previous coordinates
    if i == 1
      [_ tmp] = min(M(i:i + 1, j));
      S(j) = i + tmp - 1;
    elseif i == n
      [_ tmp] = min(M(i - 1:i, j));
      S(j) = i + tmp - 2;
    else
      [_ tmp] = min(M(i - 1:i + 1, j));
      S(j) = i + tmp - 2;
    end
  end
end
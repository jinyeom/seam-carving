function S = vseam(E)
% Compute the optimal vertical seam using Dynamic Programming.
% The seam is returned in a form of a vector of column numbers, 
% i.e., [c1, c2, ..., cn].

  n = size(E, 1);     % number of rows
  m = size(E, 2);     % number of columns
  
  M = accumv(E);
  S = zeros(n, 1);
  [_ j] = min(M(n, :));
  S(n) = j;
  for i = n - 1:-1:1
    j = S(i + 1); % previous coordinates
    if j == 1
      [_ tmp] = min(M(i, j:j + 1));
      S(i) = j + tmp - 1;
    elseif j == m
      [_ tmp] = min(M(i, j - 1:j));
      S(i) = j + tmp - 2;
    else
      [_ tmp] = min(M(i, j - 1:j + 1));
      S(i) = j + tmp - 2;
    end
  end
end
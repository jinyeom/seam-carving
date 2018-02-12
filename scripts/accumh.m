function M = accumh(E)
% Horizontally accumulate minimum energy given the
% energy map.
  n = size(E, 1);     % number of rows
  m = size(E, 2);     % number of columns
  
  M = E;
  for j = 2:m
    M(1, j) += min(M(1:2, j - 1));
    M(n, j) += min(M(n - 1:n, j - 1));
    for i = 2:n - 1
        M(i, j) += min(M(i - 1:i + 1, j - 1));
    end
  end
end
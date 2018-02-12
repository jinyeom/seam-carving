function M = accumv(E)
% Vertically accumulate minimum energy given the
% energy map.
  n = size(E, 1);     % number of rows
  m = size(E, 2);     % number of columns
  
  M = E;
  for i = 2:n
    M(i, 1) += min(M(i - 1, 1:2));
    M(i, m) += min(M(i - 1, m - 1:m));
    for j = 2:m - 1
        M(i, j) += min(M(i - 1, j - 1:j + 1));
    end
  end
end
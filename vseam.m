function S = vseam(E)
% Compute the optimal vertical seam using Dynamic Programming.
% The seam is returned in a form of vector of coordinates, i.e.,
% [[r1, c1], [r2, c2], ...].

  M = E;          % cumulative minimum energy
  
  n = size(M, 1); % number of rows
  m = size(M, 2); % number of columns
  
  for i = 2:n
    for j = 1:m
      if j == 1
        M(i, j) += min([M(i - 1, j) M(i - 1, j + 1)]);
      elseif j == m
        M(i, j) += min([M(i - 1, j - 1) M(i - 1, j)]);
      else
        M(i, j) += min([M(i - 1, j - 1) M(i - 1, j) M(i - 1, j + 1)]);
      end
    end  
  end
  
  % Visualize cumulative map.
  % imagesc(M);
  
  % Backtrack the seam.
  S = zeros(n, 1);
  [v j] = min(M(n, :));
  
  S(n, 1) = j;
  for i = (n - 1):-1:1
    j = S(i + 1, 1); % previous coordinates
    if j == 1
      [v tmp] = min([M(i, j) M(i, j + 1)]);
      S(i, 1) = j + tmp - 1;
    elseif j == m
      [v tmp] = min([M(i, j - 1) M(i, j)]);
      S(i, 1) = j + tmp - 2;
    else
      [v tmp] = min([M(i, j - 1) M(i, j) M(i, j + 1)]);
      S(i, 1) = j + tmp - 2;
    end
  end
end
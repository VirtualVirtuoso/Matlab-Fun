% APPEM Approximate the Euler-Macheroni constant by the rational number p/q,
%       among all the pairs of (p, q) such that p/q<N
function [p, q] = AppEm(N)
  EM_CONST = 0.577215664901533;
  results = zeros(N-1, N-1, 'double');
  
  % Go through each of the pairs and determine the (p/q) - const
  for i=1:N-1
    maxJ = N-i
    for j=1:maxJ
      possibleP = i;
      possibleQ = j;
      calculated = (possibleP / possibleQ) - EM_CONST;
      results(i,j) = abs(calculated);
     endfor
  endfor
  
  indexI = 1;
  indexJ = 1;
  valueOfSmallest = 1000000; % Arbitrarily high figure
  
  % Go through each of the results, and determine the smallest
  for i=1:N-1
    for j=1:N-1
      if(results(i,j) < valueOfSmallest && results(i, j) > 0)
        valueOfSmallest = results(i,j);
        indexI = i;
        indexJ = j;
      endif
    endfor
  endfor
  
  % We then take the found index of the smallest such value, and determine
  % p and q
  
  p = indexI;
  q = indexJ;
  
  results

    
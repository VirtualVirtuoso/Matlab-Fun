% ISLUCKYNUM: Returns true if the number is found to be lucky, and false 
%             otherwise
function result = isLuckyNum(n)
  number = n;
  
  % By the definition, if the number is prime, then it is not lucky since it has
  % only one prime factor 
  if(isprime(number))
    fprintf("%d is prime\n", n);
    result = false;
    return;
  endif
  
  % Go through each of the factors and check if any are odd
  for i = number:-1:1
    if(mod(number, i) == 0)
      if(mod(i, 2) == 0)
        fprintf("%d has an even factor\n", n);
        result = false;
        return;
      endif
    endif
  endfor
  
  % Now determine the prime factors for the given number, and store them in an
  % array.
  primeFactors = [];
  factors = [];
  for i = number:-1:1
    if(mod(number, i) == 0)
      factors = [factors, i];
      if(isprime(i))
        primeFactors = [primeFactors, i];
      endif
    endif
  endfor
  
  % Now determine if each of the prime factors are distinct. We do this by
  % squaring each of the found prime factors, and then seeing if those are
  % themselves a factor. If so, we have a repeated prime factor.
  primeFactorsSquared = [];
  for i = 1:numel(primeFactors)
    primeFactors(i);
    primeFactorsSquared(i) = primeFactors(i) * primeFactors(i);
  endfor
 
  factors;
  primeFactors;
  primeFactorsSquared;
  
  for i = 1:numel(primeFactorsSquared)
    if ismember(primeFactorsSquared(i), factors)
      fprintf("%d does not have distinct prime factors\n", n);
      result = false;
      return;
    endif
  endfor
  
  % Now check that for any prime factor, (p-1) % (n - 1)
  oneLess = number - 1;
  for i = 1:numel(primeFactors)
    factor = primeFactors(i) - 1;
    if(!(mod(oneLess, factor) == 0))
      fprintf("%d does not satify (p-1) / (n-1)\n", n);
      result = false;
      return;
    endif
  endfor
  
  % If the code executes this far, it means we've met all the conditions
  fprintf("%d is a magic number!\n", n);
  result = true;

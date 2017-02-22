function result = closestmagicnum(n)

  squared = n^2;
  squaredString = num2str(squared);
  digits = [];
  
  
  for i=1:numel(squaredString)
    digits = [digits, str2num(squaredString(i))];
  endfor
  
  for i=1:9
    if(!any(digits == i))
      fprintf("%d is not a digit\n", i);
      result = false;
      return;
    endif
  endfor
  
  result = true;
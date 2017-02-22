% LUCKYNUM Find the smallest lucky number which is greater than or equal to N
function n = luckynum(N)
  
  luckyFound = false;
  luckyNum = 0;
  currentN = N;
  
  while (!luckyFound)
    if (isLuckyNum(currentN))
      n = currentN;
      luckyFound = true;
    else
      currentN++;
      continue;
    endif
    break;
  endwhile
  
function intersection = LinesIntersect(point1, point2, point3, point4)
  
  lineP12DistanceX = point2(1) - point1(1);
  lineP12DistanceY = point2(2) - point1(2);
  lineP34DistanceX = point4(1) - point3(1);
  lineP34DistanceY = point4(2) - point3(2);
  
  denominator = (lineP12DistanceX * lineP34DistanceY) - ...
                (lineP34DistanceX * lineP12DistanceY);
  positiveDenominator = false;
  
  if(denominator == 0)
    intersection = false; % No intersection
    return;
  elseif(denominator > 0)
    positiveDenominator = true;
  endif
  
  lineP13DistanceX = point1(1) - point3(1);
  lineP13DistanceY = point1(2) - point3(2);
  inter1Numerator = (lineP12DistanceX * lineP13DistanceY) - ...
                    (lineP12DistanceY * lineP13DistanceX);
  negativeInter1Numerator = (inter1Numerator < 0);
  
  if(negativeInter1Numerator == positiveDenominator)
    intersection = false; % No intersection
    return;
  endif
  
  inter2Numerator = (lineP34DistanceX * lineP13DistanceY) - ... 
                    (lineP34DistanceY * lineP13DistanceX);
  negativeInter2Numerator = (inter2Numerator < 0);
  
  if(negativeInter2Numerator == positiveDenominator)
    intersection = false; % No intersection
    return;
  endif
  
  check1 = (inter1Numerator > denominator) == positiveDenominator;
  check2 = (inter2Numerator > denominator) == positiveDenominator;
  
  if(check1 || check2)
    intersection = false; % No intersection
    return;
  endif
 
  intersection = true; % Intersection found

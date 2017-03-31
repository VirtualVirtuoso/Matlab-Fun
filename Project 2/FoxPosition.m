function [fox] = FoxPosition(fox, rabbit, scene, config)
                                           
  % Set up the scene based on function parameters
  traverseTowards = rabbit.Position;
  
  if(!LineOfSight(fox.Position, rabbit.Position, scene))
    % Rabbit is not visible, run to next corner
    if(fox.Position(2) < scene.WarehouseNW(2)) % Visited? NW Corner
      traverseTowards = scene.WarehouseNW;
    endif
    if(fox.Position(2) < scene.WarehouseSW(2)) % Cascade, SW corner
      traverseTowards = scene.WarehouseSW;
    endif  
  endif
 
  % Determine the distance the fox needs to travel 
  differenceX = traverseTowards(1) - fox.Position(1);
  differenceY = traverseTowards(2) - fox.Position(2);
  distanceEuclid = sqrt(differenceX^2 + differenceY^2);
  
  % Determine exponential decay factors
  if(config.SpeedDecay)
    decayedSpeed = fox.Speed * exp(-fox.SpeedDecay * fox.Distance);
    distanceStep = decayedSpeed * config.TimeIncrement;
  else
    distanceStep = fox.Speed * config.TimeIncrement;
  endif
  
  percentTravelled = distanceStep / distanceEuclid; 
  fox.Distance = fox.Distance + distanceStep;
  
  % Convert the direct distance into X and Y distances
  distanceX = percentTravelled * differenceX;
  distanceY = percentTravelled * differenceY;
  
  % Update the fox's position
  positionX = fox.Position(1) + distanceX;
  positionY = fox.Position(2) + distanceY;
  fox.Position = [positionX, positionY];
  
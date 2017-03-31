function [rabbit] = RabbitPosition(rabbit, scene, config)
  
  % Determine the direct distance the rabbit will travel
  differenceX = scene.BURROW(1) - scene.RABBIT_START(1);
  differenceY = scene.BURROW(2) - scene.RABBIT_START(2);
  distanceEuclid = sqrt(differenceX^2 + differenceY^2);
   
  if(config.SPEED_DECAY)
    decayedSpeed = rabbit.Speed * exp(-rabbit.SPEED_DECAY * rabbit.Distance);
    distanceStep = decayedSpeed * config.TIME_INCREMENT;
  else
    distanceStep = rabbit.Speed * config.TIME_INCREMENT;
  endif
  
  percentTravelled = distanceStep / distanceEuclid; 
  rabbit.Distance = rabbit.Distance + distanceStep;

  % Convert this into X and Y distances
  distanceX = percentTravelled * differenceX;
  distanceY = percentTravelled * differenceY;
  
  % Update the Rabbit's position
  positionX = rabbit.Position(1) + distanceX;
  positionY = rabbit.Position(2) + distanceY;
  rabbit.Position = [positionX, positionY];
  
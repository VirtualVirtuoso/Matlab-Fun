function [rabbit] = RabbitPosition(rabbit, scene, config)
  
  % Determine the direct distance the rabbit will travel
  differenceX = scene.Burrow(1) - scene.RabbitStart(1);
  differenceY = scene.Burrow(2) - scene.RabbitStart(2);
  distanceEuclid = sqrt(differenceX^2 + differenceY^2);
   
  if(config.SpeedDecay)
    decayedSpeed = rabbit.Speed * exp(-rabbit.SpeedDecay * rabbit.Distance);
    distanceStep = decayedSpeed * config.TimeIncrement;
  else
    distanceStep = rabbit.Speed * config.TimeIncrement;
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
  
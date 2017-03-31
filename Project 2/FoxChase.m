function rabbitCaught = FoxChase(timeIncrement, speedDecay)
  
  scene = struct; % Struct representing the simulation scene
  scene.FoxStart      = [250, -550];
  scene.RabbitStart   = [0, 0];
  scene.Burrow        = [600, 600];
  scene.WarehouseSW   = [200, -400];
  scene.WarehouseNW   = [200, 0];
  scene.WarehouseNE   = [800, 0]; % Arbitrary X, needed to define north wall
  scene.WarehouseSE   = [800, -400]; % Arbitrary X, needed to define south wall
  scene.CurrentTime   = 0;
  scene.RabbitCaught  = false;
  scene.RabbitEscaped = false;
  
  config = struct; % Struct representing abstract configuration
  config.DistanceCatch = 0.2; % Minimum distance for fox to catch rabbit
  config.TimeIncrement = timeIncrement; % Fidelity of the simulation
  config.SpeedDecay    = speedDecay; % If speed decay is simulated
  
  fox = struct;
  fox.SpeedDecay = 0.0002;
  fox.Speed      = 16;
  fox.Position   = scene.FoxStart;
  fox.Distance   = 0;
  fox.History    = [];
  
  rabbit = struct;
  rabbit.Speed      = 13;
  rabbit.SpeedDecay = 0.0007;
  rabbit.Position   = scene.RabbitStart;
  rabbit.Distance   = 0;
  rabbit.History    = [];
  
  % Continue until a termination condition is met
  while(1)
    
    rabbit = RabbitPosition(rabbit, scene, config); % Update position
    fox = FoxPosition(fox, rabbit, scene, config); % Update position
    
    rabbitRecord = [scene.CurrentTime, rabbit.Position(1), rabbit.Position(2)];
    rabbit.History = [rabbit.History; rabbitRecord];
    
    foxRecord = [scene.CurrentTime, fox.Position(1), fox.Position(2)]; 
    fox.History = [fox.History; foxRecord];
    
    % Check if the rabbit has entered its burrow
    rabbitBurrowDistance = EntityDistance(rabbit.Position, scene.Burrow);
    if(rabbitBurrowDistance <= 13 * config.TimeIncrement)
      scene.RabbitEscaped = true;
      disp "The Rabbit escaped...";
      break;
    endif
    
    % Check if the fox had caught the rabbit
    rabbitFoxDistance = EntityDistance(rabbit.Position, fox.Position);
    if(rabbitFoxDistance <= config.DistanceCatch)
      scene.RabbitCaught = true;
      disp "The Rabbit was caught...";
      break;
    endif
    
    scene.CurrentTime = scene.CurrentTime + config.TimeIncrement;
  endwhile 
  
  % Plot the history and display it to the user
  PlotHistory(fox.History, rabbit.History);
 
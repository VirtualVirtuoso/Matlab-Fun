function rabbitCaught = FoxChase(timeIncrement, speedDecay)
  
  scene = struct; % Struct representing the simulation scene
  scene.FOX_START     = [250, -550];
  scene.RABBIT_START  = [0, 0];
  scene.BURROW        = [600, 600];
  scene.WAREHOUSE_SW  = [200, -400];
  scene.WAREHOUSE_NW  = [200, 0];
  scene.WAREHOUSE_NE  = [800, 0]; % Arbitrary X, needed to define north wall
  scene.WAREHOUSE_SE  = [800, -400]; % Arbitrary X, needed to define south wall
  scene.CurrentTime   = 0;
  scene.RabbitCaught  = false;
  scene.RabbitEscaped = false;
  
  config = struct; % Struct representing abstract configuration
  config.DISTANCE_CATCH = 0.2; % Minimum distance for fox to catch rabbit
  config.TIME_INCREMENT = timeIncrement; % Fidelity of the simulation
  config.SPEED_DECAY    = speedDecay; % If speed decay is simulated
  
  fox = struct;
  fox.SPEED_DECAY = 0.0002;
  fox.Speed       = 16;
  fox.Position    = scene.FOX_START;
  fox.Distance    = 0;
  fox.History     = [];
  
  rabbit = struct;
  rabbit.Speed       = 13;
  rabbit.SPEED_DECAY = 0.0007;
  rabbit.Position    = scene.RABBIT_START;
  rabbit.Distance    = 0;
  rabbit.History     = [];
  
  % Continue until a termination condition is met
  while(1)
    
    rabbit = RabbitPosition(rabbit, scene, config); % Update position
    fox = FoxPosition(fox, rabbit, scene, config); % Update position
    
    rabbitRecord = [scene.CurrentTime, rabbit.Position(1), rabbit.Position(2)];
    rabbit.History = [rabbit.History; rabbitRecord];
    
    foxRecord = [scene.CurrentTime, fox.Position(1), fox.Position(2)]; 
    fox.History = [fox.History; foxRecord];
    
    % Check if the rabbit has entered its burrow
    rabbitBurrowDistance = EntityDistance(rabbit.Position, scene.BURROW);
    if(rabbitBurrowDistance <= 13 * config.TIME_INCREMENT)
      scene.RabbitEscaped = true;
      disp "The Rabbit escaped...";
      break;
    endif
    
    % Check if the fox had caught the rabbit
    rabbitFoxDistance = EntityDistance(rabbit.Position, fox.Position);
    if(rabbitFoxDistance <= config.DISTANCE_CATCH)
      scene.RabbitCaught = true;
      disp "The Rabbit was caught...";
      break;
    endif
    
    scene.CurrentTime = scene.CurrentTime + config.TIME_INCREMENT;
  endwhile 
  
  % Plot the history and display it to the user
  PlotHistory(fox.History, rabbit.History);
  scene.CurrentTime
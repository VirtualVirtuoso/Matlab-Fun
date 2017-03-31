function PlotHistory(rabbitData, foxData)
  
  rabbitX = rabbitData(:,2); % Rabbit Path
  rabbitY = rabbitData(:,3);
  foxX = foxData(:,2); % Fox Path
  foxY = foxData(:,3);
  buildingX = [200, 200, 700, 700, 200]; % Building Plot
  buildingY = [0, -400, -400, 0, 0];
  
  plot(rabbitX, rabbitY, '-o', foxX, foxY, '-o', buildingX, buildingY);
  
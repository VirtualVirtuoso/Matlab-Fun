function PlotHistory(rabbitData, foxData)
  
  % Rabbit Subplot
  rabbitX = rabbitData(:,2);
  rabbitY = rabbitData(:,3);
  
  % Fox Subplot
  foxX = foxData(:,2);
  foxY = foxData(:,3);
  
  % Building Subplot
  buildingX = [200, 200, 700, 700, 200];
  buildingY = [0, -400, -400, 0, 0];
  
  plot(rabbitX, rabbitY, '-o', foxX, foxY, '-o', buildingX, buildingY);
  
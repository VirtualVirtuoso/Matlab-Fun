function distance = EntityDistance(entity1, entity2)
  
  % Simple Eulerian distance between the rabbit and the fox
  distanceX = abs(entity1(1) - entity2(1));
  distanceY = abs(entity1(2) - entity2(2));
  distance = sqrt(distanceX^2 + distanceY^2);

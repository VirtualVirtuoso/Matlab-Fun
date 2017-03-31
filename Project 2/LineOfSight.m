function visible = LineOfSight(entity1, entity2, scene)

  if(LinesIntersect(scene.WarehouseSW, scene.WarehouseSE, entity1, entity2))
    visible = false; % South wall is between the entities
    return;
  endif
 
  if(LinesIntersect(scene.WarehouseSW, scene.WarehouseNW, entity1, entity2))
    visible = false; % West wall is between the entities
    return;
  endif
  
  if(LinesIntersect(scene.WarehouseNW, scene.WarehouseNE, entity1, entity2))
    visible = false; % North wall is between the entities
    return;
  endif
  
  visible = true; % No walls between entities
  
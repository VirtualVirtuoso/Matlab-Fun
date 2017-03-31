function visible = LineOfSight(entity1, entity2, scene)

  if(LinesIntersect(scene.WAREHOUSE_SW, scene.WAREHOUSE_SE, entity1, entity2))
    visible = false; % South wall is between the entities
    return;
  endif
 
  if(LinesIntersect(scene.WAREHOUSE_SW, scene.WAREHOUSE_NW, entity1, entity2))
    visible = false; % West wall is between the entities
    return;
  endif
  
  if(LinesIntersect(scene.WAREHOUSE_NW, scene.WAREHOUSE_NE, entity1, entity2))
    visible = false; % North wall is between the entities
    return;
  endif
  
  visible = true; % No walls between entities
  
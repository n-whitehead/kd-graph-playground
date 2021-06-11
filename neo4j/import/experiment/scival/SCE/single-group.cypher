MATCH (g:Group {name: 'TEST_GROUP'})<-[:belongsTo]-()<-[:references]-(r:Work)
  WHERE NOT (g)<-[:belongsTo]-(r)
MERGE (g)<-[:referenceOf]->(r);

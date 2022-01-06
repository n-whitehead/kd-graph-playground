/*
 * Using GDS, we will attempt to find a nice "representative" subgraph of any c-graph instance.
 */
// Try to query for a set of nodes AFTER a certain date.
CALL apoc.periodic.iterate(
  'MATCH (w) WHERE w:Journal OR ((w:Article OR w:Book OR w:Chapter) AND size((w)--()) > 0) RETURN w',
  'SET w:SubWork',
  {batchSize: 100000, parallel: true}
);
// Next, given our SubWork label, we can find the authors of those SubWorks. This guarantees authorship.
CALL apoc.periodic.iterate(
  'MATCH (a:Person)-[:authorOf]->(:SubWork) RETURN a',
  'SET a:SubPerson',
  {batchSize: 100000, parallel: true}
);
// Finally, we can match Organizations that have our author affiliations, or originated Works
CALL apoc.periodic.iterate(
  'MATCH (o:Organization)-[:originated]->(:SubWork) RETURN o UNION MATCH (o:Organization)<-[:hasAffiliation]-(:SubPerson) RETURN o',
  'SET o:SubOrganization',
  {batchSize: 100000, parallel: true}
);
CALL gds.graph.create.estimate(
  ['SubWork', 'SubPerson', 'SubOrganization'],
  ['authorOf', 'childOf', 'hasAffiliation', 'references', 'originated', 'partOf']
);
CALL gds.graph.create(
  'c-sub-graph',
  ['SubWork', 'SubPerson', 'SubOrganization'],
  ['authorOf', 'childOf', 'hasAffiliation', 'references', 'originated', 'partOf']
) YIELD graphName
CALL gds.labelPropagation.stream(graphName)
YIELD nodeId, communityId
WITH communityId, collect(nodeId) AS nodeIds, count(nodeId) AS numNodeIds
  ORDER BY numNodeIds DESC LIMIT 1
// export this graph to a new db
// export db as dump file to s3
MATCH (n)-[r]->(m)
  WHERE id(n) IN nodeIds AND id(m) IN nodeIds
CALL {
  WITH nodeIds
  MATCH (n)-[r]->(m)
    WHERE id(n) IN nodeIds AND id(m) IN nodeIds
  RETURN n AS source, r AS rel, m AS target
  UNION
  WITH nodeIds
  MATCH (n)<-[r]-(i:Identifier)
    WHERE id(n) IN nodeIds
  RETURN i AS source, r AS rel, n AS target
}
WITH collect(source)+collect(target) AS nodes, collect(rel) AS rels
CALL apoc.export.json.data(nodes, rels, "c-sub-graph.json", null)
YIELD file, source, format, nodes, relationships, properties, time, rows, batchSize, batches, done, data
RETURN file, source, format, nodes, relationships, properties, time, rows, batchSize, batches, done, data

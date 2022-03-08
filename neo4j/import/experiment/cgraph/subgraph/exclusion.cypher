/*
  Rules for valid subgraph-able nodes:
  Work:
    1. Cannot have a Dummy node label
    2. Node must have a degree > 1
  Person:
    1. Must be an author (ie. must be an authorOf at least one Work node from the set defined above)
  Organization:
    1. Node must have a degree > 1
*/
// First, set  candidate Work nodes
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

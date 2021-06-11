/****
  1. Find a reference to a work in a group
  2. Find the set of parent groups for the reference and the work
  3. Take the difference of these groups
  4. Create a 'referenceOf' relationship between the reference and the parent group(s)
****/
MATCH (ref:Work)-[:references]->(work:Work)-[:belongsTo]->(wg:Group)
  // WHERE ($referenceID IS NULL) OR (ref.ID = $referenceID)
MATCH (wg)-[:inGroup*0..]->(wp:Group)
  WHERE NOT (wp)-[:inGroup]->()
OPTIONAL MATCH (rp:Group)<-[:inGroup*0..]-(:Group)<-[:belongsTo]-(ref)
  WHERE NOT (rp)-[:inGroup]->()
WITH ref, collect(wp) AS work_parent, collect(rp) AS ref_parent
WITH ref, [g IN work_parent WHERE NOT g IN ref_parent] AS delta
UNWIND delta AS parent
MERGE (ref)-[:referenceOf]->(parent)
WITH parent AS group
RETURN group.name AS group, size((group)<-[:referenceOf]-()) AS citationCount

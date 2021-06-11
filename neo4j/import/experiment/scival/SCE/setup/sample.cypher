// Create an arbitrary group configuration
CREATE
  (`0` :Group {name:"Group 0"}) ,
  (`1` :Group {name:"Group 1"}) ,
  (`2` :Group {name:"Group 2"}) ,
  (`3` :Group {name:"Group 3"}) ,
  (`0`)-[:`inGroup` ]->(`1`),
  (`1`)-[:`inGroup` ]->(`3`),
  (`1`)-[:`inGroup` ]->(`2`);
MATCH (groups:Group)
CALL {
  MATCH (works:Work)
  RETURN works ORDER BY rand() LIMIT 10000
}
WITH groups, works
UNWIND groups AS group
UNWIND works AS work
CREATE (group)<-[:belongsTo]-(work);

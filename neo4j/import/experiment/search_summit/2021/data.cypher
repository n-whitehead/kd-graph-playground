MATCH p=(:Resource)<-[:hasSubject]-(w:Work)<-[:authorOf]-(a)
OPTIONAL MATCH q=(w)-[:references]-(:Work)-[:hasSubject]->(:Resource)
OPTIONAL MATCH r=(a)-[:hasAffiliation]->(o:Organization)
OPTIONAL MATCH s=(w)<-[:originated]-(o)
WITH collect(p)+collect(q)+collect(r)+collect(s) AS paths
UNWIND paths AS path
UNWIND nodes(path) AS n
MATCH id=(n)<-[:identifies]-(:Identifier)
WITH collect(id)+paths AS paths
CALL apoc.graph.fromPaths(paths, 'seachsummit2021', {})
YIELD graph
CALL apoc.export.cypher.graph(graph, 'searchsummit.cypher', {})
YIELD time, nodes, relationships
RETURN time, nodes, relationships;

// Load Cypher FROM CLI
// cat searchsummit.cypher | cypher-shell -u neo4j -p changeme -d searchsummit

// Generate dump file
// neo4j-admin dump --database=searchsummit --to=/mnt/data/dumps/searchsummit.dump

// Pull dump file
// neo4j-admin load --from=/mnt/data/dumps/searchsummit.dump --database=searchsummit --force

// Examples
// Physics http://data.elsevier.com/vocabulary/OmniScience/Concept-170589438
// Mechanics http://data.elsevier.com/vocabulary/OmniScience/Concept-210638324
// Mechanical Modeling http://data.elsevier.com/vocabulary/OmniScience/Concept-472542604
// Applied Mechanics http://data.elsevier.com/vocabulary/OmniScience/Concept-249568328


CREATE (c1:Concept { uri: 'https://data.elsevier.com/vocab/OmniScience/Concept-aconcept' }),
       (c2:Concept { uri: 'https://data.elsevier.com/vocab/OmniScience/Concept-anotherconcept' }),
       (c3:Concept {uri: 'https://data.elsevier.com/vocab/OmniScience/Concept-afinalconcept'}),
       (pl1:Label {uri: 'https://data.elsevier.com/vocab/OmniScience/Label-aLabel', literalForm: ['A Label@en'] }),
       (pl2:Label {uri: 'https://data.elsevier.com/vocab/OmniScience/Label-anotherLabel', literalForm: ['Another Label@en'] }),
       (pl3:Label {uri: 'https://data.elsevier.com/vocab/OmniScience/Label-aThirdLabel', literalForm: ['A Third Label@en'] }),
       (pl4:Label {uri: 'https://data.elsevier.com/vocab/OmniScience/Label-finalLabel', literalForm: ['Final Label@en']}),
       (w1:Work { ID: 'work1', PublishedDate:'202106' } ),
       (w2:Work { ID: 'work2', PublishedDate:'202106' } ),
       (w3:Work { ID: 'work3', PublishedDate:'202106' } ),
       (w4:Work {ID: 'work4', PublishedDate:'202106'}),
       (w5:Work {ID: 'work5', PublishedDate:'202107'}),
       (w6:Work {ID: 'work6', PublishedDate:'202102'}),
       (w7:Work {ID: 'work7', PublishedDate:'202101'}),
       (ref1:Work { ID: 'ref1', PublishedDate: '202107' } ),
       (ref2:Work { ID: 'ref2', PublishedDate: '202001' } ),
       (ref3:Work { ID: 'ref3', PublishedDate: '200908' } ),
       (ref4:Work { ID: 'ref4', PublishedDate: '201206' } ),
       (ref5:Work { ID: 'ref5', PublishedDate: '199912' } ),
       (ref6:Work {ID: 'ref6', PublishedDate:'202012'}),
       (ref7:Work {ID: 'ref7', PublishedDate:'202011'}),
       (ref8:Work {ID: 'ref8', PublishedDate:'202002'}),
       (ref9:Work {ID: 'ref9', PublishedDate:'202101'}),
       (ref10:Work {ID: 'ref10', PublishedDate:'202107'}),
       (ref11:Work {ID: 'ref11', PublishedDate:'200101'}),
       (ref12:Work {ID: 'ref12', PublishedDate:'200102'}),
       (ref13:Work {ID: 'ref13', PublishedDate:'200007'}),
       (ref14:Work {ID: 'ref14', PublishedDate:'198501'}),
       (ref15:Work {ID: 'ref15', PublishedDate:'199002'}),
       (ref16:Work {ID: 'ref16', PublishedDate:'200006'}),
       (p1:Person { ID: 'person1' } ),
       (p2:Person { ID: 'person2' } ),
       (p3:Person { ID: 'person3' } ),
       (p4:Person { ID: 'person4' } ),
       (p5:Person { ID: 'person5' } )
WITH c1,c2,c3,pl1,pl2,pl3,pl4,w1,w2,w3,w4,w5,w6,w7,ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10,ref11,ref12,ref13,ref14,ref15,ref16,p1,p2,p3,p4,p5
MERGE (c1)-[:prefLabel]->(pl1)
MERGE (c1)-[:prefLabel]->(pl2)
MERGE (c2)-[:prefLabel]->(pl3)
MERGE (c3)-[:prefLabel]->(pl4)
MERGE (w1)-[:hasSubject]->(c1)
MERGE (ref1)-[:hasSubject]->(c1)
MERGE (ref5)-[:hasSubject]->(c1)
MERGE (w2)-[:hasSubject]->(c1)
MERGE (ref3)-[:hasSubject]->(c1)
MERGE (ref2)-[:hasSubject]->(c1)
MERGE (ref3)-[:hasSubject]->(c2)
MERGE (w2)-[:hasSubject]->(c2)
MERGE (ref4)-[:hasSubject]->(c2)
MERGE (w3)-[:hasSubject]->(c2)
MERGE (ref1)-[:references]->(w1)
MERGE (ref2)-[:references]->(w1)
MERGE (ref5)-[:references]->(w1)
MERGE (w2)-[:references]->(w1)
MERGE (ref5)-[:references]->(w2)
MERGE (ref4)-[:references]->(w2)
MERGE (ref3)-[:references]->(w2)
MERGE (ref4)-[:references]->(w3)
MERGE (p1)-[:authorOf]->(w1)
MERGE (p2)-[:authorOf]->(w1)
MERGE (p3)-[:authorOf]->(w1)
MERGE (p3)-[:authorOf]->(w2)
MERGE (p4)-[:authorOf]->(w2)
MERGE (p4)-[:authorOf]->(w3)
MERGE (p5)-[:authorOf]->(w3)
MERGE (c3)<-[:hasSubject]-(w4)
MERGE (c3)<-[:hasSubject]-(w5)
MERGE (c3)<-[:hasSubject]-(w6)
MERGE (c3)<-[:hasSubject]-(w7)
MERGE (c2)<-[:hasSubject]-(w5)
MERGE (c3)<-[:hasSubject]-(ref6)
MERGE (c3)<-[:hasSubject]-(ref7)
MERGE (c3)<-[:hasSubject]-(ref8)
MERGE (c3)<-[:hasSubject]-(ref9)
MERGE (c3)<-[:hasSubject]-(ref10)
MERGE (w4)<-[:authorOf]-(p1)
MERGE (w4)<-[:authorOf]-(p2)
MERGE (w4)<-[:authorOf]-(p3)
MERGE (w5)<-[:authorOf]-(p3)
MERGE (w5)<-[:authorOf]-(p4)
MERGE (w5)<-[:authorOf]-(p5)
MERGE (w6)<-[:authorOf]-(p1)
MERGE (w6)<-[:authorOf]-(p3)
MERGE (w6)<-[:authorOf]-(p5)
MERGE (w7)<-[:authorOf]-(p2)
MERGE (w7)<-[:authorOf]-(p4)
MERGE (ref6)-[:references]->(w4)
MERGE (ref6)-[:references]->(w5)
MERGE (ref6)-[:references]->(w6)
MERGE (ref7)-[:references]->(w4)
MERGE (ref7)-[:references]->(w6)
MERGE (ref8)-[:references]->(w7)
MERGE (ref8)-[:references]->(w4)
MERGE (ref9)-[:references]->(w5)
MERGE (ref9)-[:references]->(w6)
MERGE (ref10)-[:references]->(w5)
MERGE (ref10)-[:references]->(w7)
MERGE (ref11)-[:hasSubject]->(c1)
MERGE (ref12)-[:hasSubject]->(c1)
MERGE (ref13)-[:hasSubject]->(c1)
MERGE (ref14)-[:hasSubject]->(c1)
MERGE (ref15)-[:hasSubject]->(c1)
MERGE (ref16)-[:hasSubject]->(c1)
MERGE (ref11)-[:references]->(w1)
MERGE (ref11)-[:references]->(w2)
MERGE (ref12)-[:references]->(w1)
MERGE (ref12)-[:references]->(w2)
MERGE (ref13)-[:references]->(w1)
MERGE (ref13)-[:references]->(w2)
MERGE (ref14)-[:references]->(w1)
MERGE (ref14)-[:references]->(w2)
MERGE (ref15)-[:references]->(w1)
MERGE (ref15)-[:references]->(w2)
MERGE (ref16)-[:references]->(w1)
MERGE (ref16)-[:references]->(w2)




/*

1. For each concept, find contributors
  a. A contributor is an author who authored a publication in that concept AND has at least 1 reference by a work in that concept
  b. For each contributor, We need to look at their work in the space
    i. For each work, get total author count, and list of references
*/

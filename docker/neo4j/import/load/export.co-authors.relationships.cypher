MATCH (n1:`Person`{`ID`:"53982524900"}), (n2:`Article`{`ID`:"84995486141"}) CREATE (n1)-[r:`authorOf`]->(n2);
MATCH (n1:`Person`{`ID`:"56823892600"}), (n2:`Article`{`ID`:"49449122753"}) CREATE (n1)-[r:`authorOf`]->(n2);
MATCH (n1:`Person`{`ID`:"7003443189"}), (n2:`Article`{`ID`:"49449122753"}) CREATE (n1)-[r:`authorOf`]->(n2);

MATCH (n1:`Person`{`ID`:"23395077000"}), (n2:`Article`{`ID`:"1663161"}) CREATE (n1)-[r:`authorOf`]->(n2);

MATCH (n1:`Person`{`ID`:"56823892600"}), (n2:`Article`{`ID`:"1663161"}) CREATE (n1)-[r:`authorOf`]->(n2);

MATCH (n1:`Person`{`ID`:"7003863236"}), (n2:`Article`{`ID`:"1663161"}) CREATE (n1)-[r:`authorOf`]->(n2);

MATCH (n1:`Person`{`ID`:"16024936000"}), (n2:`Work`{`ID`:"15019709787"}) CREATE (n1)-[r:`authorOf`]->(n2);

MATCH (n1:`Person`{`ID`:"26024985600"}), (n2:`Work`{`ID`:"25019709788"}) CREATE (n1)-[r:`authorOf`]->(n2);
MATCH (n1:`Person`{`ID`:"36025008000"}), (n2:`Work`{`ID`:"25019709788"}) CREATE (n1)-[r:`authorOf`]->(n2);

MATCH (n1:`Person`{`ID`:"36025008000"}), (n2:`Work`{`ID`:"34871818382"}) CREATE (n1)-[r:`authorOf`]->(n2);
MATCH (n1:`Person`{`ID`:"40038817800"}), (n2:`Work`{`ID`:"34871818382"}) CREATE (n1)-[r:`authorOf`]->(n2);


MATCH (n1:`Person`{`ID`:"deleteAuthor1"}), (n2:`Work`{`ID`:"deleteWork1"}) CREATE (n1)-[r:`authorOf`]->(n2);

MATCH (n1:`Person`{`ID`:"deleteAuthor2"}), (n2:`Work`{`ID`:"deleteWork2"}) CREATE (n1)-[r:`authorOf`]->(n2);
MATCH (n1:`Person`{`ID`:"deleteAuthor3"}), (n2:`Work`{`ID`:"deleteWork2"}) CREATE (n1)-[r:`authorOf`]->(n2);


MATCH (n1:`Person`{`ID`:"deleteAuthor4"}), (n2:`Work`{`ID`:"deleteWork3"}) CREATE (n1)-[r:`authorOf`]->(n2);

MATCH (n1:`Person`{`ID`:"deleteAuthor5"}), (n2:`Work`{`ID`:"deleteWork4"}) CREATE (n1)-[r:`authorOf`]->(n2);
MATCH (n1:`Person`{`ID`:"deleteAuthor6"}), (n2:`Work`{`ID`:"deleteWork4"}) CREATE (n1)-[r:`authorOf`]->(n2);
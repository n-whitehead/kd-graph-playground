MATCH (n1:`Person`{`ID`:"16024936000"}), (n2:`Article`{`ID`:"15019709787"}) CREATE (n1)-[r:`authorOf`]->(n2);

MATCH (n1:`Person`{`ID`:"26024985600"}), (n2:`Article`{`ID`:"25019709788"}) CREATE (n1)-[r:`authorOf`]->(n2);
MATCH (n1:`Person`{`ID`:"36025008000"}), (n2:`Article`{`ID`:"25019709788"}) CREATE (n1)-[r:`authorOf`]->(n2);

MATCH (n1:`Person`{`ID`:"36025008000"}), (n2:`Article`{`ID`:"34871818382"}) CREATE (n1)-[r:`authorOf`]->(n2);
MATCH (n1:`Person`{`ID`:"40038817800"}), (n2:`Article`{`ID`:"34871818382"}) CREATE (n1)-[r:`authorOf`]->(n2);


MATCH (n1:`Person`{`ID`:"deleteAuthor1"}), (n2:`Article`{`ID`:"deleteArticle1"}) CREATE (n1)-[r:`authorOf`]->(n2);

MATCH (n1:`Person`{`ID`:"deleteAuthor2"}), (n2:`Article`{`ID`:"deleteArticle2"}) CREATE (n1)-[r:`authorOf`]->(n2);
MATCH (n1:`Person`{`ID`:"deleteAuthor3"}), (n2:`Article`{`ID`:"deleteArticle2"}) CREATE (n1)-[r:`authorOf`]->(n2);


MATCH (n1:`Person`{`ID`:"deleteAuthor4"}), (n2:`Article`{`ID`:"deleteArticle3"}) CREATE (n1)-[r:`authorOf`]->(n2);

MATCH (n1:`Person`{`ID`:"deleteAuthor5"}), (n2:`Article`{`ID`:"deleteArticle4"}) CREATE (n1)-[r:`authorOf`]->(n2);
MATCH (n1:`Person`{`ID`:"deleteAuthor6"}), (n2:`Article`{`ID`:"deleteArticle4"}) CREATE (n1)-[r:`authorOf`]->(n2);
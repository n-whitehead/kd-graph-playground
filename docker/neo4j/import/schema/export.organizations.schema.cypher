CREATE CONSTRAINT ON (node:`Organization`) ASSERT node.`ID` IS UNIQUE;
CREATE CONSTRAINT ON (node:`Article`) ASSERT node.`ID` IS UNIQUE;
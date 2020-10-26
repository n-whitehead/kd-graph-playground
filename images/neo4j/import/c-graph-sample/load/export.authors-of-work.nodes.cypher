CREATE (:`Person` {`ID`:"16024936000"});
CREATE (:`Article`:`Work` {`ID`:"15019709787", `publishedDate`:"20160101"});

CREATE (:`Person` {`ID`:"26024985600"});
CREATE (:`Person` {`ID`:"36025008000"});
CREATE (:`Book`:`Work` {`ID`:"25019709788", `publishedDate`:"20140101"});

CREATE (:`Person` {`ID`:"40038817800"});
// Person 3 also authored this work
CREATE (:`Chapter`:`Work` {`ID`:"34871818382", `publishedDate`:"20120101"});

CREATE (:`Person` {`ID`:"57196835747"});

// For these, the article nodes will be 'detach deleted'
CREATE (:`Person` {`ID`:"deleteAuthor1"});
CREATE (:`Article`:`Work` {`ID`:"deleteWork1", `publishedDate`:"20100101"});

CREATE (:`Person` {`ID`:"deleteAuthor2"});
CREATE (:`Person` {`ID`:"deleteAuthor3"});
CREATE (:`Chapter`:`Work` {`ID`:"deleteWork2", `publishedDate`:"20080101"});

// For these, the relationship authorOf only will be deleted
CREATE (:`Person` {`ID`:"deleteAuthor4"});
CREATE (:`Book`:`Work` {`ID`:"deleteWork3", `publishedDate`:"20100101"});

CREATE (:`Person` {`ID`:"deleteAuthor5"});
CREATE (:`Person` {`ID`:"deleteAuthor6"});
CREATE (:`Article`:`Work` {`ID`:"deleteWork4", `publishedDate`:"20080101"});
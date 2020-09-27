CREATE (:`Person` {`ID`:"16024936000"});
CREATE (:`Article`:`Work` {`ID`:"15019709787", `publishedDate`:"20160101"});

CREATE (:`Person` {`ID`:"26024985600"});
CREATE (:`Person` {`ID`:"36025008000"});
CREATE (:`Article`:`Work` {`ID`:"25019709788", `publishedDate`:"20140101"});

CREATE (:`Person` {`ID`:"40038817800"});
// Person 3 also authored this article
CREATE (:`Article`:`Work` {`ID`:"34871818382", `publishedDate`:"20120101"});

CREATE (:`Person` {`ID`:"57196835747"});

// For these, the article nodes will be 'detach deleted'
CREATE (:`Person` {`ID`:"deleteAuthor1"});
CREATE (:`Article`:`Work` {`ID`:"deleteArticle1", `publishedDate`:"20100101"});

CREATE (:`Person` {`ID`:"deleteAuthor2"});
CREATE (:`Person` {`ID`:"deleteAuthor3"});
CREATE (:`Article`:`Work` {`ID`:"deleteArticle2", `publishedDate`:"20080101"});

// For these, the relationship authorOf only will be deleted
CREATE (:`Person` {`ID`:"deleteAuthor4"});
CREATE (:`Article`:`Work` {`ID`:"deleteArticle3", `publishedDate`:"20100101"});

CREATE (:`Person` {`ID`:"deleteAuthor5"});
CREATE (:`Person` {`ID`:"deleteAuthor6"});
CREATE (:`Article`:`Work` {`ID`:"deleteArticle4", `publishedDate`:"20080101"});
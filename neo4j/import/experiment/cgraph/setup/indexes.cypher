//Neosemantics constraints
CREATE CONSTRAINT n10s_unique_uri IF NOT EXISTS ON (r:Resource) ASSERT r.uri IS UNIQUE;

//Entity indexes
CREATE INDEX person_id_index IF NOT EXISTS FOR (n:Person) on (n.ID);
CREATE INDEX work_id_index IF NOT EXISTS FOR (n:Work) on (n.ID);
CREATE INDEX organization_id_index IF NOT EXISTS FOR (n:Organization) on (n.ID);
CREATE INDEX journal_id_index IF NOT EXISTS FOR (n:Journal) on (n.ID);
CREATE INDEX article_id_index IF NOT EXISTS FOR (n:Article) on (n.ID);
CREATE INDEX book_id_index IF NOT EXISTS FOR (n:Book) on (n.ID);
CREATE INDEX chapter_id_index IF NOT EXISTS FOR (n:Chapter) on (n.ID);
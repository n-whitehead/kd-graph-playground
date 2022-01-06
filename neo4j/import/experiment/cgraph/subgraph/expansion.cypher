/*
  Qualities in a "good" start node:
    1. High pagerank score (if we decide to use pagerank as a qualifier)
    2. Dense local subgraph (D = 2(R) / N(N-1), where 0.6<D<0.9

  First, we choose a set of k Works in the graph, such that for each Work node w_i in [w_0,...,w_k], 0<=i<=k, there is
  no path of length z between any of the Work nodes. Ideally, z will represent a value 1 larger than our subgraph size.
*/
MATCH p=(w:Work)





MATCH (a:Label { id:1 })
//USING INDEX a:Label(id)
CALL apoc.path.expandConfig(a,{relationshipFilter:'REL', bfs:true, uniqueness:"NODE_GLOBAL"})
YIELD path
WITH a, LAST(NODES(path)) as b
RETURN b
WITH COLLECT(subgraphNode) as subgraph, COLLECT(id(subgraphNode)) as ids
CALL apoc.algo.cover(ids) YIELD rel
WITH subgraph, COLLECT(rel) as rels


// https://neo4j.com/labs/apoc/4.3/overview/apoc.algo/apoc.algo.cover/
// apoc.algo.cover(nodes :: ANY?) :: (rel :: RELATIONSHIP?)
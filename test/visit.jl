using DagSort

A = Cell("A");
B = Cell("B");
C = Cell("C");
D = Cell("D");
E = Cell("E");
F = Cell("F");
G = Cell("G");
H = Cell("H");

addkid(A, B);addkid(A, H);
addkid(B, C);addkid(B, D);
addkid(C, D);addkid(C, E);
addkid(D, F);
addkid(E, G);
addkid(F, G);
addkid(G, H);

visit_by_bfs(A)
visit_by_dfs(A)

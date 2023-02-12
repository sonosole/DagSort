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

sort_by_bfs(A)


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

sort_by_dfs(A)




A = Cell("A");
B = Cell("B");
C = Cell("C");
D = Cell("D");
E = Cell("E");
F = Cell("F");
G = Cell("G");
H = Cell("H");

addkid(A, B);
addkid(B, C);addkid(B, D);addkid(B, E);
addkid(C, D);addkid(C, G);
addkid(E, H);
addkid(F, C);

sort_by_bfs(A)

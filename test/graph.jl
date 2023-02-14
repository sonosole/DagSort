using DagSort


"""
                      ┌───┐
               ┌──────┤ A ├──────┐
               │      └─┬─┘      │
               ▼        ▼        ▼
    ┌───┐    ┌─┴─┐    ┌─┴─┐    ┌─┴─┐
    │ E ├─◄──┤ D ├─◄──┤ C ├─◄──┤ B │
    └───┘    └─┬─┘    └─┬─┘    └─┬─┘
               ▼        ▼        ▼
             ┌─┴─┐    ┌─┴─┐    ┌─┴─┐
             │ H │    │ G │    │ F │
             └───┘    └───┘    └───┘
"""
function poolgraph()
    A = Cell("A");
    B = Cell("B");
    C = Cell("C");
    D = Cell("D");
    E = Cell("E");
    F = Cell("F");
    G = Cell("G");
    H = Cell("H");

    addkid(A, B);addkid(A, C);addkid(A, D);
    addkid(B, C);addkid(B, F);
    addkid(C, D);addkid(C, G);
    addkid(D, E);addkid(D, H);

    return A
end


"""
             ┌───┐    ┌───┐    ┌───┐
             │ C │    │ B │    │ A │
             └─┬─┘    └─┬─┘    └─┬─┘
               ▼        ▼        ▼
    ┌───┐    ┌─┴─┐    ┌─┴─┐    ┌─┴─┐
    │ G ├─◄──┤ F ├─◄──┤ E ├─◄──┤ D │
    └───┘    └─┬─┘    └─┬─┘    └─┬─┘
               ▼        ▼        ▼
             ┌─┴─┐    ┌─┴─┐    ┌─┴─┐
             │ J │    │ I │    │ H │
             └───┘    └───┘    └───┘
"""
function multihead()
    A = Cell("A");
    B = Cell("B");
    C = Cell("C");
    D = Cell("D");
    E = Cell("E");
    F = Cell("F");
    G = Cell("G");
    H = Cell("H");
    I = Cell("I");
    J = Cell("J");

    addkid(A, D);
    addkid(B, E);
    addkid(C, F);
    addkid(D, E);addkid(D, H);
    addkid(E, F);addkid(E, I);
    addkid(F, G);addkid(F, J);
    return A,B,C
end
